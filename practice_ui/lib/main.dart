import 'package:flutter/material.dart';
import 'package:practice_ui/pages/home.dart';
import 'package:practice_ui/pages/news_feed.dart';

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
      title: 'Practice UI',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyPageManager(),
    );
  }
}

class MyPageManager extends StatefulWidget {
  const MyPageManager({super.key});

  @override
  State<MyPageManager> createState() => _MyPageManagerState();
}

class _MyPageManagerState extends State<MyPageManager> {
  List<Widget> tabs = const [HomePage(), NewsFeedPage()];
  List<BottomNavigationBarItem> tabItems = const [
    BottomNavigationBarItem(
      icon: Icon(Icons.location_on),
      label: 'Home',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.feed),
      label: 'Feed',
    ),
  ];
  int selectedTab = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: tabs[selectedTab],
      bottomNavigationBar: BottomNavigationBar(
        items: tabItems,
        onTap: (value) {
          setState(() {
            selectedTab = value;
            print("This is selected tab $selectedTab");
          });
        },
      ),
    );
  }
}
