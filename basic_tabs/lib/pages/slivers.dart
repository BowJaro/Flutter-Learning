import 'package:flutter/material.dart';

import '../widgets/sliver_grid.dart';
import '../widgets/sliver_list.dart';
import 'silver_app_bar.dart';

class SilverPage extends StatelessWidget {
  const SilverPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CustomScrollView - Slivers'),
        elevation: 0.0,
      ),
      body: const CustomScrollView(
        slivers: <Widget>[
          SliverAppBarWidget(),
          SliverListWidget(),
          SliverGridWidget(),
        ],
      ),
    );
  }
}
