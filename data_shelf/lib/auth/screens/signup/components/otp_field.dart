import 'package:data_shelf/auth/screens/login/login_screen.dart';
import 'package:data_shelf/auth/screens/signup/components/background.dart';
import 'package:data_shelf/auth/screens/signup/signup_screen.dart';
import 'package:data_shelf/auth/screens/welcome/components/rounded_button.dart';
import 'package:data_shelf/utils/constants.dart';
import 'package:flutter/material.dart';

import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';
import 'package:quickalert/quickalert.dart';

class OTPField extends StatelessWidget {
  final bool isOnComplete;
  const OTPField({
    super.key,
    this.isOnComplete = true,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size; // screen size
    return Center(
      child: OTPTextField(
        length: 4,
        width: size.width,
        fieldWidth: 80,
        style: TextStyle(fontSize: 17),
        textFieldAlignment: MainAxisAlignment.spaceAround,
        fieldStyle: FieldStyle.underline,
        onCompleted: (pin) {
          isOnComplete
              ? pin == '1212'
                  ? QuickAlert.show(
                      context: context,
                      type: QuickAlertType.success,
                      text: "Verified!",
                      confirmBtnColor: alertBtnColor,
                      onConfirmBtnTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return LoginScreen();
                            },
                          ),
                        );
                      })
                  : QuickAlert.show(
                      context: context,
                      type: QuickAlertType.error,
                      text: "Verification faild re-enter OTP!",
                      confirmBtnColor: alertBtnColor)
              : print("Completed: " + pin);
        },
      ),
    );
  }
}
