import 'package:basic_animations/widgets/animated_opacity.dart';
import 'package:flutter/material.dart';

class AnimatedOpacityPage extends StatefulWidget {
  const AnimatedOpacityPage({super.key});

  @override
  State<AnimatedOpacityPage> createState() => _AnimatedOpacityPageState();
}

class _AnimatedOpacityPageState extends State<AnimatedOpacityPage> {
  @override
  Widget build(BuildContext context) {
    return const AnimatedOpacityWidget();
  }
}
