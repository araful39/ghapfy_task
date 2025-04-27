import 'package:get/get.dart';
import 'package:ghapfy_team_app/controller/service_controller/get_profile_service_controller.dart';
import 'package:ghapfy_team_app/features/models/user_profile_model.dart';

class ProfileController extends GetxController {
  var isLoading = false.obs;
  var userProfile = Rxn<UserProfileModel>();

  final GetUserProfileService _service = GetUserProfileService();

  @override
  void onInit() {
    super.onInit();
    fetchUserProfile();
  }

  Future<void> fetchUserProfile() async {
    try {
      isLoading.value = true;
      final profile = await _service.getUserProfile();
      userProfile.value = profile;
    } catch (e) {
      Get.snackbar('Error', e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}
