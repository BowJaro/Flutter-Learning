import 'package:flutter/material.dart';

class SliverGridWidget extends StatelessWidget {
  const SliverGridWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverSafeArea(
      sliver: SliverGrid(
        delegate: SliverChildBuilderDelegate(
          (BuildContext context, int index) {
            return Card(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Icon(
                    Icons.child_friendly,
                    size: 48.0,
                    color: Colors.lightGreen,
                  ),
                  const Divider(),
                  Text('Grid ${index + 1}'),
                ],
              ),
            );
          },
          childCount: 14,
        ),
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 150),
      ),
    );
  }
}
