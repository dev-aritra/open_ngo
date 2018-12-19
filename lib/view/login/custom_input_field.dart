import 'package:flutter/material.dart';

class CustomInputField extends StatefulWidget {
  bool isPassword = false;
  CustomInputField({Key key, this.isPassword}) : super(key: key);

  @override
  _CustomInputFieldState createState() =>
      _CustomInputFieldState(this.isPassword);
}

class _CustomInputFieldState extends State<CustomInputField> {
  bool isPassword;
  bool showPassword = false;
  _CustomInputFieldState(this.isPassword);

  @override
  Widget build(BuildContext context) {
    return _inputField();
  }

  Widget _inputField() {
    String lableText = isPassword ? 'Password' : 'Username and email';
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: TextField(
        obscureText: !showPassword,
        cursorColor: Color(0xFF212121),
        decoration: _inputFieldDecoration(lableText),
        style: TextStyle(color: Color(0xFF424242), fontSize: 18),
      ),
    );
  }

  _toggleShowPass() {
    setState(() {
      showPassword = showPassword ? false : true;
    });
  }

  InputDecoration _inputFieldDecoration(String text) {
    IconButton button;
    if (isPassword) {
      if (showPassword) {
        button = IconButton(
          onPressed: () {
            _toggleShowPass();
          },
          
          icon: Icon(Icons.remove_red_eye, color: Color(0xFF212121)),
        );
      } else {
        button = IconButton(
          onPressed: () {
            _toggleShowPass();
          },
          icon: Icon(Icons.lock),
        );
      }
    }

    return InputDecoration(
      suffixIcon: button,
      labelText: text,
      labelStyle: TextStyle(color: Color(0xFF9E9E9E)),
      focusedBorder: UnderlineInputBorder(
          borderSide:
              BorderSide(style: BorderStyle.solid, color: Color(0xFF212121))),
      border: UnderlineInputBorder(
          borderSide:
              BorderSide(style: BorderStyle.solid, color: Color(0xFFEEEEEE))),
    );
  }
}
