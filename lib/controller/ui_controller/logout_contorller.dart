import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:ghapfy_team_app/controller/service_controller/log_out_service.dart';

class LogoutController extends GetxController {
  final LogoutService _logoutService = LogoutService();

  var isLoading = false.obs;
  var message = ''.obs;

  Future<void> logout(BuildContext context) async {
    // Show loading indicator with EasyLoading
    EasyLoading.show(status: 'Logging out...');
    
    isLoading.value = true;
    message.value = '';

    try {
      final result = await _logoutService.logoutUser();
      if (result != null && result.status == 'success') {
        message.value = result.data ?? "Logged out successfully.";


        EasyLoading.showSuccess(message.value);

        Get.offAllNamed('/login'); 

      } else {
        message.value = "Logout failed. Try again.";
        
        EasyLoading.showError(message.value);
      }
    } catch (e) {
      message.value = e.toString();
      
   
      EasyLoading.showError(message.value);
    } finally {
     
      EasyLoading.dismiss();
      isLoading.value = false;
    }
  }
}
