import 'package:flutter/material.dart';

class IconInput extends StatelessWidget {
  final String _placeholder;
  final IconData icon;

  const IconInput(this._placeholder, {this.icon});
  // IconInput(this._placeholder = "This is default value");
  // IconInput.empty() : this("Empty value");

  // constructor() {
  //   print("this._placeholder");
  // }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        hintText: _placeholder,
        prefixIcon: icon != null ? Icon(icon) : '',
      ),
    );
  }
}
