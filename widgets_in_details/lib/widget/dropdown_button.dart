import 'package:flutter/material.dart';

class MaterialDropdownExample extends StatefulWidget {
  const MaterialDropdownExample({super.key});

  @override
  State<MaterialDropdownExample> createState() =>
      _MaterialDropdownExampleState();
}

class _MaterialDropdownExampleState extends State<MaterialDropdownExample> {
  String _selectedValue = "Option 1";

  final List<String> _dropdownItems = [
    "Option 1",
    "Option 2",
    "Option 3",
    "Option 4",
  ];

  @override
  Widget build(BuildContext context) {
    return Center(
      child: DropdownButton<String>(
        value: _selectedValue,
        onChanged: (String? newValue) {
          setState(() {
            _selectedValue = newValue!;
          });
        },
        items: _dropdownItems.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
      ),
    );
  }
}
