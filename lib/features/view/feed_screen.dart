import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:ghapfy_team_app/controller/ui_controller/create_comment_ui_controller.dart';
import 'package:ghapfy_team_app/controller/ui_controller/create_post_ui_controller.dart';
import 'package:ghapfy_team_app/controller/ui_controller/feed_ui_controller.dart';
import 'package:ghapfy_team_app/features/view/profile_screen.dart';
import '../../features/models/feed_model.dart';

class FeedScreen extends StatefulWidget {
  const FeedScreen({super.key});

  @override
  State<FeedScreen> createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {
  final FeedController feedController = Get.put(FeedController());
  final CreatePostController createPostController = Get.put(
    CreatePostController(),
  );

  final CreateCommentController commentController = Get.put(
    CreateCommentController(),
  );
  final TextEditingController createCommentController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Feeds'),
        actions: [GestureDetector(onTap: () {
Get.to(()=>ProfileScreen());

        }, child: Icon(Icons.person))],
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () => _showCreatePostDialog(context, feedController),
        child: const Icon(Icons.add),
      ),
      body: StreamBuilder<FeedModel>(
        stream: feedController.postStream,
        builder: (context, snapshot) {
          if (feedController.isLoading.value) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }

          if (!snapshot.hasData) {
            return const Center(child: Text('No posts found.'));
          }

          final posts = snapshot.data!.data?.result ?? [];

          return RefreshIndicator(
            onRefresh: feedController.fetchPosts,
            child: ListView.builder(
              itemCount: posts.length,
              itemBuilder: (context, index) {
                final post = posts[index];
                return _buildPostCard(context, post, feedController);
              },
            ),
          );
        },
      ),
    );
  }

  Widget _buildPostCard(
    BuildContext context,
    Result post,
    FeedController controller,
  ) {
    return Card(
      margin: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            title: Text(post.user?.name ?? 'Unknown User'),
            subtitle: Text(post.body ?? ''),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Row(
              children: [
                // Like button
                IconButton(
                  icon: Icon(Icons.favorite, color: Colors.red),
                  onPressed: () {},
                ),
                Text('${post.totalReactionCount ?? 0}'),

                const SizedBox(width: 16),

                IconButton(
                  icon: const Icon(Icons.comment),
                  onPressed: () => _showCommentsDialog(postId: post.id),
                ),
                Text('${post.totalComment ?? 0}'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _showCommentsDialog({required postId}) {
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: const Text('Comments'),
            content: Column(
              mainAxisSize: MainAxisSize.min, // Important for dialog content
              children: [
                // Uncomment if you want to show existing comments
                // SizedBox(
                //   height: 200, // Fixed height for the list
                //   child: ListView.builder(
                //     shrinkWrap: true,
                //     itemCount: post.comments?.length ?? 0,
                //     itemBuilder: (context, index) {
                //       final comment = post.comments![index];
                //       return ListTile(
                //         title: Text(comment.user?.name ?? 'Unknown'),
                //         subtitle: Text(comment.text),
                //       );
                //     },
                //   ),
                // ),
                // SizedBox(height: 10),
                TextField(
                  controller: createCommentController,
                  decoration: const InputDecoration(
                    hintText: 'Add a comment...',
                    border: OutlineInputBorder(),
                  ),
                  maxLines: 3,
                ),
              ],
            ),
            actions: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop(); // Close the dialog
                      createCommentController.clear();
                    },
                    child: const Text('Cancel'),
                  ),
                  const SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: () {
                      // Handle comment submission
                      if (createCommentController.text.isNotEmpty) {
                        commentController.createNewComment(
                          body: createCommentController.text,
                          postId: postId,
                        );
                        Navigator.of(context).pop(); // Close the dialog
                        createCommentController.clear();
                      }
                    },
                    child: const Text('Post'),
                  ),
                ],
              ),
            ],
          ),
    );
  }

  void _showCreatePostDialog(BuildContext context, FeedController controller) {
    final textController = TextEditingController();

    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: const Text('Create Post'),
            content: TextField(
              controller: textController,
              decoration: const InputDecoration(
                hintText: "What's on your mind?",
                border: OutlineInputBorder(),
              ),
              maxLines: 3,
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Cancel'),
              ),
              ElevatedButton(
                onPressed: () async {
                  final text = textController.text.trim();

                  if (text.isEmpty) {
                    EasyLoading.showError('Post cannot be empty!');
                    return;
                  }

                  EasyLoading.show(status: 'Creating post...');
                  try {
                    await CreatePostController().createNewPost(text);
                    Navigator.pop(context);
                  } catch (e) {
                    // Error already handled inside createNewPost
                  } finally {
                    EasyLoading.dismiss();
                  }
                },
                child: const Text('Post'),
              ),
            ],
          ),
    );
  }
}
