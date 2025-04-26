import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ghapfy_team_app/controller/ui_controller/feed_controller.dart';
import '../../features/models/feed_model.dart';

class FeedScreen extends StatelessWidget {
  const FeedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final FeedController feedController = Get.put(FeedController());

    return Scaffold(
      appBar: AppBar(
        title: const Text('Feeds'),
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

  Widget _buildPostCard(BuildContext context, Result post, FeedController controller) {
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
                  icon: Icon(
                   Icons.favorite ,
                    color:  Colors.red,
                  ),
                  onPressed: () {},),
                Text('${post.totalReactionCount ?? 0}'),
                
                const SizedBox(width: 16),
                
                // Comment button
                IconButton(
                  icon: const Icon(Icons.comment),
                  onPressed: () => _showCommentsDialog(context, post),
                ),
                Text('${post.totalComment ?? 0}'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _showCommentsDialog(BuildContext context, Result post) {
    // showDialog(
    //   context: context,
    //   builder: (context) => AlertDialog(
    //     title: const Text('Comments'),
    //     content: SizedBox(
    //       width: double.maxFinite,
    //       child: ListView.builder(
    //         shrinkWrap: true,
    //         itemCount: post.comments?.length ?? 0,
    //         itemBuilder: (context, index) {
    //           final comment = post.comments![index];
    //           return ListTile(
    //             title: Text(comment.user?.name ?? 'Unknown'),
    //             subtitle: Text(comment.text),
    //           );
    //         },
    //       ),
    //     ),
    //     actions: [
    //       TextField(
    //         decoration: const InputDecoration(
    //           hintText: 'Add a comment...',
    //           border: OutlineInputBorder(),
    //         ),
    //         onSubmitted: (text) {
    //           // Add comment logic here
    //           Navigator.pop(context);
    //         },
    //       ),
    //     ],
    //   ),
    // );
  
  }

  void _showCreatePostDialog(BuildContext context, FeedController controller) {
    final textController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
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
            onPressed: () {
              // controller.createPost(textController.text);
              Navigator.pop(context);
            },
            child: const Text('Post'),
          ),
        ],
      ),
    );
  }
}