import 'package:data_shelf/utils/constants.dart';
import 'package:flutter/material.dart';

class HaveAccountCheck extends StatelessWidget {
  final bool login;
  final VoidCallback press;
  const HaveAccountCheck({
    super.key,
    this.login = true,
    required this.press,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          login ? "Don't have an account? " : "Already have an account? ",
          style: TextStyle(color: primaryColor),
        ),
        GestureDetector(
          onTap: press,
          child: Text(
            login ? "Sign Up" : "Sign In",
            style: TextStyle(color: primaryColor, fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }
}
