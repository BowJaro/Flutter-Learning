import 'package:flutter/material.dart';
import 'package:practice_ui/widgets/post_control_buttons.dart';

import 'list_image_view.dart';

class MyPost extends StatefulWidget {
  final List<String> imagePaths = [
    "assets/images/map.png",
    "assets/images/wallpaper.webp",
    "assets/images/windows11.jpg",
    "assets/images/balloon.png",
  ];

  MyPost({super.key});

  @override
  State<MyPost> createState() => _MyPostState();
}

class _MyPostState extends State<MyPost> {
  String description =
      "This is a really really long description which will last for longer than 3 lines in the widget which will cause overflows. That's why we need to use max lines to solve it and use 3 dots at the end if it overflows";
  bool showFullDescription = false;
  bool isLongText = false;

  @override
  void initState() {
    super.initState();
    if (description.length > 200) {
      setState(() {
        isLongText = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ListTile(
              leading: CircleAvatar(
                backgroundImage: AssetImage("assets/images/map.png"),
              ),
              title: Text("Pham Phuoc Huy"),
              subtitle: Text("6 days ago"),
              trailing: getPostMoreButton()),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  textAlign: TextAlign.start,
                  maxLines:
                      isLongText ? (showFullDescription ? null : 3) : null,
                  description,
                ),
                getSeeMore()
              ],
            ),
          ),
          ListImageView(imagePaths: widget.imagePaths),
          const Padding(
            padding: EdgeInsets.all(10.0),
            child: MyPostControlButtons(),
          )
        ],
      ),
    );
  }

  PopupMenuButton<String> getPostMoreButton() {
    return PopupMenuButton<String>(
      itemBuilder: (BuildContext context) {
        return <PopupMenuEntry<String>>[
          const PopupMenuItem<String>(
            value: 'save',
            child: Text('Save'),
          ),
          const PopupMenuItem<String>(
            value: 'report',
            child: Text('Report'),
          ),
          const PopupMenuItem<String>(
            value: 'block',
            child: Text('Block author'),
          ),
          const PopupMenuItem<String>(
            value: 'follow',
            child: Text('Follow author'),
          ),
        ];
      },
      onSelected: (String choice) {},
      child: const Icon(Icons.more_horiz),
    );
  }

  Widget getSeeMore() {
    if (!isLongText) {
      return const SizedBox(width: 0, height: 0);
    }
    return GestureDetector(
      onTap: () {
        setState(() {
          showFullDescription = !showFullDescription;
        });
      },
      child: Text(
        showFullDescription ? 'See less' : '... See more',
        style: const TextStyle(fontWeight: FontWeight.w900),
      ),
    );
  }
}
