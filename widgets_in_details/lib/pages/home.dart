import 'package:flutter/material.dart';
import '../widget/scroll_tabs.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(child: ScrollableTabsExample()),
    );
  }
}
