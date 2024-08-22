import 'package:flutter/material.dart';

class MaterialToggleButtonsExample extends StatefulWidget {
  const MaterialToggleButtonsExample({super.key});

  @override
  _MaterialToggleButtonsExampleState createState() =>
      _MaterialToggleButtonsExampleState();
}

class _MaterialToggleButtonsExampleState
    extends State<MaterialToggleButtonsExample> {
  final List<bool> _selectedOptions = [true, false, false];
  String _selectedText = "";

  @override
  Widget build(BuildContext context) {
    _selectedText = _selectedOptions.asMap().entries.fold(
        "",
        (String text, MapEntry<int, bool> entry) =>
            text + (entry.value ? "Option ${entry.key + 1}" : ""));

    return Scaffold(
      appBar: AppBar(title: const Text('Material Toggle Buttons Example')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ToggleButtons(
              isSelected: _selectedOptions,
              onPressed: (int index) {
                setState(() {
                  for (int i = 0; i < _selectedOptions.length; i++) {
                    _selectedOptions[i] = i == index;
                  }
                  _selectedText = _selectedOptions.asMap().entries.fold(
                      "",
                      (String text, MapEntry<int, bool> entry) =>
                          text +
                          (entry.value ? "Option ${entry.key + 1}" : ""));
                });
              },
              children: const <Widget>[
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('Option 1'),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('Option 2'),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('Option 3'),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Text(
              'Selected Options: $_selectedText',
              style: const TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
