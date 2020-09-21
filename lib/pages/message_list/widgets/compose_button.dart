import 'package:flutter/material.dart';
import 'package:flutter_app/models/message.dart';
import 'package:flutter_app/pages/message_compose/message_compose_page.dart';
import 'package:flutter_app/widgets/custom_snackbar.dart';

class MessageComposeButton extends StatelessWidget {
  final List<Message> messages;
  final void Function(Message message) addMessage;

  const MessageComposeButton({Key key, this.messages, this.addMessage})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Colors.cyan,
      child: Icon(Icons.add),
      onPressed: () async {
        Message message = await Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MessageComposePage(),
          ),
        );

        if (message != null) {
          try {
            addMessage(message);

            CustomSnackbar(
              message: "Your message has been sent",
              color: Colors.green,
              duration: Duration(milliseconds: 1000),
            ).build(context);
          } catch (e) {
            print(e);
            CustomSnackbar(
              message: e.toString(),
              color: Colors.red,
              duration: Duration(milliseconds: 5000),
            ).build(context);
          }
        }
      },
    );
  }
}
