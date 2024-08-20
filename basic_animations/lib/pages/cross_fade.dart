import 'package:basic_animations/widgets/animated_cross_fade.dart';
import 'package:flutter/material.dart';

class CrossFadePage extends StatefulWidget {
  const CrossFadePage({super.key});

  @override
  State<CrossFadePage> createState() => _CrossFadePageState();
}

class _CrossFadePageState extends State<CrossFadePage> {
  @override
  Widget build(BuildContext context) {
    return const AnimatedCrossFadeWidget();
  }
}
