import 'package:data_shelf/auth/screens/signup/components/background.dart';
import 'package:data_shelf/auth/screens/welcome/components/rounded_button.dart';
import 'package:data_shelf/constants.dart';
import 'package:flutter/material.dart';

import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';

class ConfirmEmailScreen extends StatelessWidget {
  const ConfirmEmailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size; // screen size
    return Scaffold(
      body: Background(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.all(10),
                    margin: EdgeInsets.only(top: size.height * 0.25),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        // shape: BoxShape.circle,
                        border: Border.all(color: Colors.white),
                        color: Colors.blue[100],
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: new IconButton(
                        icon: new Icon(
                          Icons.email_outlined,
                          color: primaryColor,
                          size: 30,
                        ),
                        onPressed: null),
                  ),
                ],
              ),
              SizedBox(
                height: size.height * 0.025,
              ),
              Center(
                child: Text("Check your email",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
              ),
              SizedBox(
                height: size.height * 0.025,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  "We have sent email containing OTP to your email address",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.grey[400]),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                height: size.height * 0.05,
              ),
              Center(
                child: OTPTextField(
                  length: 4,
                  width: size.width,
                  fieldWidth: 80,
                  style: TextStyle(fontSize: 17),
                  textFieldAlignment: MainAxisAlignment.spaceAround,
                  fieldStyle: FieldStyle.underline,
                  onCompleted: (pin) {
                    print("Completed: " + pin);
                  },
                ),
              ),
              SizedBox(
                height: size.height * 0.05,
              ),
              Padding(
                padding: const EdgeInsets.all(40.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Resend code in",
                        style: TextStyle(
                            fontWeight: FontWeight.w100, fontSize: 15)),
                    Text("2:43",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                        )),
                  ],
                ),
              ),
              SizedBox(
                height: size.height * 0.05,
              ),
              Center(child: RoundedButton(text: "Confirm OTP", press: () {})),
            ]),
      ),
    );
  }
}
