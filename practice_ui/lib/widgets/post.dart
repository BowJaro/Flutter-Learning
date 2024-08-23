import 'package:flutter/material.dart';
import 'package:practice_ui/widgets/post_control_buttons.dart';

class MyPost extends StatefulWidget {
  const MyPost({super.key});

  @override
  State<MyPost> createState() => _MyPostState();
}

class _MyPostState extends State<MyPost> {
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
            trailing: IconButton(
              icon: Icon(Icons.more_horiz),
              onPressed: () {},
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: Text(
                textAlign: TextAlign.justify,
                overflow: TextOverflow.ellipsis,
                maxLines: 3,
                "This is a really really long description which will last for longer than 3 lines in the widget which will cause overflows. That's why we need to use max lines to solve it and use 3 dots at the end if it overflows"),
          ),
          Image.asset("assets/images/wallpaper.webp"),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: MyPostControlButtons(),
          )
        ],
      ),
    );
  }
}
