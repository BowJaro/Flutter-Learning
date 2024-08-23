import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MyPostControlButtons extends StatefulWidget {
  const MyPostControlButtons({super.key});

  @override
  State<MyPostControlButtons> createState() => _MyPostControlButtonsState();
}

class _MyPostControlButtonsState extends State<MyPostControlButtons> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        MyButtonWithIconAndText(
          content: "36",
          iconData: Icons.favorite,
          onPress: () {},
        ),
        MyButtonWithIconAndText(
          content: "106",
          iconData: Icons.comment,
          onPress: () {},
        ),
        MyButtonWithIconAndText(
          content: "36",
          iconData: Icons.share,
          onPress: () {},
        ),
      ],
    );
  }
}

class MyButtonWithIconAndText extends StatefulWidget {
  final IconData iconData;
  final String content;
  final onPress;
  const MyButtonWithIconAndText(
      {super.key,
      required this.iconData,
      required this.content,
      required this.onPress});

  @override
  State<MyButtonWithIconAndText> createState() =>
      _MyButtonWithIconAndTextState();
}

class _MyButtonWithIconAndTextState extends State<MyButtonWithIconAndText> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: widget.onPress,
        child: Row(
          children: [
            Icon(widget.iconData),
            const SizedBox(
              width: 5,
            ),
            Text(widget.content)
          ],
        ));
  }
}
