import 'package:flutter/material.dart';

class ListImageView extends StatefulWidget {
  final List<String> imagePaths;

  const ListImageView({super.key, required this.imagePaths});

  @override
  _ListImageViewState createState() => _ListImageViewState();
}

class _ListImageViewState extends State<ListImageView> {
  int _currentPage = 0;
  late List<String> imagePaths;
  @override
  void initState() {
    imagePaths = widget.imagePaths;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 400,
          child: PageView.builder(
            itemCount: imagePaths.length,
            onPageChanged: (index) {
              setState(() {
                _currentPage = index;
              });
            },
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                onTap: () {
                  // Handle full-screen view (Hero animation) here
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return FullScreenImage(imagePath: imagePaths[index]);
                  }));
                },
                child: Hero(
                  tag: imagePaths[index],
                  child: Image.asset(imagePaths[index]),
                ),
              );
            },
          ),
        ),

        // Indicator for current image index
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            imagePaths.length,
            (index) => Padding(
              padding: const EdgeInsets.all(4.0),
              child: CircleAvatar(
                backgroundColor:
                    index == _currentPage ? Colors.amber : Colors.grey,
                radius: 4,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class FullScreenImage extends StatelessWidget {
  final String imagePath;

  const FullScreenImage({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.transparent,
        elevation: 0, // Remove the shadow
      ),
      body: Center(
        child: Hero(
          tag: imagePath,
          child: Image.asset(imagePath),
        ),
      ),
      backgroundColor: Colors.transparent,
    );
  }
}
