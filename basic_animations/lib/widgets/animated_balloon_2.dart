import 'package:flutter/material.dart';

class AnimatedBalloonWidget2 extends StatefulWidget {
  const AnimatedBalloonWidget2({super.key});

  @override
  State<AnimatedBalloonWidget2> createState() => _AnimatedBalloonWidget2State();
}

class _AnimatedBalloonWidget2State extends State<AnimatedBalloonWidget2>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animationFloatUp;
  late Animation<double> _animationGrowSize;
  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(duration: const Duration(seconds: 4), vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double mediaQueryHeight = MediaQuery.of(context).size.height;
    double balloonHeight = mediaQueryHeight / 2;
    double balloonWidth = MediaQuery.of(context).size.width / 2;
    double balloonBottomLocation = mediaQueryHeight - balloonHeight;

    _animationFloatUp = Tween(begin: balloonBottomLocation, end: 0.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.5, 1, curve: Curves.fastOutSlowIn),
      ),
    );

    _animationGrowSize = Tween(begin: 50.0, end: balloonWidth).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.0, 0.5, curve: Curves.elasticInOut),
      ),
    );
    return AnimatedBuilder(
      animation: _animationFloatUp,
      child: GestureDetector(
        onTap: () {
          if (_controller.isCompleted) {
            _controller.reverse();
          } else {
            _controller.forward();
          }
        },
        child: Image.asset('assets/images/balloon.png',
            height: balloonHeight, width: balloonWidth),
      ),
      builder: (context, child) {
        return Container(
          margin: EdgeInsets.only(
            top: _animationFloatUp.value,
          ),
          width: _animationGrowSize.value,
          child: child,
        );
      },
    );
  }
}
