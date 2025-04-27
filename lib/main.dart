import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:ghapfy_team_app/controller/ui_controller/auth_ui_controller.dart';
import 'package:ghapfy_team_app/controller/ui_controller/get_user_profile.dart';
import 'package:ghapfy_team_app/features/view/login_screen.dart';

void main(){
  Get.put(AuthController());
  Get.put(ProfileController());
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Talent  App',
      debugShowCheckedModeBanner: false,
     home: LoginScreen(),
      builder: EasyLoading.init(),
     
    );
  }
}
