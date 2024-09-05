import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("This is home page"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(28.0),
        child: Center(
          child: Column(
            children: [
              const Text(
                "This is just a home screen",
                style: TextStyle(fontSize: 40),
                textAlign: TextAlign.center,
              ),
              ElevatedButton(
                onPressed: () async {
                  final pref = await SharedPreferences.getInstance();
                  pref.setBool("onboard", false);

                  if (context.mounted) {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: const Text('Onboard re-enabled!'),
                          content: const Text(
                              'You have re-enabled Onboard screen. Restart your app to see the Onboard screen.'),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: const Text('OK'),
                            ),
                          ],
                        );
                      },
                    );
                  }
                },
                child: const Text("Click here to re-enable Onboard screen."),
              )
            ],
          ),
        ),
      ),
    );
  }
}
