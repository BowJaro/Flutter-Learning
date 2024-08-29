import 'package:flutter/material.dart';
import 'package:responsive/data.dart';

class LargeAppBar extends StatelessWidget {
  const LargeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 104,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage(contacts[0]['imageUrl']),
                ),
                Row(
                  children: [
                    IconButton(
                        onPressed: () {}, icon: const Icon(Icons.contacts)),
                    IconButton(
                        onPressed: () {}, icon: const Icon(Icons.settings)),
                  ],
                )
              ],
            ),
            TextFormField(
              decoration: const InputDecoration(
                  hintText: "Search...", suffixIcon: Icon(Icons.search)),
            )
          ],
        ),
      ),
    );
  }
}
