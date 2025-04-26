import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:ghapfy_team_app/features/models/login_model.dart';

class LoginServiceController {

  static final LoginServiceController _instance = LoginServiceController._internal();

  factory LoginServiceController() {
    return _instance;
  }

  LoginServiceController._internal();

  final String _baseUrl = 'https://task.theghapfy.com'; // replace with your actual API URL

  Future<LogInModel> postLogin({required String email, required String password}) async {
    final url = Uri.parse('$_baseUrl/v1/user/login');

    try {
      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'email': email,
          'password': password,
        }),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return LogInModel.fromJson(data);
      } else {
        throw Exception('Failed to login: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Login error: $e');
    }
  }
}
