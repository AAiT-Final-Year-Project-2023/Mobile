import 'package:data_shelf/utils/constants.dart';
import 'package:flutter/material.dart';

class SignupWithGoogleButton extends StatelessWidget {
  final VoidCallback press;
  final bool signup;
  const SignupWithGoogleButton(
      {super.key, required this.press, this.signup = true});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      width: size.width * 0.8,
      child: ElevatedButton.icon(
        onPressed: press,
        icon: Image.asset(
          'assets/images/google.png',
          height: 24,
          width: 24,
        ),
        label:
            signup ? Text('Sign up with Google') : Text('Sign in with Google'),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          foregroundColor: primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(29),
            side: BorderSide(color: Colors.blue, width: 1),
          ),
          padding: EdgeInsets.symmetric(vertical: 12, horizontal: 10),
        ),
      ),
    );
  }
}
