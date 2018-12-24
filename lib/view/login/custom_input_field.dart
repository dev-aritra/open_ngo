import 'package:flutter/material.dart';
import 'package:open_ngo/styles/custom_colors.dart';

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
        obscureText: isPassword ? !showPassword : false,
        cursorColor: CustomColors.darkGrey,
        decoration: _inputFieldDecoration(lableText),
        style: TextStyle(color: CustomColors.darkGrey, fontSize: 16, fontWeight: FontWeight.w500),
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
          
          icon: Icon(Icons.remove_red_eye, color: CustomColors.midGrey),
        );
      } else {
        button = IconButton(
          onPressed: () {
            _toggleShowPass();
          },
          icon: Icon(Icons.lock ,  color: CustomColors.midGrey),
        );
      }
    }

    return InputDecoration(
      suffixIcon: button,
      labelText: text,
      labelStyle: TextStyle(color: CustomColors.lightGrey, fontSize: 15.0),
      focusedBorder: UnderlineInputBorder(
          borderSide:
              BorderSide(style: BorderStyle.solid, color: CustomColors.midGrey)),
      border: UnderlineInputBorder(
          borderSide:
              BorderSide(style: BorderStyle.solid, color: Colors.black)),
    );
  }
}
