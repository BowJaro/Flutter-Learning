import 'package:flutter/material.dart';

import '../widgets/autocomplete.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox.expand(
        child: Stack(
          children: [
            // Background image
            Positioned.fill(
              child: Image.asset(
                "assets/images/map.png",
                fit: BoxFit.cover,
              ),
            ),
            // Autocomplete field
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10, top: 50),
              child: MyAutocomplete(
                options: const [
                  'Apple',
                  'Banana',
                  'Cherry',
                  'Date',
                  'Fig',
                  'Grape',
                  'Mango',
                  'Orange',
                  'Kiwi',
                  'Pineapple',
                  'Raspberry',
                  'Blueberry',
                  'Watermelon',
                  'Papaya',
                  'Peach',
                  'Pear',
                  'Plum',
                  'Apricot',
                  'Guava',
                  'Blackberry',
                ],
                onSelected: (String selection) {
                  print('You selected: $selection');
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
