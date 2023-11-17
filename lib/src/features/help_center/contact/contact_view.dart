import 'package:flutter/material.dart';

/// TO-DO: Build
class ContactScreen extends StatelessWidget {
  ///
  const ContactScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'contact_page',
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Contact'),
        ),
        body: const Center(child: Text('Contact')),
      ),
    );
  }
}
