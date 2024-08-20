import 'package:basic_routes/pages/check_list.dart';
import 'package:basic_routes/pages/father_page.dart';
import 'package:basic_routes/pages/friend_page.dart';
import 'package:basic_routes/pages/hero_detail_page.dart';
import 'package:basic_routes/pages/mother_page.dart';
import 'package:flutter/material.dart';

import 'pages/hero_list_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
      routes: <String, WidgetBuilder>{
        '/checkList': (BuildContext context) => const CheckListPage(),
        '/father': (BuildContext context) => const FatherPage(
              isChecked: false,
            ),
        '/mother': (BuildContext context) => const MotherPage(
              isChecked: false,
            ),
        '/friend': (BuildContext context) => const FriendPage(
              isChecked: false,
            ),
      },
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: const SafeArea(child: CheckListPage()),
        bottomNavigationBar: BottomAppBar(
          color: Colors.deepPurple,
          shape: const CircularNotchedRectangle(),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                IconButton(
                  icon: const Icon(Icons.access_alarm),
                  color: Colors.white,
                  onPressed: () {},
                ),
                IconButton(
                  icon: const Icon(Icons.bookmark_border),
                  color: Colors.white,
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return const HeroListPage();
                    }));
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.flight),
                  color: Colors.white,
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return const HeroDetailPage(
                        item: "Friend",
                      );
                    }));
                  },
                ),
              ]),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.pink.shade200,
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return const HeroListPage();
            }));
          },
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50.0),
          ),
          child: const Icon(Icons.add),
        ));
  }
}
