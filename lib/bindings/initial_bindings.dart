import 'package:get/get.dart';

import '../controller/ui_controller/auth_controller.dart';
import '../controller/ui_controller/pots_controller.dart';
import '../controller/ui_controller/profile_controller.dart';


class InitialBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AuthController());
    Get.lazyPut(() => PostController());
    Get.lazyPut(() => ProfileController());
  }
}
