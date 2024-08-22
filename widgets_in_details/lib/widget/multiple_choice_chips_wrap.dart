import 'package:flutter/material.dart';

class MultipleChoiceChipsWrap extends StatefulWidget {
  const MultipleChoiceChipsWrap({super.key});

  @override
  State<MultipleChoiceChipsWrap> createState() =>
      _MultipleChoiceChipsWrapState();
}

class _MultipleChoiceChipsWrapState extends State<MultipleChoiceChipsWrap> {
  final List<String> _chipLabels = [
    "This is the first chip",
    "This is the second chip",
    "This is the third chip",
    "This is the fourth chip",
  ];

  final List<bool> _isSelected = List.generate(4, (index) => false);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Wrap(spacing: 6, children: buildChoiceChips()),
    );
  }

  List<Widget> buildChoiceChips() {
    final List<Widget> chips = [];

    for (int i = 0; i < _chipLabels.length; i++) {
      chips.add(
        ChoiceChip(
          label: Text(_chipLabels[i]),
          selected: _isSelected[i],
          selectedColor: Colors.red,
          onSelected: (value) {
            setState(() {
              _isSelected[i] = value;
            });
          },
        ),
      );
    }

    return chips;
  }
}
