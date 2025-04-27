import 'package:get/get.dart';
import 'package:ghapfy_team_app/controller/ui_controller/get_user_profile.dart';

import '../controller/ui_controller/auth_ui_controller.dart';


class InitialBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AuthController());
    // Get.lazyPut(() => PostController());
    Get.lazyPut(() => ProfileController());
  }
}
