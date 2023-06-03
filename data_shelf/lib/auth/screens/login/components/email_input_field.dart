import 'package:data_shelf/auth/screens/login/components/background.dart';
import 'package:data_shelf/auth/screens/login/components/rounded_text_field.dart';
import 'package:data_shelf/auth/screens/login/components/text_field_container.dart';
import 'package:data_shelf/auth/screens/login/login_screen.dart';
import 'package:data_shelf/auth/screens/signup/confirm_email_screen.dart';
import 'package:data_shelf/auth/screens/welcome/components/rounded_button.dart';
import 'package:data_shelf/utils/constants.dart';
import 'package:flutter/material.dart';

class EmailInputField extends StatefulWidget {
  final String description;
  final String btnText;
  final VoidCallback press;

  const EmailInputField({
    super.key,
    required this.description,
    required this.btnText,
    required this.press,
  });

  @override
  State<EmailInputField> createState() => _EmailInputFieldState();
}

class _EmailInputFieldState extends State<EmailInputField> {
  var emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size; // screen size
    return Column(
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
                      return LoginScreen();
                    },
                  ),
                );
              },
              icon: Icon(Icons.arrow_back_ios_sharp),
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
            child: Text("Enter your email",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
          ),
          SizedBox(
            height: size.height * 0.025,
          ),
          Center(
            child: Text(
              widget.description,
              style: TextStyle(
                  fontWeight: FontWeight.bold, color: Colors.grey[400]),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            height: size.height * 0.025,
          ),
          Center(
            child: RoundedTextField(
              controller: emailController,
              hintText: "Your Email",
              onChanged: (value) {},
            ),
          ),
          SizedBox(
            height: size.height * 0.05,
          ),
          Center(
              child: RoundedButton(
                  size: size, text: widget.btnText, press: widget.press)),
        ]);
  }
}
