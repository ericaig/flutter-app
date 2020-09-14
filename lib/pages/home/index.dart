import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final String title;

  HomePage({this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(this.title)),
      body: Text('Home page'),
    );
  }
}
