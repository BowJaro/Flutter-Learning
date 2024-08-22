import 'package:flutter/material.dart';
import 'package:widgets_in_details/widget/banner.dart';
import 'package:widgets_in_details/widget/bottom_sheet.dart';
import 'package:widgets_in_details/widget/cliprect.dart';
import 'package:widgets_in_details/widget/cupertino_picker.dart';
import 'package:widgets_in_details/widget/cupertino_segmented_control.dart';
import 'package:widgets_in_details/widget/dropdown_button.dart';
import 'package:widgets_in_details/widget/multiple_choice_chips_list_view.dart';
import 'package:widgets_in_details/widget/multiple_choice_chips_wrap.dart';
import 'package:widgets_in_details/widget/slider.dart';

import 'chip.dart';
import 'cupertino_slider.dart';
import 'toggle_buttons.dart';

class ScrollableTabsExample extends StatefulWidget {
  const ScrollableTabsExample({super.key});

  @override
  _ScrollableTabsExampleState createState() => _ScrollableTabsExampleState();
}

class _ScrollableTabsExampleState extends State<ScrollableTabsExample>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  List<Tab> tabs = const [
    Tab(text: 'Banner'),
    Tab(text: 'Bottom sheet'),
    Tab(text: 'Chip'),
    Tab(text: 'ClipRect'),
    Tab(text: 'Cupertino picker'),
    Tab(text: 'Cupertino Segmented Control'),
    Tab(text: 'Cupertino Slider'),
    Tab(text: 'Dropdown button'),
    Tab(text: 'ChoiceChip - ListView'),
    Tab(text: 'ChoiceChip - Wrap'),
    Tab(text: 'Slider'),
    Tab(text: 'Toggle buttons'),
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: tabs.length, vsync: this);
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
        title: const Text('Scrollable Tabs'),
        bottom: TabBar(
          controller: _tabController,
          isScrollable: true,
          tabs: tabs,
          padding: EdgeInsets.zero,
        ),
      ),
      body: Center(
        child: TabBarView(
          controller: _tabController,
          children: const [
            MyBanner(),
            MyBottomSheet(),
            MyChipList(),
            ClipRectExample(),
            CupertinoPickerExample(),
            CupertinoSegmentedControlExample(),
            CustomCupertinoSlider(),
            MaterialDropdownExample(),
            MultipleChoiceChipsListView(),
            MultipleChoiceChipsWrap(),
            CustomMaterialSlider(),
            MaterialToggleButtonsExample(),
          ],
        ),
      ),
    );
  }
}
