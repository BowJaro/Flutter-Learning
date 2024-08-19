import 'package:flutter/material.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Container(
          // height: 200,
          // width: 200,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/wallpaper.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          // child: Image.asset('assets/images/wallpaper.jpg'),
        ),
        AppBar(
          backgroundColor: Colors.transparent,
          leading: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.menu,
                color: Colors.white,
                size: 36,
              )),
          title: const Text(
            "Tik Tok",
            style: TextStyle(color: Colors.white, fontSize: 36),
          ),
          centerTitle: true,
          actions: [
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.search,
                  color: Colors.white,
                  size: 36,
                ))
          ],
        ),
        Positioned(
          top: MediaQuery.of(context).size.height / 2,
          right: 16,
          child: const ControlButtons(),
        ),
        const Positioned(
          bottom: 20,
          left: 16,
          child: VideoInformation(),
        ),
      ]),
    );
  }
}

class VideoInformation extends StatefulWidget {
  const VideoInformation({super.key});

  @override
  State<VideoInformation> createState() => _VideoInformationState();
}

class _VideoInformationState extends State<VideoInformation> {
  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "The first video",
          style: TextStyle(
              color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
        ),
        Text(
          "Description",
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
        Text(
          "The sound of this video",
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
      ],
    );
  }
}

class ControlButtons extends StatefulWidget {
  const ControlButtons({super.key});

  @override
  State<ControlButtons> createState() => _ControlButtonsState();
}

class _ControlButtonsState extends State<ControlButtons> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.favorite,
              size: 36,
              color: Colors.white,
            )),
        const SizedBox(
          height: 20,
        ),
        IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.message,
              size: 36,
              color: Colors.white,
            )),
        IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.share,
              size: 36,
              color: Colors.white,
            )),
      ],
    );
  }
}
