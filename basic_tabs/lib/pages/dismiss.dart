import 'package:flutter/material.dart';

import '../classes/trip.dart';

class DismissPage extends StatefulWidget {
  const DismissPage({super.key});

  @override
  State<DismissPage> createState() => _DismissPageState();
}

class _DismissPageState extends State<DismissPage> {
  late List _trips = [];

  @override
  void initState() {
    super.initState();
    _trips
      ..add(Trip(id: '0', tripName: 'Rome', tripLocation: 'Italy'))
      ..add(Trip(id: '1', tripName: 'Paris', tripLocation: 'France'))
      ..add(Trip(id: '2', tripName: 'New York', tripLocation: 'USA - New York'))
      ..add(Trip(id: '3', tripName: 'Cancun', tripLocation: 'Mexico'))
      ..add(Trip(id: '4', tripName: 'London', tripLocation: 'England'))
      ..add(Trip(id: '5', tripName: 'Sydney', tripLocation: 'Australia'))
      ..add(Trip(id: '6', tripName: 'Miami', tripLocation: 'USA - Florida'))
      ..add(Trip(id: '7', tripName: 'Rio de Janeiro', tripLocation: 'Brazil'))
      ..add(Trip(id: '8', tripName: 'Cusco', tripLocation: 'Peru'))
      ..add(Trip(id: '9', tripName: 'New Delhi', tripLocation: 'India'))
      ..add(Trip(id: '10', tripName: 'Tokyo', tripLocation: 'Japan'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView.builder(
      itemCount: _trips.length,
      itemBuilder: (BuildContext context, int index) {
        return Dismissible(
          key: Key(_trips[index].id),
          background: _buildCompleteTrip(),
          secondaryBackground: _buildRemoveTrip(),
          onDismissed: (DismissDirection direction) {
            direction == DismissDirection.startToEnd
                ? _markTripCompleted()
                : _deleteTrip();
            // Remove item from List
            setState(() {
              _trips.removeAt(index);
            });
          },
          child: _buildListTile(index),
        );
      },
    ));
  }

  void _markTripCompleted() {
    // Mark trip completed in Database or web service
  }
  void _deleteTrip() {
    // Delete trip from Database or web service
  }

  ListTile _buildListTile(int index) {
    return ListTile(
      title: Text('${_trips[index].tripName}'),
      subtitle: Text(_trips[index].tripLocation),
      leading: const Icon(Icons.flight),
      trailing: const Icon(Icons.fastfood),
    );
  }

  Container _buildCompleteTrip() {
    return Container(
      color: Colors.green,
      child: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Icon(
              Icons.done,
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }

  Container _buildRemoveTrip() {
    return Container(
      color: Colors.red,
      child: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Icon(
              Icons.delete,
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
