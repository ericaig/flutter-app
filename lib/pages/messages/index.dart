import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/models/message.dart';

class MessageList extends StatefulWidget {
  final String title;

  const MessageList({Key key, this.title}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MessageListState();
}

class _MessageListState extends State<MessageList> {
  List<Message> messages = [];

  Future loadMessageList() async {
    String content = await rootBundle.loadString('data/messages.json');
    List collection = json.decode(content);
    List<Message> _messages =
        collection.map((item) => Message.fromJson(item)).toList();

    setState(() => messages = _messages);
  }

  void initState() {
    loadMessageList();

    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: ListView.separated(
          separatorBuilder: (context, index) => Divider(),
          itemCount: messages.length,
          itemBuilder: (BuildContext context, int index) {
            Message message = messages[index];

            return ListTile(
              title: Text(message.subject),
              isThreeLine: true,
              leading: CircleAvatar(
                child: Text(index.toString()),
              ),
              subtitle: Text(
                message.body,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            );
          }),
    );
  }
}
