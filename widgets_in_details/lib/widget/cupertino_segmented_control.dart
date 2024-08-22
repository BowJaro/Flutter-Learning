import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CupertinoSegmentedControlExample extends StatefulWidget {
  const CupertinoSegmentedControlExample({super.key});

  @override
  _CupertinoSegmentedControlExampleState createState() =>
      _CupertinoSegmentedControlExampleState();
}

class _CupertinoSegmentedControlExampleState
    extends State<CupertinoSegmentedControlExample> {
  String _selectedValue = "Option 1";

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: CupertinoSegmentedControl<String>(
            children: const {
              "Option 1": Padding(
                padding: EdgeInsets.all(18.0),
                child: Text("Option 1"),
              ),
              "Option 2": Padding(
                padding: EdgeInsets.all(8.0),
                child: Text("Option 2"),
              ),
              "Option 3": Padding(
                padding: EdgeInsets.all(8.0),
                child: Text("Option 3"),
              ),
            },
            onValueChanged: (value) {
              setState(() {
                _selectedValue = value;
              });
            },
            groupValue: _selectedValue,
          ),
        ),
        const SizedBox(height: 20),
        Text(
          'Selected Value: $_selectedValue',
          style: const TextStyle(fontSize: 18),
        ),
      ],
    );
  }
}
