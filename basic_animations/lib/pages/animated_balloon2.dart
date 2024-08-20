import 'package:basic_animations/widgets/animated_balloon_2.dart';
import 'package:flutter/material.dart';

class AnimatedBalloon2Page extends StatefulWidget {
  const AnimatedBalloon2Page({super.key});

  @override
  State<AnimatedBalloon2Page> createState() => _AnimatedBalloon2PageState();
}

class _AnimatedBalloon2PageState extends State<AnimatedBalloon2Page> {
  @override
  Widget build(BuildContext context) {
    return const AnimatedBalloonWidget2();
  }
}
