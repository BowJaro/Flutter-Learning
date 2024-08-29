import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:responsive/widgets/chat_page.dart';
import 'package:responsive/widgets/contact_list.dart';
import 'package:responsive/widgets/large_app_bar.dart';

class LargeScreenLayout extends StatelessWidget {
  const LargeScreenLayout({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
        body: Row(
      children: [
        SizedBox(
          width: width * 0.25,
          child: Column(
            children: [
              const LargeAppBar(),
              Expanded(
                  child: ContactList(
                onContactTap: () {},
              )),
            ],
          ),
        ),
        SizedBox(
          width: width * 0.75,
          child: const ChatPage(),
        )
      ],
    ));
  }
}
