import 'package:data_shelf/auth/screens/login/components/background.dart';
import 'package:data_shelf/auth/screens/login/components/email_input_field.dart';
import 'package:data_shelf/auth/screens/signup/confirm_email_screen.dart';
import 'package:flutter/material.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Background(
        child: EmailInputField(
          description:
              "Enter the email you used to register, so we can send you a link and instructions to reset your password ",
          btnText: "Send Code",
          press: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return ConfirmationEmailScreen(
                    email: "",
                    username: '',
                    // reset: true,
                  );
                  // return confirm_OTP_Screen();
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
