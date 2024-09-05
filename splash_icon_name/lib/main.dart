import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:splash_icon_name/screens/home.dart';
import 'package:splash_icon_name/screens/onboard.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final sharedPreferences = await SharedPreferences.getInstance();
  final onboard = sharedPreferences.getBool("onboard") ?? false;
  runApp(MyApp(
    onboard: onboard,
  ));
}

class MyApp extends StatelessWidget {
  final bool onboard;
  const MyApp({super.key, this.onboard = false});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: onboard ? const HomePage() : const OnBoardScreen(),
    );
  }
}
