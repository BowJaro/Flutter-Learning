import 'package:flutter/material.dart';

class DiscoverTab extends StatefulWidget {
  const DiscoverTab({super.key});

  @override
  State<DiscoverTab> createState() => _DiscoverTabState();
}

class _DiscoverTabState extends State<DiscoverTab> {
  @override
  Widget build(BuildContext context) {
    return const Center(
        child: Column(
      children: [
        GridViewWidget(),
        Text(
          "Rotate screen to change grid view",
          style: TextStyle(color: Colors.red),
        ),
        SizedBox(
          height: 10,
        ),
        OrientationBuilderWidget()
      ],
    ));
  }
}

class GridViewWidget extends StatelessWidget {
  const GridViewWidget({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    Orientation _orientation = MediaQuery.of(context).orientation;
    return GridView.count(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: _orientation == Orientation.portrait ? 2 : 4,
      childAspectRatio: 5.0,
      children: List.generate(8, (int index) {
        return Text(
          "Grid $index",
          textAlign: TextAlign.center,
          style: const TextStyle(color: Colors.white),
        );
      }),
    );
  }
}

class OrientationBuilderWidget extends StatelessWidget {
  const OrientationBuilderWidget({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
      builder: (BuildContext context, Orientation orientation) {
        return orientation == Orientation.portrait
            ? Container(
                alignment: Alignment.center,
                color: Colors.yellow,
                height: 100.0,
                width: 100.0,
                child: const Text('Portrait'),
              )
            : Container(
                alignment: Alignment.center,
                color: Colors.lightGreen,
                height: 100.0,
                width: 200.0,
                child: const Text('Landscape'),
              );
      },
    );
  }
}
