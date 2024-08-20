import 'package:flutter/material.dart';

import 'grid_icons.dart';

class GridViewBuilderWidget extends StatelessWidget {
  const GridViewBuilderWidget({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    List<IconData> iconList = GridIcons().getIconList();
    return GridView.builder(
      itemCount: 20,
      padding: const EdgeInsets.all(8),
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 150),
      itemBuilder: (BuildContext context, int index) {
        return Card(
          color: Colors.lightGreen.shade50,
          margin: const EdgeInsets.all(8),
          child: InkWell(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(
                  iconList[index],
                  size: 48,
                  color: Colors.lightGreen,
                ),
                const Divider(),
                Text(
                  'Index ${index + 1}',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 16,
                  ),
                )
              ],
            ),
            onTap: () {},
          ),
        );
      },
    );
  }
}
