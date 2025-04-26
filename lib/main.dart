import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:ghapfy_team_app/controller/ui_controller/auth_controller.dart';
import 'package:ghapfy_team_app/controller/ui_controller/pots_controller.dart';
import 'package:ghapfy_team_app/controller/ui_controller/profile_controller.dart';

import 'features/routes/app_routes.dart';
void main(){
  Get.put(AuthController());
  Get.put(PostController());
  Get.put(ProfileController());
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Talent Share App',
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.login,
      builder: EasyLoading.init(),
      getPages: AppRoutes.routes,
    );
  }
}
