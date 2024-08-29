import 'package:flutter/material.dart';
import 'package:responsive/widgets/contact_list.dart';

import '../widgets/chat_page.dart';

class SmallScreenLayout extends StatefulWidget {
  const SmallScreenLayout({super.key});

  @override
  State<SmallScreenLayout> createState() => _SmallScreenLayoutState();
}

class _SmallScreenLayoutState extends State<SmallScreenLayout> {
  final List<BottomNavigationBarItem> bottomBarItems = const [
    BottomNavigationBarItem(icon: Icon(Icons.message), label: "Messages"),
    BottomNavigationBarItem(icon: Icon(Icons.contacts), label: "Contacts"),
    BottomNavigationBarItem(icon: Icon(Icons.settings), label: "Settings")
  ];

  final List<Widget> _pages = [];

  int selectedIndex = 0;

  void _onContactSelected() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const ChatPage(),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _pages.addAll([
      ContactList(onContactTap: _onContactSelected),
      const Scaffold(
        body: Center(
          child: Text("This is contact page"),
        ),
      ),
      const Scaffold(
        body: Center(
          child: Text("This is setting page"),
        ),
      )
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          // Use a Row for horizontal alignment
          mainAxisAlignment:
              MainAxisAlignment.spaceAround, // Center the children
          children: [
            const Text(
              // Display the "Chat App" title
              "Chat App",
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(
              width: 20,
            ),
            Expanded(
              child: TextFormField(
                decoration: const InputDecoration(
                    hintText: "Search...", suffix: Icon(Icons.search)),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: bottomBarItems,
        onTap: (index) => setState(() {
          selectedIndex = index;
        }),
        currentIndex: selectedIndex,
      ),
      body: _pages[selectedIndex],
    );
  }
}
