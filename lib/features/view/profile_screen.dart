import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ghapfy_team_app/controller/ui_controller/get_user_profile.dart';
import 'package:ghapfy_team_app/controller/ui_controller/logout_contorller.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late final ProfileController controller;
  late final LogoutController logController;

  @override
  void initState() {
    super.initState();
    controller = Get.put(ProfileController());
    logController = Get.put(LogoutController());

    // Optionally, you can manually call fetchUserProfile if needed
    controller.fetchUserProfile();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        final user = controller.userProfile.value?.data;

        if (user == null) {
          return const Center(child: Text('Failed to load profile'));
        }

        return SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Avatar
              CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage(
                  user.avatarUrl ?? 'https://via.placeholder.com/150',
                ),
              ),
              const SizedBox(height: 16),

              // Name
              Text(
                user.name ?? 'No Name',
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 8),

              // Email
              Text(
                user.email ?? 'No Email',
                style: TextStyle(
                  color: Colors.grey[600],
                ),
              ),

              const SizedBox(height: 16),

              // Location
              if (user.location != null)
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.location_on, size: 18, color: Colors.grey),
                    const SizedBox(width: 4),
                    Text(
                      user.location!,
                      style: TextStyle(color: Colors.grey[700]),
                    ),
                  ],
                ),

              const SizedBox(height: 16),

              // Rank
              if (user.rank != null)
                Chip(
                  label: Text(user.rank!),
                  backgroundColor: Colors.amber.withOpacity(0.2),
                ),

              const SizedBox(height: 16),

              // Intro
              if (user.intro != null)
                Text(
                  user.intro!,
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 16),
                ),

              const SizedBox(height: 24),

              // Followers and Followings
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildCountColumn('Followings', user.totalFollwings ?? 0),
                  const SizedBox(width: 32),
                  _buildCountColumn('Followers', user.totalFollowers ?? 0),
                ],
              ),

              const SizedBox(height: 24),

              // Roles
              if (user.roles != null && user.roles!.isNotEmpty)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'Roles',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    // You can list roles here if you want
                  ],
                ),

              const SizedBox(height: 40),

              // Update Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: () {
                  
                  },
                  icon: const Icon(Icons.edit),
                  label: const Text('Update Profile'),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    textStyle: const TextStyle(fontSize: 16),
                  ),
                ),
              ),

              const SizedBox(height: 12),

              // Logout Button
              SizedBox(
                width: double.infinity,
                child: OutlinedButton.icon(
                  onPressed: () {
                    _showLogoutDialog(context, logController);
                  },
                  icon: const Icon(Icons.logout),
                  label: const Text('Logout'),
                  style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    textStyle: const TextStyle(fontSize: 16),
                  ),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }

  Widget _buildCountColumn(String label, int count) {
    return Column(
      children: [
        Text(
          '$count',
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(
            color: Colors.grey[600],
          ),
        ),
      ],
    );
  }

  void _showLogoutDialog(BuildContext context, LogoutController logController) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Logout'),
        content: const Text('Are you sure you want to logout?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () async {
              await logController.logout(context);
           
            },
            child: const Text('Logout'),
          ),
        ],
      ),
    );
  }
}
