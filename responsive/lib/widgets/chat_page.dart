import 'package:flutter/material.dart';
import 'package:responsive/data.dart';
import 'package:responsive/widgets/input_message.dart';
import 'package:responsive/widgets/message_card.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    // Scroll to the bottom of the list when the widget is built
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scrollToBottom();
    });
  }

  void _scrollToBottom() {
    if (_scrollController.hasClients) {
      _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(contacts[0]['name']),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              controller: _scrollController, // Attach the ScrollController
              itemCount: messages.length,
              itemBuilder: (context, index) {
                var message = messages[index];
                if (message['isMe'] == true) {
                  return MyMessageCard(
                      message: message['text'].toString(),
                      time: message['time'].toString());
                } else {
                  return TheirMessageCard(
                      message: message['text'].toString(),
                      time: message['time'].toString());
                }
              },
            ),
          ),
          const MessageInput(),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose(); // Dispose the ScrollController
    super.dispose();
  }
}
