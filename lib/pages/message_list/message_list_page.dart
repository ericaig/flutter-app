import 'package:flutter/material.dart';
import 'package:flutter_app/models/message.dart';
import 'package:flutter_app/pages/message_detail/message_detail_page.dart';
import 'package:flutter_app/pages/message_list/widgets/compose_button.dart';

class MessageListPage extends StatefulWidget {
  final String title;

  const MessageListPage({Key key, this.title}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MessageListPageState();
}

class _MessageListPageState extends State<MessageListPage> {
  Future<List<Message>> future;
  List<Message> messages;

  void initState() {
    super.initState();

    fetch();
  }

  void fetch() async {
    future = Message.browse();
    messages = await future;
  }

  void addMessage(Message message) {
    setState(() {
      messages.add(message);
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.refresh),
              onPressed: () {
                setState(() async {
                  messages = await Message.browse();
                });
              },
            ),
          ],
        ),
        body: FutureBuilder(
          future: future,
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
              case ConnectionState.waiting:
              case ConnectionState.active:
                return Center(child: CircularProgressIndicator());
              case ConnectionState.done:
                if (snapshot.hasError)
                  return Text("There was an error ${snapshot.error}");

                List<Message> messages = snapshot.data;

                return ListView.separated(
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
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (BuildContext context) =>
                                MessageDetailPage(message),
                          ),
                        );
                      },
                    );
                  },
                );
            }

            return Text("Something went wrong");
          },
        ),
        floatingActionButton:
            MessageComposeButton(messages: messages, addMessage: addMessage));
  }
}
