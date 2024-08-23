import 'package:flutter/material.dart';
import 'package:practice_ui/widgets/post.dart';

class NewsFeedPage extends StatefulWidget {
  const NewsFeedPage({super.key});

  @override
  State<NewsFeedPage> createState() => _NewsFeedPageState();
}

class _NewsFeedPageState extends State<NewsFeedPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: ListView.builder(
      itemBuilder: (context, index) => Column(
        children: [
          MyPost(),
          const Divider(), // Add a divider after each MyPost
        ],
      ),
      itemCount: 10,
    ));
  }
}
