import 'package:flutter/material.dart';

class AnimatedBalloonWidget extends StatefulWidget {
  const AnimatedBalloonWidget({super.key});

  @override
  State<AnimatedBalloonWidget> createState() => _AnimatedBalloonWidgetState();
}

class _AnimatedBalloonWidgetState extends State<AnimatedBalloonWidget>
    with TickerProviderStateMixin {
  late AnimationController _controllerFloatUp;
  late AnimationController _controllerGrowSize;
  late Animation<double> _animationFloatUp;
  late Animation<double> _animationGrowSize;
  @override
  void initState() {
    super.initState();
    _controllerFloatUp =
        AnimationController(duration: const Duration(seconds: 2), vsync: this);
    _controllerGrowSize =
        AnimationController(duration: const Duration(seconds: 2), vsync: this);
  }

  @override
  void dispose() {
    _controllerFloatUp.dispose();
    _controllerGrowSize.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double mediaQueryHeight = MediaQuery.of(context).size.height - 92;
    double balloonHeight = mediaQueryHeight / 2;
    double balloonWidth = MediaQuery.of(context).size.width / 2;
    double balloonBottomLocation = mediaQueryHeight - balloonHeight;

    _animationFloatUp = Tween(begin: balloonBottomLocation, end: 0.0).animate(
        CurvedAnimation(parent: _controllerFloatUp, curve: Curves.linear));
    _animationGrowSize = Tween(begin: 50.0, end: balloonWidth).animate(
        CurvedAnimation(parent: _controllerGrowSize, curve: Curves.linear));
    // _controllerFloatUp.forward();
    // _controllerGrowSize.forward();
    print(
        "Bottom: ${_animationFloatUp.value} - Height: $balloonHeight - bottom: $balloonBottomLocation");

    return AnimatedBuilder(
      animation: _animationFloatUp,
      child: GestureDetector(
        onTap: () {
          if (_controllerFloatUp.isCompleted) {
            _controllerFloatUp.reverse();
            _controllerGrowSize.reverse();
          } else {
            _controllerFloatUp.forward();
            _controllerGrowSize.forward();
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
