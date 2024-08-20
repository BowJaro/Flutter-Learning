import 'package:flutter/material.dart';

class RowWithCardWidget extends StatelessWidget {
  const RowWithCardWidget({
    super.key,
    required this.index,
  });
  final int index;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: const Icon(
          Icons.flight,
          size: 48.0,
          color: Colors.lightBlue,
        ),
        title: Text('Airplane $index'),
        subtitle: const Text('Very Cool'),
        trailing: Text(
          '${index * 7}%',
          style: const TextStyle(color: Colors.lightBlue),
        ),
        //selected: true,
        onTap: () {},
      ),
    );
  }
}
