import 'package:flutter/material.dart';

class LiveChatScreen extends StatelessWidget {
  const LiveChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Live Chat')),
      body: const Center(
        child: Text(
          'This is the Live Chat page',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
