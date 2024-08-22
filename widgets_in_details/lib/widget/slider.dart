import 'package:flutter/material.dart';

class CustomMaterialSlider extends StatefulWidget {
  const CustomMaterialSlider({super.key});

  @override
  _CustomMaterialSliderState createState() => _CustomMaterialSliderState();
}

class _CustomMaterialSliderState extends State<CustomMaterialSlider> {
  double _currentValue = 0;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Value: ${_currentValue.toStringAsFixed(2)}',
            style: const TextStyle(fontSize: 16),
          ),
          Slider(
            value: _currentValue,
            min: 0,
            max: 100,
            onChanged: (newValue) {
              setState(() {
                _currentValue = newValue;
              });
            },
          ),
        ],
      ),
    );
  }
}
