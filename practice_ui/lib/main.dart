import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:practice_ui/pages/bookmark.dart';
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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.amber),
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
  List<Widget> tabs = const [HomePage(), NewsFeedPage(), BookmarkPage()];
  List<BottomNavigationBarItem> tabItems = const [
    BottomNavigationBarItem(
      icon: Icon(Icons.location_on),
      label: 'Explore',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.feed),
      label: 'Feed',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.bookmark),
      label: 'Saved',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CupertinoTabScaffold(
          tabBar: CupertinoTabBar(items: tabItems),
          tabBuilder: (BuildContext context, int index) {
            return tabs[index];
          }),
    );
  }
}
