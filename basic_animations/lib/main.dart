import 'package:basic_animations/pages/animated_balloon1.dart';
import 'package:basic_animations/pages/animated_balloon2.dart';
import 'package:basic_animations/pages/animated_container.dart';
import 'package:basic_animations/pages/animated_opacity.dart';
import 'package:basic_animations/pages/cross_fade.dart';
import 'package:flutter/material.dart';

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
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  final List<Widget> _tabs = [
    const AnimatedContainerPage(),
    const CrossFadePage(),
    const AnimatedOpacityPage(),
    const AnimatedBalloon1Page(),
    const AnimatedBalloon2Page()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: _tabs[_selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.transparent,
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.first_page),
              label: 'Container',
              backgroundColor: Colors.transparent,
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.face_rounded),
                label: 'Cross Fade',
                backgroundColor: Colors.transparent),
            BottomNavigationBarItem(
                icon: Icon(Icons.inbox),
                label: 'Opacity',
                backgroundColor: Colors.transparent),
            BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'Ballon 1',
                backgroundColor: Colors.transparent),
            BottomNavigationBarItem(
                icon: Icon(Icons.notification_add),
                label: 'Ballon 2',
                backgroundColor: Colors.transparent),
          ],
        ),
      ),
    );
  }
}
