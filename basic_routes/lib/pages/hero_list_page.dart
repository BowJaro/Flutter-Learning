import 'package:flutter/material.dart';

import 'hero_detail_page.dart';

class HeroListPage extends StatefulWidget {
  const HeroListPage({super.key});

  @override
  State<HeroListPage> createState() => _HeroListPageState();
}

class _HeroListPageState extends State<HeroListPage> {
  final List<String> _items = ['Father', 'Mother', 'Friend'];
  final String _imagePath = 'assets/images/balloon.png';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: const Text('Hero List'),
        backgroundColor: Colors.grey,
      ),
      body: ListView.builder(
        itemCount: _items.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Hero(
              tag: _items[index],
              child: Image.asset(
                _imagePath,
                width: 50,
                height: 50,
              ),
            ),
            title: Text(_items[index]),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => HeroDetailPage(item: _items[index]),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
