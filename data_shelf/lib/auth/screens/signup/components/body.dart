import 'dart:io';

import 'package:data_shelf/auth/bloc/signup/signup_event.dart';
import 'package:data_shelf/auth/bloc/signup/signup_state.dart';
import 'package:data_shelf/auth/data_provider/auth_data_provider.dart';
import 'package:data_shelf/auth/form_submission_state.dart';
import 'package:data_shelf/auth/repository/auth_repository.dart';
import 'package:data_shelf/auth/screens/login/login_screen.dart';
import 'package:data_shelf/auth/screens/signup/components/background.dart';
import 'package:data_shelf/auth/screens/signup/confirm_email_screen.dart';
import 'package:data_shelf/auth/screens/signup/components/or_divider.dart';
import 'package:data_shelf/auth/screens/signup/components/signup_with_google_button.dart';
import 'package:data_shelf/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/signup/signup_bloc.dart';
import '../../login/components/have_account_check.dart';
import '../../login/components/rounded_password_field.dart';
import '../../login/components/rounded_text_field.dart';
import '../../welcome/components/rounded_button.dart';
import 'package:http/http.dart' as http;

class Body extends StatelessWidget {
  const Body({super.key});
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var ar = AuthRepository(
        authDataProvider: AuthDataProvider(httpClient: http.Client()));
    return Background(
      child: SingleChildScrollView(
        child: SafeArea(
          child: Container(
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
                Text("Register", style: TextStyle(fontWeight: FontWeight.bold)),
                SizedBox(height: size.height * 0.025),
                RegistrationForm(),
                SizedBox(height: size.height * 0.015),
                HaveAccountCheck(
                  login: false,
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
                OrDivider(),
                SignupWithGoogleButton(press: () {}),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class RegistrationForm extends StatefulWidget {
  const RegistrationForm({super.key});

  @override
  State<RegistrationForm> createState() => _RegistrationFormState();
}

class _RegistrationFormState extends State<RegistrationForm> {
  final _formKey = GlobalKey<FormState>();
  String username = '';
  String email = '';
  String password = '';

  var emailController = TextEditingController();
  var usernameController = TextEditingController();
  var passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return BlocListener<SignupBloc, SignupState>(
      bloc: BlocProvider.of<SignupBloc>(context),
      listener: (BuildContext context, state) {},
      child: Form(
          key: _formKey,
          child: Column(
            children: [
              RoundedTextField(
                controller: usernameController,
                hintText: "Your Username",
                onChanged: (value) {},
              ),
              RoundedTextField(
                controller: emailController,
                hintText: "Your Email",
                onChanged: (value) {},
              ),
              RoundedPasswordField(
                onChanged: (value) {},
              ),
              RoundedButton(
                size: size,
                text: "Register",
                press: () {
                  context.read<SignupBloc>().add(SignupWithEmailSubmitted(
                        email: emailController.text,
                        password: passwordController.text,
                        username: usernameController.text,
                      ));

                  //         if (state.formState is SubmissionSuccess) {
                  // debugPrint('from reg email = ${this.email}');
                  // AuthCredentials credentials = new AuthCredentials(
                  //     email: this.email,
                  //     name: state.fullName,
                  //     password: state.password);
                  // Navigator.of(context).push(MaterialPageRoute(
                  //   builder: (BuildContext context) => VerifyEmailPage(),
                  //   settings: RouteSettings(arguments: credentials),
                  // ));

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return ConfirmationEmailScreen(
                            email: emailController.text);
                      },
                    ),
                  );
                },
              ),
            ],
          )),
    );
  }
}
