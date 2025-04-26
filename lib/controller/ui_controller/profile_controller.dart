import 'package:get/get.dart';

class ProfileController extends GetxController {
  var bio = 'This is your bio.'.obs;

  void updateBio(String newBio) {
    bio.value = newBio;
  }
}
