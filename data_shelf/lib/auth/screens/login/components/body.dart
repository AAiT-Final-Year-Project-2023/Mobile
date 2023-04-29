import 'package:data_shelf/auth/screens/login/components/background.dart';
import 'package:data_shelf/auth/screens/login/components/rounded_password_field.dart';
import 'package:data_shelf/auth/screens/login/components/rounded_text_field.dart';
import 'package:data_shelf/auth/screens/login/components/text_field_container.dart';
import 'package:data_shelf/auth/screens/login/forgot_password_screen.dart';
import 'package:data_shelf/auth/screens/login/signin_with_google_screen.dart';
import 'package:data_shelf/auth/screens/signup/components/or_divider.dart';
import 'package:data_shelf/auth/screens/signup/components/signup_with_google_button.dart';
import 'package:data_shelf/auth/screens/signup/signup_screen.dart';
import 'package:data_shelf/auth/screens/welcome/components/rounded_button.dart';
import 'package:data_shelf/constants.dart';
import 'package:data_shelf/home/screens/home_screen.dart';
import 'package:flutter/material.dart';

import 'have_account_check.dart';

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
        Text("Login", style: TextStyle(fontWeight: FontWeight.bold)),
        SizedBox(height: size.height * 0.05),
        RoundedTextField(
          hintText: "Your Email",
          onChanged: (value) {},
        ),
        RoundedPasswordField(
          onChanged: (value) {},
        ),
        SizedBox(height: size.height * 0.015),
        forgotPassword(() {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return ForgotPasswordScreen();
              },
            ),
          );
        }),
        SizedBox(height: size.height * 0.015),
        RoundedButton(
          text: "Login",
          press: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return HomeScreen();
                },
              ),
            );
          },
        ),
        HaveAccountCheck(
          press: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return SignUpScreen();
                },
              ),
            );
          },
        ),
        OrDivider(),
        SignupWithGoogleButton(
          press: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return SigninWithGoogleScreen();
                },
              ),
            );
          },
          signup: false,
        )
      ],
    ));
  }

  Container forgotPassword(press) {
    return Container(
      padding: EdgeInsets.only(right: 55),
      child: Align(
        alignment: Alignment.bottomRight,
        child: GestureDetector(
          onTap: press,
          child: Text(
            "Forgot Password?",
          ),
        ),
      ),
    );
  }
}
