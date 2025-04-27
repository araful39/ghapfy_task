import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:ghapfy_team_app/controller/service_controller/login_service_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ghapfy_team_app/features/models/login_model.dart';

class AuthController extends GetxController {
  var isLoggedIn = false.obs;
  var username = ''.obs;
  final LoginServiceController _loginService = LoginServiceController();

  Future<void> login(String email, String password) async {
    EasyLoading.show(status: 'Logging in...');

    try {
      LogInModel user = await _loginService.postLogin(email: email, password: password);

      final token = user.data?.accessToken; // Update based on your JSON structure
      if (token != null) {
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString('auth_token', token);
        isLoggedIn.value = true;
        EasyLoading.dismiss();
        Get.offAllNamed('/feed');
      } else {
        throw Exception('Token not found in response');
      }
    } catch (e) {
      EasyLoading.showError('Login failed: ${e.toString()}');
    }
  }

  void logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('auth_token');

    isLoggedIn.value = false;
    username.value = '';
    Get.offAllNamed('/login');
  }

  Future<void> loadUserFromPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('auth_token');

    if (token != null) {
      isLoggedIn.value = true;
      // Optionally decode token or fetch profile data using token
    }
  }
}
