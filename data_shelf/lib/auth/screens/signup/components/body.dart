import 'package:data_shelf/auth/screens/login/login_screen.dart';
import 'package:data_shelf/auth/screens/signup/components/background.dart';
import 'package:data_shelf/auth/screens/signup/components/confirm_email_screen.dart';
import 'package:data_shelf/auth/screens/signup/components/or_divider.dart';
import 'package:data_shelf/auth/screens/signup/components/signup_with_google_button.dart';
import 'package:data_shelf/constants.dart';
import 'package:flutter/material.dart';

import '../../login/components/have_account_check.dart';
import '../../login/components/rounded_password_field.dart';
import '../../login/components/rounded_text_field.dart';
import '../../welcome/components/rounded_button.dart';

class Body extends StatelessWidget {
  const Body({super.key});
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Positioned(
            // top: 10,
            child: Image.asset(
          "assets/images/logo.png",
          // width: 400,
          height: 200,
        )),
        SizedBox(height: size.height * 0.05),
        Text("Register", style: TextStyle(fontWeight: FontWeight.bold)),
        SizedBox(height: size.height * 0.025),
        RoundedTextField(
          hintText: "Your Email",
          onChanged: (value) {},
        ),
        RoundedPasswordField(
          onChanged: (value) {},
        ),
        RoundedPasswordField(
          hintText: "Re-enter Password",
          onChanged: (value) {},
        ),
        RoundedButton(
          text: "Register",
          press: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return ConfirmEmailScreen();
                },
              ),
            );
          },
        ),
        SizedBox(height: size.height * 0.015),
        HaveAccountCheck(
          login: false,
          press: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return LoginScreen();
                },
              ),
            );
          },
        ),
        OrDivider(),
        SignupWithGoogleButton(press: () {}),
      ],
    ));
  }
}
