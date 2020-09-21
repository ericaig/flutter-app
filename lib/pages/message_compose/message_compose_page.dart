import 'package:flutter/material.dart';
import 'package:flutter_app/models/message.dart';

class MessageComposePage extends StatefulWidget {
  @override
  _MessageComposePageState createState() => _MessageComposePageState();
}

class _MessageComposePageState extends State<MessageComposePage> {
  String recipient = 'eric@kompini.com';
  String subject = 'Renew Netflix Subscription';
  String body =
      "Duis do reprehenderit nisi pariatur. Est ut cupidatat nostrud amet id id.";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Compose message'),
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              ListTile(
                title: TextField(
                  controller: TextEditingController.fromValue(
                    TextEditingValue(text: recipient),
                  ),
                  onChanged: (value) {
                    recipient = value;
                  },
                  decoration: InputDecoration(
                    // prefixIcon: Icon(Icons.add),
                    icon: Icon(Icons.account_circle),
                    labelText: 'Recipient',
                    labelStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              ListTile(
                title: TextField(
                  controller: TextEditingController.fromValue(
                    TextEditingValue(text: subject),
                  ),
                  onChanged: (value) {
                    subject = value;
                  },
                  decoration: InputDecoration(
                    icon: Icon(Icons.subject),
                    labelText: 'Subject',
                    labelStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Divider(),
              ListTile(
                title: TextField(
                  controller: TextEditingController.fromValue(
                    TextEditingValue(text: body),
                  ),
                  onChanged: (value) {
                    body = value;
                  },
                  decoration: InputDecoration(
                    icon: Icon(Icons.text_format),
                    labelText: 'Body',
                    labelStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  maxLines: 5,
                ),
              ),
              ListTile(
                title: RaisedButton(
                  child: Text('Send'),
                  onPressed: () {
                    Message message = Message(subject, body);
                    Navigator.pop(context, message);
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
