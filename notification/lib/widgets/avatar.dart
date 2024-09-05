import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notification/controllers/avatar_controller.dart';

class Avatar extends StatelessWidget {
  Avatar({super.key, required this.imageUrl, required this.onUpload});

  final String? imageUrl;
  final void Function(String) onUpload;
  final AvatarController avatarController = Get.put(AvatarController());

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          ClipOval(
            child: imageUrl == null || imageUrl!.isEmpty
                ? Container(
                    width: 150,
                    height: 150,
                    color: Colors.grey,
                    child: const Center(child: Text('No Image')),
                  )
                : Image.network(
                    imageUrl!,
                    width: 150,
                    height: 150,
                    fit: BoxFit.cover,
                  ),
          ),
          Positioned(
            bottom: -15,
            right: -15,
            child: Obx(() => IconButton(
                  onPressed: avatarController.isLoading.value
                      ? null
                      : () => avatarController.uploadImage(onUpload),
                  icon: const Icon(Icons.edit),
                )),
          ),
        ],
      ),
    );
  }
}
