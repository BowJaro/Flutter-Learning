import 'package:flutter/material.dart';

class FatherPage extends StatefulWidget {
  final bool isChecked;

  const FatherPage({super.key, required this.isChecked});

  @override
  State<FatherPage> createState() => _FatherPageState();
}

class _FatherPageState extends State<FatherPage> {
  late bool isChecked;

  @override
  void initState() {
    super.initState();
    isChecked = widget.isChecked;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Father'),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pop(context, isChecked);
            },
            icon: const Icon(Icons.save),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RadioListTile(
              title: const Text('Checked'),
              value: true,
              groupValue: isChecked,
              onChanged: (value) {
                setState(() {
                  isChecked = value!;
                });
              },
            ),
            RadioListTile(
              title: const Text('Unchecked'),
              value: false,
              groupValue: isChecked,
              onChanged: (value) {
                setState(() {
                  isChecked = value!;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
