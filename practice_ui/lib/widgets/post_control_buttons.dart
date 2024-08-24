import 'package:flutter/material.dart';
import 'package:practice_ui/widgets/reaction_buttons.dart';

class MyPostControlButtons extends StatelessWidget {
  const MyPostControlButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        MyReactionButton(
          onReactionChanged: (reaction) {},
        ),
        ElevatedButton(
            onPressed: () {},
            child: Row(
              children: [
                Icon(Icons.comment),
                SizedBox(
                  width: 5,
                ),
                Text("5")
              ],
            )),
        ElevatedButton(
            onPressed: () {},
            child: Row(
              children: [
                Icon(Icons.share),
                SizedBox(
                  width: 5,
                ),
                Text("5")
              ],
            ))
      ],
    );
  }
}
