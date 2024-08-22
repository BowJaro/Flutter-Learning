import 'package:flutter/material.dart';
import 'package:journal/pages/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Journal',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        canvasColor: Colors.pink.shade200,
        bottomAppBarTheme: const BottomAppBarTheme(color: Colors.deepPurple),
      ),
      home: const Home(),
    );
  }
}
