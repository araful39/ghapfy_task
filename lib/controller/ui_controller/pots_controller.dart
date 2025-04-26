import 'package:get/get.dart';
import '../../features/models/comment_model.dart';
import '../../features/models/post_model.dart';
import 'auth_controller.dart';

class PostController extends GetxController {
  var posts = <PostModel>[].obs;
  var selectedFilter = 'All'.obs;

  void addPost({
    required String content,
    List<Attachment>? attachments,
  }) {
    final id = DateTime.now().millisecondsSinceEpoch.toString();
    final user = Get.find<AuthController>().username.value;
    posts.insert(
      0,
      PostModel(
        id: id,
        author: user,
        content: content,
        ownerId: user,
        comments: [],
        likes: 0,
        attachments: attachments ?? [],
      ),
    );
  }

  void addComment(CommentModel comment) {
    final index = posts.indexWhere((p) => p.id == comment.postId);
    if (index != -1) {
      posts[index].comments.add(comment);
      posts.refresh();
    }
  }

  void toggleLike(String postId) {
    final index = posts.indexWhere((p) => p.id == postId);
    if (index != -1) {
      posts[index].likes++;
      posts.refresh();
    }
  }

  void setFilter(String type) {
    selectedFilter.value = type;
  }

  List<PostModel> get filteredPosts {
    if (selectedFilter.value == 'All') return posts;
    return posts
        .where((p) => p.attachments.any((a) => a.type == selectedFilter.value))
        .toList();
  }

  List<CommentModel> getCommentsForPost(String postId) {
    return posts.firstWhere((p) => p.id == postId).comments;
  }

  Future<String?> getUserIdByUsername(String username) async {
    // Dummy - replace with real backend query
    return username.isEmpty ? null : username;
  }
}
