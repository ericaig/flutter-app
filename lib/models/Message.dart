import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

// import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

part 'message.g.dart';

@JsonSerializable()
class Message {
  Message(this.subject, this.body);

  final String subject;
  final String body;

  factory Message.fromJson(Map<String, dynamic> json)
      // : subject = json['subject'],
      //   body = json['body'];
      =>
      _$MessageFromJson(json);

  static Future<List<Message>> browse() async {
    // String content = await rootBundle.loadString('data/messages.json');
    List mockyUrlIds = const [
      "5299633b-f5e3-444b-935a-247ef93e5530",
      "5189a79f-7296-45be-8ab3-c35b18ecaf35"
    ];

    Future.delayed(Duration(seconds: 3));

    http.Response response =
        await http.get('https://run.mocky.io/v3/${mockyUrlIds[1]}');

    String content = response.body;

    List collection = json.decode(content);
    List<Message> _messages =
        collection.map((item) => Message.fromJson(item)).toList();

    return _messages;
  }
}
