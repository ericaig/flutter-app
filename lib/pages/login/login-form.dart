import 'package:flutter/material.dart';
import 'package:flutter_app/services/api/handlers/login.dart';

class LoginPageForm extends StatefulWidget {
  @override
  _LoginPageFormState createState() => _LoginPageFormState();
}

class _LoginPageFormState extends State<LoginPageForm> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 10, right: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            color: Colors.white,
            // height: 150,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Nombre de usuario',
                    prefixIcon: const Icon(Icons.person),
                  ),
                ),
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Contraseña...',
                    prefixIcon: const Icon(Icons.lock),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          RaisedButton(
            color: Colors.red,
            padding: EdgeInsets.only(top: 15, bottom: 15),
            onPressed: () {
              _doLogin();
              // SystemChannels.textInput.invokeMethod('TextInput.hide');
              // Validate will return true if the form is valid, or false if
              // the form is invalid.
              // if (_formKey.currentState.validate()) {
              //   // Process data.
              // }
            },
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50),
              side: BorderSide(color: Colors.white),
            ),
            child: const Text(
              'Siguiente',
              style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.w500),
            ),
          ),
          // contain
        ],
      ),
    );
  }
}

void _doLogin() {
  final api = LoginApiService();

  api.login(username: 'erickmp', password: '1234');
}
