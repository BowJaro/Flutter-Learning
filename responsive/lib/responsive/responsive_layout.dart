import 'package:flutter/material.dart';

class ResponsiveLayout extends StatelessWidget {
  final Widget largeScreenLayout;
  final Widget smallScreenLayout;
  const ResponsiveLayout(
      {super.key,
      required this.largeScreenLayout,
      required this.smallScreenLayout});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth > 900) {
        return largeScreenLayout;
      }
      return smallScreenLayout;
    });
  }
}
