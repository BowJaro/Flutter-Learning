import 'package:basic_routes/pages/father_page.dart';
import 'package:basic_routes/pages/mother_page.dart';
import 'package:flutter/material.dart';

import 'friend_page.dart';

class CheckListPage extends StatefulWidget {
  const CheckListPage({super.key});

  @override
  State<CheckListPage> createState() => _CheckListPageState();
}

class _CheckListPageState extends State<CheckListPage> {
  final List<List<dynamic>> _items = [
    ['Father', false],
    ['Mother', false],
    ['Friend', false],
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Checklist'),
      ),
      body: ListView.builder(
        itemCount: _items.length,
        itemBuilder: (context, index) {
          final item = _items[index][0] as String;
          final isChecked = _items[index][1] as bool;

          return _getCheckList(item, isChecked, index, context);
        },
      ),
      bottomNavigationBar: const Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              "These are Navigator.pushNamed() buttons. They do not receive returned data.",
              style: TextStyle(color: Colors.red, fontSize: 19),
              textAlign: TextAlign.center,
            ),
          ),
          RouteButtons(),
          SizedBox(
            height: 200,
          ),
          // ElevatedButton(
          //     onPressed: () {

          //     },
          //     child: const Text("Go to Hero animation page")),
          // const SizedBox(
          //   height: 50,
          // )
        ],
      ),
    );
  }

  ListTile _getCheckList(
      String item, bool isChecked, int index, BuildContext context) {
    var iconButton = IconButton(
      icon: const Icon(Icons.info),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              switch (item) {
                case "Friend":
                  return FriendPage(isChecked: _items[index][1]);
                case "Mother":
                  return MotherPage(isChecked: _items[index][1]);
                case "Father":
                  return FatherPage(isChecked: _items[index][1]);
                default:
                  return FriendPage(isChecked: _items[index][1]);
              }
            },
          ),
        ).then((value) {
          if (value != null) {
            setState(() {
              _items[index][1] = value;
            });
          }
        });
      },
    );

    return ListTile(
      title: Text(item),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Checkbox(
            value: isChecked,
            onChanged: (value) {
              setState(() {
                _items[index][1] = value!;
              });
            },
          ),
          iconButton,
        ],
      ),
    );
  }
}

class RouteButtons extends StatelessWidget {
  const RouteButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ElevatedButton(
          onPressed: () => Navigator.pushNamed(context, '/father'),
          child: const Text('Father'),
        ),
        ElevatedButton(
          onPressed: () => Navigator.pushNamed(context, '/mother'),
          child: const Text('Mother'),
        ),
        ElevatedButton(
          onPressed: () => Navigator.pushNamed(context, '/friend'),
          child: const Text('Friend'),
        ),
      ],
    );
  }
}
