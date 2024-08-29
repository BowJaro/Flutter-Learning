import 'package:flutter/material.dart';
import 'package:responsive/responsive/responsive_layout.dart';
import 'package:responsive/screens/large_screen_layout.dart';
import 'package:responsive/screens/small_screen_layout.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Responsive Layout',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const ResponsiveLayout(
          largeScreenLayout: LargeScreenLayout(),
          smallScreenLayout: SmallScreenLayout()),
    );
  }
}
