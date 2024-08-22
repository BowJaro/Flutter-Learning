import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CupertinoPickerExample extends StatefulWidget {
  const CupertinoPickerExample({super.key});

  @override
  _CupertinoPickerExampleState createState() => _CupertinoPickerExampleState();
}

class _CupertinoPickerExampleState extends State<CupertinoPickerExample> {
  int _selectedValue = 0;

  final List<String> _pickerItems = [
    "Option 1",
    "Option 2",
    "Option 3",
    "Option 4",
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Selected Option: ${_pickerItems[_selectedValue]}',
          style: const TextStyle(fontSize: 18),
        ),
        const SizedBox(height: 20),
        CupertinoButton(
          child: const Text("Select Option"),
          onPressed: () {
            showCupertinoModalPopup(
              context: context,
              builder: (_) => Container(
                height: 300,
                color: Colors.white,
                child: CupertinoPicker(
                  backgroundColor: Colors.white,
                  itemExtent: 32.0,
                  onSelectedItemChanged: (int index) {
                    setState(() {
                      _selectedValue = index;
                    });
                  },
                  children: _pickerItems
                      .map((item) => Center(child: Text(item)))
                      .toList(),
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
