import 'package:flutter/material.dart';

class WeatherPage extends StatefulWidget {
  const WeatherPage({super.key});

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Layouts',
          style: TextStyle(color: Colors.black87),
        ),
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black54),
        leading: IconButton(icon: const Icon(Icons.menu), onPressed: () {}),
        actions: <Widget>[
          IconButton(icon: const Icon(Icons.cloud_queue), onPressed: () {})
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Image(
              image: AssetImage('assets/images/windows11.jpg'),
              fit: BoxFit.cover,
            ),
            const Text(
              "This is title",
              style: TextStyle(
                  color: Colors.red, fontSize: 26, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const Divider(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: const Text(
                  "This is description. This is description. This is description. This is description. This is description. This is description. "),
            ),
            ListTile(
              leading: Image.asset("assets/images/balloon.png"),
              title: const Text("36 Celcius degree"),
              subtitle: const Text("This is address"),
            ),
            Wrap(
              spacing: 8.0,
              children: List.generate(7, (int index) {
                return InkWell(
                  child: Chip(
                    label: Text(
                      'Gift ${index + 1}',
                      style: const TextStyle(fontSize: 15.0),
                    ),
                    avatar: Icon(
                      Icons.card_giftcard,
                      color: Colors.blue.shade300,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      side: const BorderSide(color: Colors.grey),
                    ),
                    backgroundColor: Colors.grey.shade100,
                  ),
                  onTap: () {},
                );
              }),
            ),
            Divider(),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                CircleAvatar(
                  backgroundImage: AssetImage('assets/images/balloon.png'),
                  radius: 45,
                ),
                CircleAvatar(
                  backgroundImage: AssetImage('assets/images/wallpaper.jpg'),
                  radius: 45,
                ),
                CircleAvatar(
                  backgroundImage: AssetImage('assets/images/windows11.jpg'),
                  radius: 45,
                ),
                SizedBox(
                  // width: 100.0,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      Icon(Icons.cake),
                      Icon(Icons.star_border),
                      Icon(Icons.music_note),
                      //Icon(Icons.movie),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
