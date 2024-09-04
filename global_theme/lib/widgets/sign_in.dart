import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';

class SignInForm extends StatelessWidget {
  const SignInForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(FlutterI18n.translate(context, 'email')),
        const TextField(),
        const SizedBox(height: 20),
        Text(FlutterI18n.translate(context, 'password')),
        const TextField(
          obscureText: true,
        ),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: () {},
          child: Text(FlutterI18n.translate(context, 'sign_in')),
        ),
      ],
    );
  }
}
