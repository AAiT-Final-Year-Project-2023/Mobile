import 'package:data_shelf/auth/screens/login/components/email_input_field.dart';
import 'package:data_shelf/auth/screens/signup/components/background.dart';
import 'package:data_shelf/home/screens/home_screen.dart';
import 'package:flutter/material.dart';

class SigninWithGoogleScreen extends StatelessWidget {
  const SigninWithGoogleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Background(
        child: EmailInputField(
          btnText: "submit",
          description: "Enter your google account email",
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
      ),
    );
  }
}
