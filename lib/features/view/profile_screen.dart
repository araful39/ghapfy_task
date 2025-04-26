import 'package:flutter/material.dart';
import 'package:get/get.dart';


import '../../controller/ui_controller/auth_controller.dart';
import '../../controller/ui_controller/profile_controller.dart';

class ProfileScreen extends StatelessWidget {
  final bioController = TextEditingController();

  ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final profile = Get.find<ProfileController>();
    final auth = Get.find<AuthController>();

    return Scaffold(
      appBar: AppBar(title: Text("Your Profile")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Obx(() => Text("Username: ${auth.username.value}", style: TextStyle(fontSize: 18))),
            SizedBox(height: 10),
            Obx(() => Text("Bio: ${profile.bio}", style: TextStyle(fontSize: 16))),
            TextField(controller: bioController, decoration: InputDecoration(labelText: "Update Bio")),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                profile.updateBio(bioController.text);
                bioController.clear();
              },
              child: Text("Update"),
            ),
          ],
        ),
      ),
    );
  }
}
