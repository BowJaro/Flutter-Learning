import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'pages/method_channel.dart';

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
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int batteryLevel = -100;

  Future<void> _getBatteryLevel() async {
    try {
      final level = await getBatteryLevel();
      setState(() {
        batteryLevel = level;
      });
    } on PlatformException catch (e) {
      print('Error: ${e.message}');
    }
  }

  @override
  void initState() {
    super.initState();
    _getBatteryLevel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Text(
              "This is battery level $batteryLevel%",
              style: const TextStyle(color: Colors.red, fontSize: 30),
            ),
          ),
        ),
      ),
    );
  }
}
