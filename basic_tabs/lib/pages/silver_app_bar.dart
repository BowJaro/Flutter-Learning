import 'package:flutter/material.dart';

class SliverAppBarWidget extends StatelessWidget {
  const SliverAppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const SliverAppBar(
      backgroundColor: Colors.green,
      forceElevated: true,
      expandedHeight: 250.0,
      flexibleSpace: FlexibleSpaceBar(
        title: Text(
          'Parallax Effect',
          style: TextStyle(color: Colors.white),
        ),
        background: Image(
          image: AssetImage('assets/images/windows11.jpg'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
