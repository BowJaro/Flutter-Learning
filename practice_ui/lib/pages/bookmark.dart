import 'package:flutter/material.dart';

class _BookmarkPost {
  String id;
  String name;
  String description;
  String url;

  _BookmarkPost(
      {required this.id,
      required this.name,
      required this.description,
      required this.url});
}

List<_BookmarkPost> posts = [
  _BookmarkPost(
      id: "1",
      name: "This is name 1",
      description:
          "This is a really long description which should last for over 2 lines",
      url: "assets/images/windows11.jpg"),
  _BookmarkPost(
      id: "2",
      name: "This is name 2",
      description:
          "This is a really long description which should last for over 2 lines",
      url: "assets/images/windows11.jpg"),
  _BookmarkPost(
      id: "3",
      name: "This is name 3",
      description:
          "This is a really long description which should last for over 2 lines",
      url: "assets/images/windows11.jpg"),
  _BookmarkPost(
      id: "4",
      name: "This is name 4",
      description:
          "This is a really long description which should last for over 2 lines",
      url: "assets/images/windows11.jpg"),
  _BookmarkPost(
      id: "5",
      name: "This is name 5",
      description:
          "This is a really long description which should last for over 2 lines",
      url: "assets/images/windows11.jpg"),
  _BookmarkPost(
      id: "6",
      name: "This is name 6",
      description:
          "This is a really long description which should last for over 2 lines",
      url: "assets/images/windows11.jpg"),
];

class BookmarkPage extends StatefulWidget {
  const BookmarkPage({super.key});

  @override
  State<BookmarkPage> createState() => _BookmarkPageState();
}

class _BookmarkPageState extends State<BookmarkPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView.builder(
        itemBuilder: (context, index) {
          var post = posts[index];
          return Dismissible(
              key: Key(post.id),
              background: buildSlide(),
              secondaryBackground: buildSlide(),
              direction: DismissDirection.endToStart,
              confirmDismiss: (direction) async {
                return await showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text('Confirm Delete'),
                      content: const Text(
                          'Are you sure you want to delete this item?'),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.of(context).pop(false),
                          child: const Text('Cancel'),
                        ),
                        TextButton(
                          onPressed: () => Navigator.of(context).pop(true),
                          child: const Text('Delete'),
                        ),
                      ],
                    );
                  },
                );
              },
              onDismissed: (direction) {
                setState(() {
                  posts.removeAt(index);
                });
              },
              child: ListTile(
                onTap: () {},
                leading: Image.asset(post.url),
                title: Text(
                  post.name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontSize: 18),
                ),
                subtitle: Text(
                  post.description,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                trailing: IconButton(
                  icon: const Icon(Icons.more_horiz),
                  onPressed: () {},
                ),
              ));
        },
        itemCount: posts.length,
      ),
    );
  }

  Container buildSlide() {
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
