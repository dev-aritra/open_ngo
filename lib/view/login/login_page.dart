import 'package:flutter/material.dart';
import 'package:open_ngo/styles/custom_colors.dart';
import 'package:open_ngo/view/login/custom_input_field.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[_appBar(), Expanded(child: _scrollablePart())],
          ),
        ),
      ),
    );
  }

  Widget _scrollablePart() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(top: 15.0),
        child: Column(
          
          children: <Widget>[
            CustomInputField(
              isPassword: false,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: CustomInputField(
                isPassword: true,
              ),
            ),
            _loginOptions(),
            _signInButton()
          ],
        ),
      ),
    );
  }


  Widget _appBar() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Login',
          style: TextStyle(
              fontSize: 25.0,
              fontWeight: FontWeight.bold,
              color: CustomColors.darkGrey),
        ),
        Text(
          'Get started with your journey',
          style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w300,
              color: CustomColors.lightGrey),
        )
      ],
    );
  }

  Widget _loginOptions() {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: Row(
        children: <Widget>[Expanded(child: _rememberMe()), _forgotPassword()],
      ),
    );
  }

  Widget _rememberMe() {
    return Row(
      children: <Widget>[
        Checkbox(
          activeColor: CustomColors.darkBlue,
          onChanged: (state) {},
          value: true,
        ),
        Text(
          'Remember me',
        )
      ],
    );
  }

  Widget _forgotPassword() {
    return Align(
      alignment: Alignment.bottomRight,
      child: GestureDetector(
        onTap: () {},
        child: Text(
          'Forgot password',
          style: TextStyle(color: CustomColors.darkGrey),
        ),
      ),
    );
  }

  Widget _signInButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 45.0, horizontal: 12.0),
      child: Row(children: <Widget>[
        Expanded(
          child: RaisedButton(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(7.0)),
            padding: EdgeInsets.all(12.0),
            onPressed: () {},
            color: CustomColors.darkBlue,
            child: Text(
              'CONTINUE TO LOGIN',
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ]),
    );
  }
}
