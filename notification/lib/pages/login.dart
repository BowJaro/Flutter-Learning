import 'package:get/get.dart';
import 'package:notification/controllers/login_controller.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final loginController = Get.put(LoginController());

    return Scaffold(
      appBar: AppBar(title: const Text('Sign In')),
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 12),
        children: [
          const Text('Sign in via the magic link with your email below'),
          const SizedBox(height: 18),
          TextFormField(
            controller: loginController.emailController,
            decoration: const InputDecoration(labelText: 'Email'),
          ),
          const SizedBox(height: 18),
          Obx(() => ElevatedButton(
                onPressed: loginController.isLoading.value
                    ? null
                    : loginController.signIn,
                child: Text(loginController.isLoading.value
                    ? 'Sending...'
                    : 'Send Magic Link'),
              )),
        ],
      ),
    );
  }
}
