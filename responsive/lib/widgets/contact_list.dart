import 'package:flutter/material.dart';
import 'package:responsive/data.dart';

class ContactList extends StatelessWidget {
  final Function() onContactTap;

  const ContactList({super.key, required this.onContactTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView.builder(
          itemCount: contacts.length,
          itemBuilder: (context, index) {
            var contact = contacts[index];
            return Column(
              children: [
                ListTile(
                  leading: CircleAvatar(
                      backgroundImage: NetworkImage(contact['imageUrl'])),
                  title: Text(
                    contact['name'],
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  subtitle: Text(
                    contact['message'],
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  trailing: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(contact['time'].toString().split(' ').first),
                      Text(
                        contact['time'].toString().split(' ').last,
                      ),
                    ],
                  ),
                  onTap: onContactTap,
                ),
                const Divider(
                  height: 0,
                  indent: 15,
                  endIndent: 15,
                )
              ],
            );
          }),
    );
  }
}
