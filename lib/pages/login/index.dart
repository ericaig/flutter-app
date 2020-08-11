import 'package:flutter/material.dart';
import 'package:flutter_app/pages/login/login-form.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        // appBar: AppBar(title: Text("Learning flutter")),
        // body: Image.asset("images/splash.png", fit: BoxFit.contain),
        body: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("images/splash.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: LoginPageForm(),
        ),
      ),
    );
  }
}
