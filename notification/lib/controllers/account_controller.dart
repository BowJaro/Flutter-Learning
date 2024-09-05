import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:notification/pages/login.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../main.dart';

class ProfileController extends GetxController {
  final usernameController = TextEditingController();
  final websiteController = TextEditingController();

  var avatarUrl = ''.obs;
  var loading = true.obs;

  @override
  void onInit() {
    super.onInit();
    getProfile();
  }

  Future<void> getProfile() async {
    loading.value = true;

    try {
      final userId = supabase.auth.currentSession!.user.id;
      final data =
          await supabase.from('profiles').select().eq('id', userId).single();
      usernameController.text = (data['username'] ?? '') as String;
      websiteController.text = (data['website'] ?? '') as String;
      avatarUrl.value = (data['avatar_url'] ?? '') as String;
    } on PostgrestException catch (error) {
      Get.snackbar('Error', error.message, snackPosition: SnackPosition.BOTTOM);
    } catch (error) {
      Get.snackbar('Error', 'Unexpected error occurred',
          snackPosition: SnackPosition.BOTTOM);
    } finally {
      loading.value = false;
    }
  }

  Future<void> updateProfile() async {
    loading.value = true;
    final userName = usernameController.text.trim();
    final website = websiteController.text.trim();
    final user = supabase.auth.currentUser;
    final updates = {
      'id': user!.id,
      'username': userName,
      'website': website,
      'updated_at': DateTime.now().toIso8601String(),
    };

    try {
      await supabase.from('profiles').upsert(updates);
      Get.snackbar('Success', 'Profile updated successfully!',
          snackPosition: SnackPosition.BOTTOM);
    } on PostgrestException catch (error) {
      Get.snackbar('Error', error.message, snackPosition: SnackPosition.BOTTOM);
    } catch (error) {
      Get.snackbar('Error', 'Unexpected error occurred',
          snackPosition: SnackPosition.BOTTOM);
    } finally {
      loading.value = false;
    }
  }

  Future<void> signOut() async {
    try {
      await supabase.auth.signOut();
      Get.off(() => const LoginPage());
    } on AuthException catch (error) {
      Get.snackbar('Error', error.message, snackPosition: SnackPosition.BOTTOM);
    } catch (error) {
      Get.snackbar('Error', 'Unexpected error occurred',
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  Future<void> onUpload(String imageUrl) async {
    try {
      final userId = supabase.auth.currentUser!.id;
      await supabase.from('profiles').upsert({
        'id': userId,
        'avatar_url': imageUrl,
      });
      avatarUrl.value = imageUrl;
      Get.snackbar('Success', 'Profile image updated!',
          snackPosition: SnackPosition.BOTTOM);
    } on PostgrestException catch (error) {
      Get.snackbar('Error', error.message, snackPosition: SnackPosition.BOTTOM);
    } catch (error) {
      Get.snackbar('Error', 'Unexpected error occurred',
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  @override
  void onClose() {
    usernameController.dispose();
    websiteController.dispose();
    super.onClose();
  }
}
