import 'package:flutter/material.dart';

/// TO-DO: Build
class ChatScreen extends StatelessWidget {
  ///
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'chat_page',
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Chat'),
        ),
        body: const Center(
          child: Text('Chat'),
        ),
      ),
    );
  }
}
