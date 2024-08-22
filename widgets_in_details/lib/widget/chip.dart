import 'package:flutter/material.dart';

class MyChipList extends StatefulWidget {
  const MyChipList({super.key});

  @override
  State<MyChipList> createState() => _MyChipListState();
}

class _MyChipListState extends State<MyChipList> {
  final List<String> _chipList =
      List.generate(10, (index) => "This is a Chip widget $index");

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView.builder(
        itemCount: _chipList.length,
        itemBuilder: (BuildContext context, int index) {
          return Chip(
            label: Text(
              _chipList[index],
              style: const TextStyle(color: Colors.red),
            ),
            onDeleted: () {
              setState(() {
                _chipList.removeAt(index);
              });
            },
          );
        },
      ),
    );
  }
}
