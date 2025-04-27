import 'package:get/get.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:ghapfy_team_app/controller/service_controller/create_comment_service_controller.dart';
import 'package:ghapfy_team_app/features/models/comment_create_model.dart';


class CreateCommentController extends GetxController {
  final CreateCommentService _commentService = CreateCommentService();

  final commentCreateModel = Rxn<CommentCreateModel>();
  final isCreating = false.obs;

  Stream<CommentCreateModel> get commentCreateStream => commentCreateModel.stream
      .where((model) => model != null)
      .map((model) => model!);

  Future<void> createNewComment({
    required String body,
    required int postId,
  }) async {
    try {
      isCreating.value = true;
      EasyLoading.show(status: 'Creating comment...');
      
      final createdComment = await _commentService.createComment(
        body: body,
        postId: postId,
      );
      
      commentCreateModel.value = createdComment;
      
      EasyLoading.dismiss();
      EasyLoading.showSuccess('Comment created successfully!');
    } catch (e) {
      EasyLoading.dismiss();
      EasyLoading.showError('Failed to create comment: ${e.toString()}');
      rethrow;
    } finally {
      isCreating.value = false;
    }
  }

  void clearCommentState() {
    commentCreateModel.value = null;
  }
}