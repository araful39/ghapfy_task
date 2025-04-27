import 'package:get/get.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:ghapfy_team_app/controller/service_controller/create_post_service_controller.dart';
import '../../features/models/create_post_model.dart';

class CreatePostController extends GetxController {
  final CreatePostService _createPostService = CreatePostService();

  final createPostModel = Rxn<CreatePostModel>();
  final isCreating = false.obs;

  Stream<CreatePostModel> get createPostStream => createPostModel.stream
      .where((model) => model != null)
      .map((model) => model!);

  Future<void> createNewPost(String postBody) async {
    try {
      isCreating.value = true;
      EasyLoading.show(status: 'Creating post...');
      final createdPost = await _createPostService.createPost(postBody: postBody);
      createPostModel.value = createdPost;

      EasyLoading.dismiss();
      EasyLoading.showSuccess('Post created successfully!');
    } catch (e) {
      EasyLoading.dismiss();
  
    } finally {
      isCreating.value = false;
    }
  }
}
