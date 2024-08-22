import 'package:flutter/material.dart';

class ClipRectExample extends StatelessWidget {
  const ClipRectExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ClipRect(
          child: Image.asset(
            'assets/images/windows11.jpg',
            width: 150,
            height: 300,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
