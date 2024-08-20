import 'package:basic_tabs/pages/weather_page.dart';
import 'package:flutter/material.dart';

import '../pages/birthdays.dart';
import '../pages/gratitude.dart';
import '../pages/reminders.dart';

class MenuListTileWidget extends StatefulWidget {
  const MenuListTileWidget({super.key});

  @override
  State<MenuListTileWidget> createState() => _MenuListTileWidgetState();
}

class _MenuListTileWidgetState extends State<MenuListTileWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ListTile(
          leading: const Icon(Icons.cake),
          title: const Text('Birthdays'),
          onTap: () {
            Navigator.pop(context);
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const Birthdays(),
              ),
            );
          },
        ),
        ListTile(
          leading: const Icon(Icons.sentiment_satisfied),
          title: const Text('Gratitude'),
          onTap: () {
            Navigator.pop(context);
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const Gratitude(),
              ),
            );
          },
        ),
        ListTile(
          leading: const Icon(Icons.alarm),
          title: const Text('Reminders'),
          onTap: () {
            Navigator.pop(context);
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const Reminders(),
              ),
            );
          },
        ),
        const Divider(color: Colors.grey),
        ListTile(
          leading: const Icon(Icons.cloud),
          title: const Text('Weather'),
          onTap: () {
            Navigator.pop(context);
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const WeatherPage(),
              ),
            );
          },
        ),
      ],
    );
  }
}
