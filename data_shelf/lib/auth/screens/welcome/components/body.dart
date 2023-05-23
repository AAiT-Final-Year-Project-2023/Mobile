import 'package:data_shelf/auth/screens/signup/signup_screen.dart';
import 'package:data_shelf/auth/screens/welcome/components/background.dart';
import 'package:data_shelf/auth/screens/welcome/components/rounded_button.dart';
import 'package:data_shelf/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../login/login_screen.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size; // screen size
    return Background(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Text(
          //   "Welcome to",
          //   style: TextStyle(
          //       fontWeight: FontWeight.bold, color: Colors.deepOrangeAccent),
          // ),
          // SizedBox(height: size.height * 0.1),
          Positioned(
              // top: 10,
              child: Image.asset(
            "assets/images/logo.png",
            // width: 120,
          )),
          SizedBox(height: size.height * 0.1),
          RoundedButton(
            size: size,
            text: "Login",
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
          RoundedButton(
            size: size,
            text: "Register",
            color: primaryColorLight,
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
        ],
      ),
    );
  }
}
