import 'package:flutter/material.dart';

class DragDropWidget extends StatefulWidget {
  const DragDropWidget({super.key});

  @override
  State<DragDropWidget> createState() => _DragDropWidgetState();
}

class _DragDropWidgetState extends State<DragDropWidget> {
  String _gestureDetected = "Ready";
  var _paintedColor = const Color(0);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
      children: <Widget>[
        _buildGestureDetector(),
        const Divider(
          color: Colors.black,
          height: 44.0,
        ),
        _buildDraggable(),
        const Divider(
          height: 40.0,
        ),
        _buildDragTarget(),
        const Divider(
          color: Colors.black,
        ),
      ],
    ));
  }

  GestureDetector _buildGestureDetector() {
    return GestureDetector(
      onTap: () {
        print('onTap');
        _displayGestureDetected('onTap');
      },
      onDoubleTap: () {
        print('onDoubleTap');
        _displayGestureDetected('onDoubleTap');
      },
      onLongPress: () {
        print('onLongPress');
        _displayGestureDetected('onLongPress');
      },
      onPanUpdate: (DragUpdateDetails details) {
        print('onPanUpdate: $details');
        _displayGestureDetected('onPanUpdate:\n$details');
      },
      // onVerticalDragUpdate: ((DragUpdateDetails details) {
      //   print('onVerticalDragUpdate: $details');
      //   _displayGestureDetected('onVerticalDragUpdate:\n$details');
      // }),
      //onHorizontalDragUpdate: (DragUpdateDetails details) {
      // print('onHorizontalDragUpdate: $details');
      // _displayGestureDetected('onHorizontalDragUpdate:\n$details');
      //},
      onHorizontalDragEnd: (DragEndDetails details) {
        print('onHorizontalDragEnd: $details');
        if (details.primaryVelocity != null) {
          if (details.primaryVelocity! < 0) {
            print('Dragging Right to Left: ${details.velocity}');
            _displayGestureDetected(
                'Dragging Right to Left: ${details.velocity}');
          } else if (details.primaryVelocity! > 0) {
            print('Dragging Left to Right: ${details.velocity}');
            _displayGestureDetected(
                'Dragging Left to Right: ${details.velocity}');
          }
        }
      },
      child: Container(
        color: Colors.lightGreen.shade100,
        width: double.infinity,
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: <Widget>[
            const Icon(
              Icons.access_alarm,
              size: 98.0,
            ),
            Text('$_gestureDetected'),
          ],
        ),
      ),
    );
  }

  void _displayGestureDetected(String gesture) {
    setState(() {
      _gestureDetected = gesture;
    });
  }

  Draggable<int> _buildDraggable() {
    return Draggable(
      childWhenDragging: const Icon(
        Icons.palette,
        color: Colors.grey,
        size: 48.0,
      ),
      feedback: const Icon(
        Icons.brush,
        color: Colors.green,
        size: 80.0,
      ),
      data: Colors.blue.value,
      child: const Column(
        children: <Widget>[
          Icon(
            Icons.palette,
            color: Colors.deepOrange,
            size: 48.0,
          ),
          Text(
            'Drag Me below to change color',
          ),
        ],
      ),
    );
  }

  DragTarget<int> _buildDragTarget() {
    return DragTarget<int>(
      onAcceptWithDetails: (details) {
        _paintedColor = Color(details.data);
      },
      builder: (BuildContext context, List<dynamic> acceptedData,
              List<dynamic> rejectedData) =>
          acceptedData.isEmpty
              ? Text(
                  'Drag To and see color change',
                  style: TextStyle(color: _paintedColor),
                )
              : Text(
                  'Painting Color: $acceptedData and $rejectedData',
                  style: TextStyle(
                    color: Color(acceptedData[0]),
                    fontWeight: FontWeight.bold,
                  ),
                ),
    );
  }
}
