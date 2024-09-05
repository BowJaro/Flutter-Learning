import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notification/main.dart';
import 'package:notification/pages/account.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class LoginController extends GetxController {
  var isLoading = false.obs;
  var redirecting = false.obs;
  late final TextEditingController emailController = TextEditingController();
  late final StreamSubscription<AuthState> authStateSubscription;

  @override
  void onInit() {
    // Listening to AuthState changes
    authStateSubscription = supabase.auth.onAuthStateChange.listen(
      (data) {
        print("This is redirecting value ${redirecting.value}");
        if (redirecting.value) return;
        final session = data.session;
        print("This is session $session");
        if (session != null) {
          redirecting.value = true;
          Get.off(() => const AccountPage());
        }
      },
      onError: (error) {
        if (error is AuthException) {
          Get.snackbar('Error', error.message,
              snackPosition: SnackPosition.BOTTOM);
        } else {
          Get.snackbar('Error', 'Unexpected error occurred',
              snackPosition: SnackPosition.BOTTOM);
        }
      },
    );
    super.onInit();
  }

  Future<void> signIn() async {
    try {
      isLoading.value = true;
      print("This is before sign in");
      await supabase.auth.signInWithOtp(
        email: emailController.text.trim(),
        emailRedirectTo:
            kIsWeb ? null : 'io.supabase.flutterquickstart://login-callback/',
      );
      print("This is after sign in");
      Get.snackbar('Success', 'Check your email for a login link!',
          snackPosition: SnackPosition.BOTTOM);
      emailController.clear();
    } on AuthException catch (error) {
      print("This is auth error ${error.message}");
      Get.snackbar('Error', error.message, snackPosition: SnackPosition.BOTTOM);
    } catch (error) {
      print("This is error $error");
      Get.snackbar('Error', 'Unexpected error occurred',
          snackPosition: SnackPosition.BOTTOM);
    } finally {
      isLoading.value = false;
    }
  }

  @override
  void onClose() {
    emailController.dispose();
    authStateSubscription.cancel();
    super.onClose();
  }
}
