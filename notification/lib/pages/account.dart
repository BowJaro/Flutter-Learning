import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notification/controllers/account_controller.dart';
import '../widgets/avatar.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    final profileController = Get.put(ProfileController());

    return Scaffold(
      appBar: AppBar(title: const Text('Profile')),
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 12),
        children: [
          Obx(() => Avatar(
                imageUrl: profileController.avatarUrl.value,
                onUpload: profileController.onUpload,
              )),
          const SizedBox(height: 18),
          TextFormField(
            controller: profileController.usernameController,
            decoration: const InputDecoration(labelText: 'User Name'),
          ),
          const SizedBox(height: 18),
          TextFormField(
            controller: profileController.websiteController,
            decoration: const InputDecoration(labelText: 'Website'),
          ),
          const SizedBox(height: 18),
          Obx(() => ElevatedButton(
                onPressed: profileController.loading.value
                    ? null
                    : profileController.updateProfile,
                child: Text(
                    profileController.loading.value ? 'Saving...' : 'Update'),
              )),
          const SizedBox(height: 18),
          TextButton(
            onPressed: profileController.signOut,
            child: const Text('Sign Out'),
          ),
        ],
      ),
    );
  }
}
