import 'package:basic_tabs/widgets/left_drawer.dart';
import 'package:flutter/material.dart';

import 'birthdays.dart';
import 'gratitude.dart';
import 'reminders.dart';
import 'slivers.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 4);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: TabBarView(
        controller: _tabController,
        children: const [
          Birthdays(),
          Gratitude(),
          Reminders(),
          SilverPage(),
        ],
      )),
      appBar: AppBar(),
      bottomNavigationBar: SafeArea(
        child: TabBar(
          controller: _tabController,
          labelColor: Colors.black54,
          unselectedLabelColor: Colors.black38,
          tabs: const [
            Tab(
              icon: Icon(Icons.cake),
              text: 'List View',
            ),
            Tab(
              icon: Icon(Icons.sentiment_satisfied),
              text: 'Grid View',
            ),
            Tab(
              icon: Icon(Icons.access_alarm),
              text: 'Stack',
            ),
            Tab(
              icon: Icon(Icons.grid_3x3),
              text: 'Sliver',
            ),
          ],
        ),
      ),
      drawer: const LeftDrawerWidget(),
    );
  }
}
