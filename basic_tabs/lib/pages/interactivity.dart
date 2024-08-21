import 'package:basic_tabs/pages/dismiss.dart';
import 'package:basic_tabs/widgets/drag_drop.dart';
import 'package:basic_tabs/widgets/move_zoom.dart';
import 'package:flutter/material.dart';

class InteractivityPage extends StatefulWidget {
  const InteractivityPage({super.key});

  @override
  State<InteractivityPage> createState() => _InteractivityPageState();
}

class _InteractivityPageState extends State<InteractivityPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  var tabs = const [
    Tab(
      icon: Icon(Icons.move_down),
      text: "Drag & Drop",
    ),
    Tab(
      icon: Icon(Icons.zoom_in),
      text: "Move & Zoom",
    ),
    Tab(
      icon: Icon(Icons.view_array),
      text: "Dismiss",
    ),
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: tabs.length);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        bottom: TabBar(
          tabs: tabs,
          controller: _tabController,
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: const [DragDropWidget(), MoveZoomWidget(), DismissPage()],
      ),
    );
  }
}
