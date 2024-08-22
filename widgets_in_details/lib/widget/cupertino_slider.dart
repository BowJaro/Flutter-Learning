import 'package:flutter/cupertino.dart';

class CustomCupertinoSlider extends StatefulWidget {
  const CustomCupertinoSlider({super.key});

  @override
  _CustomCupertinoSliderState createState() => _CustomCupertinoSliderState();
}

class _CustomCupertinoSliderState extends State<CustomCupertinoSlider> {
  double _currentValue = 0;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onHorizontalDragUpdate: (details) {
          // Handle slider gestures
          final dx = details.delta.dx;
          final newValue = _currentValue + dx / 10; // Adjust sensitivity
          setState(() {
            _currentValue =
                newValue.clamp(0, 10); // Ensure value stays within bounds
          });
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CupertinoSlider(
              value: _currentValue,
              min: 0,
              max: 10,
              divisions: 10,
              onChanged: (selectedValue) {
                setState(() {
                  _currentValue = selectedValue;
                });
              },
            ),
            Text(
              'Value: ${_currentValue.toStringAsFixed(2)}',
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
