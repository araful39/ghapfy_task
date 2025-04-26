// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
//
// import '../../controller/ui_controller/auth_controller.dart';
// import '../../controller/ui_controller/pots_controller.dart';
//
// class CommentScreen extends StatelessWidget {
//   final commentController = TextEditingController();
//
//   CommentScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     final postId = Get.arguments as String;
//     final postController = Get.find<PostController>();
//     final auth = Get.find<AuthController>();
//
//     return Scaffold(
//       appBar: AppBar(title: Text("Comments")),
//       body: Column(
//         children: [
//           Expanded(
//             child: Obx(() {
//               final post = postController.posts.firstWhere((p) => p!.id == postId);
//               return ListView.builder(
//                 itemCount: post.comments.length,
//                 itemBuilder: (context, index) => ListTile(
//                   title: Text(post.comments[index]),
//                 ),
//               );
//             }),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Row(
//               children: [
//                 Expanded(child: TextField(controller: commentController)),
//                 IconButton(
//                   icon: Icon(Icons.send),
//                   onPressed: () {
//                     postController.addComment(postId, "${auth.username.value}: ${commentController.text}");
//                     commentController.clear();
//                   },
//                 )
//               ],
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }
