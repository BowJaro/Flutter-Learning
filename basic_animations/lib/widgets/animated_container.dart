import 'package:flutter/material.dart';

class AnimatedContainerWidget extends StatefulWidget {
  const AnimatedContainerWidget({super.key});

  @override
  State<AnimatedContainerWidget> createState() =>
      _AnimatedContainerWidgetState();
}

class _AnimatedContainerWidgetState extends State<AnimatedContainerWidget> {
  double _height = 100;
  double _width = 100;
  void _increaseWidth() {
    setState(() {
      _width = _width >= 320.0 ? 100.0 : _width += 40.0;
      _height = _height >= 420.0 ? 100.0 : _height += 50.0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        AnimatedContainer(
          duration: const Duration(milliseconds: 1000),
          curve: Curves.elasticOut,
          // color: Colors.amber,
          height: _height,
          width: _width,
          child: ElevatedButton(
            child: Text('Tap to\nGrow\nWidth: $_width\nHeight: $_height'),
            onPressed: () {
              _increaseWidth();
            },
          ),
        ),
      ],
    );
  }
}
