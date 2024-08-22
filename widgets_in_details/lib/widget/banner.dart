import 'package:flutter/material.dart';

class MyBanner extends StatefulWidget {
  const MyBanner({super.key});

  @override
  State<MyBanner> createState() => _MyBannerState();
}

class _MyBannerState extends State<MyBanner> {
  @override
  Widget build(BuildContext context) {
    return Banner(
      message: "23% sale off",
      location: BannerLocation.topEnd,
      child: Card(
        color: Colors.deepPurple,
        child: Column(
          children: [
            Image.asset("assets/images/windows11.jpg"),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  "Windows 11 Pro",
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.add,
                      size: 25,
                      color: Colors.red,
                    ))
              ],
            ),
            const Text("Only from \$499")
          ],
        ),
      ),
    );
  }
}
