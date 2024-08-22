import 'package:flutter/material.dart';

class MultipleChoiceChipsListView extends StatefulWidget {
  const MultipleChoiceChipsListView({super.key});

  @override
  State<MultipleChoiceChipsListView> createState() =>
      _MultipleChoiceChipsListViewState();
}

class _MultipleChoiceChipsListViewState
    extends State<MultipleChoiceChipsListView> {
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
      child: ListView.builder(
        itemCount: _chipLabels.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 4.0),
            child: ChoiceChip(
              label: Text(_chipLabels[index]),
              selected: _isSelected[index],
              selectedColor: Colors.red,
              onSelected: (value) {
                setState(() {
                  _isSelected[index] = value;
                });
              },
            ),
          );
        },
        shrinkWrap: false,
      ),
    );
  }
}
