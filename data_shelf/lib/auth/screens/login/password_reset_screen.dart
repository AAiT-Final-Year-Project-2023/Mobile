import 'package:data_shelf/auth/screens/login/components/rounded_password_field.dart';
import 'package:data_shelf/auth/screens/login/forgot_password_screen.dart';
import 'package:data_shelf/auth/screens/login/login_screen.dart';
import 'package:data_shelf/auth/screens/signup/components/background.dart';
import 'package:data_shelf/auth/screens/welcome/components/rounded_button.dart';
import 'package:data_shelf/constants.dart';
import 'package:flutter/material.dart';

class PasswordResetScreen extends StatelessWidget {
  const PasswordResetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size; // screen size
    return Scaffold(
      body: Background(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20.0, left: 15),
                  child: IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return ForgotPasswordScreen();
                          },
                        ),
                      );
                    },
                    icon: Icon(Icons.arrow_back_ios_new_sharp),
                    color: Colors.grey,
                  ),
                ),
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
                            Icons.password_outlined,
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
                  child: Text("Create New Password",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                ),
                SizedBox(
                  height: size.height * 0.025,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    "Your new password must be different from previously used passwords.",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.grey[400]),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(
                  height: size.height * 0.05,
                ),
                Center(
                  child: RoundedPasswordField(
                    onChanged: (value) {},
                  ),
                ),
                Text("Must be at least 8 characters",
                    style: TextStyle(color: Colors.black54)),
                Center(
                  child: RoundedPasswordField(
                    hintText: "Re-enter Password",
                    onChanged: (value) {},
                  ),
                ),
                Text(
                  "Both passwords must match.",
                  style: TextStyle(color: Colors.black54),
                ),
                SizedBox(
                  height: size.height * 0.05,
                ),
                RoundedButton(
                  text: "Reset Password",
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
                )
              ]),
        ),
      ),
    );
  }
}
