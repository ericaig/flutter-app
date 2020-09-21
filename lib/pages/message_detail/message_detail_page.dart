import 'package:flutter/material.dart';
import 'package:flutter_app/models/message.dart';

class MessageDetailPage extends StatelessWidget {
  final Message message;

  MessageDetailPage(this.message);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(message.subject),
        backgroundColor: Colors.amber,
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Text(message.body),
      ),
    );
  }
}
