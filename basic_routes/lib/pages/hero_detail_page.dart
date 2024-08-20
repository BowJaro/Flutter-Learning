import 'package:flutter/material.dart';

const String _imagePath = 'assets/images/wallpaper.jpg';

class HeroDetailPage extends StatelessWidget {
  final String item;

  const HeroDetailPage({required this.item, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(item),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Hero(
              tag: item,
              child: Image.asset(
                _imagePath,
                width: 200,
                height: 200,
              ),
            ),
            Text(
              item,
              style: const TextStyle(fontSize: 24),
            ),
          ],
        ),
      ),
    );
  }
}
