import 'package:basic_tabs/widgets/stack.dart';
import 'package:flutter/material.dart';

import '../widgets/stack_favorite.dart';

class Reminders extends StatelessWidget {
  const Reminders({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView.builder(
          itemCount: 7,
          itemBuilder: (BuildContext context, int index) {
            if (index.isEven) {
              return const StackWidget();
            } else {
              return const StackFavoriteWidget();
            }
          },
        ),
      ),
    );
  }
}
