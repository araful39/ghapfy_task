// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import '../../controller/ui_controller/pots_ui_controller.dart';

// class PostCreateScreen extends StatelessWidget {
//   final contentController = TextEditingController();

//   PostCreateScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final postController = Get.find<PostController>();
//     return Scaffold(
//       appBar: AppBar(title: Text("Share Talent")),
//       body: Padding(
//         padding: const EdgeInsets.all(16),
//         child: Column(
//           children: [
//             TextField(controller: contentController, decoration: InputDecoration(labelText: 'What’s your talent?')),
//             SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: () {
//                 // postController.addPost(contentController.text);
//                 Get.back();
//               },
//               child: Text("Post"),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
