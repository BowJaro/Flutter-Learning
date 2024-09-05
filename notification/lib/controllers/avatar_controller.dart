import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:notification/main.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AvatarController extends GetxController {
  var isLoading = false.obs;

  Future<void> uploadImage(void Function(String) onUpload) async {
    final picker = ImagePicker();
    final imageFile = await picker.pickImage(
      source: ImageSource.gallery,
      maxWidth: 300,
      maxHeight: 300,
    );
    if (imageFile == null) {
      return;
    }
    isLoading.value = true;

    try {
      final bytes = await imageFile.readAsBytes();
      final fileExt = imageFile.path.split('.').last;
      final fileName = '${DateTime.now().toIso8601String()}.$fileExt';
      final filePath = fileName;
      await supabase.storage.from('avatars').uploadBinary(
            filePath,
            bytes,
            fileOptions: FileOptions(contentType: imageFile.mimeType),
          );
      final imageUrlResponse = await supabase.storage
          .from('avatars')
          .createSignedUrl(filePath, 60 * 60 * 24 * 10);
      onUpload(imageUrlResponse);
    } on StorageException catch (error) {
      Get.snackbar('Error', error.message, snackPosition: SnackPosition.BOTTOM);
    } catch (error) {
      Get.snackbar('Error', 'Unexpected error occurred',
          snackPosition: SnackPosition.BOTTOM);
    } finally {
      isLoading.value = false;
    }
  }
}
