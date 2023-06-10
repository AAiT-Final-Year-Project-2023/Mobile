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
import 'package:data_shelf/auth/screens/signup/validators.dart';
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
    var authRepo = AuthRepository(
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
                BlocProvider(
                  create: (_) => SignupBloc(
                    authRepository: authRepo,
                  ),
                  child: RegistrationForm(),
                ),
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

  var _emailController = TextEditingController();
  var _usernameController = TextEditingController();
  var _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _usernameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return BlocListener<SignupBloc, SignupState>(
      bloc: BlocProvider.of<SignupBloc>(context),
      listener: (BuildContext context, state) {
        if (state.formState is SubmissionSuccess) {
          debugPrint(
              "[UI] User being transfered to confirm the user is user :) ");
          debugPrint(
              'The user is ${state.username} with email ${state.email} ');
          Navigator.of(context).push(MaterialPageRoute(
            builder: (BuildContext context) => ConfirmationEmailScreen(
              username: state.username,
              email: state.email,
            ),
          ));
        } else if (state.formState is SubmissionFailed) {
          // Show snackbar if an error occurs
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text("Something Went Wrong! Check Your Credentials."),
              backgroundColor: Color.fromARGB(255, 198, 196, 194),
            ),
          );
        }
      },
      child: Form(
          key: _formKey,
          child: Column(
            children: [
              RoundedTextField(
                controller: _usernameController,
                hintText: "Your Username",
                onChanged: (value) {},
                validator: Validators().validateName,
              ),
              RoundedTextField(
                controller: _emailController,
                hintText: "Your Email",
                onChanged: (value) {},
                icon: Icons.email_sharp,
                validator: Validators().validateEmail,
              ),
              RoundedPasswordField(
                controller: _passwordController,
                validator: Validators().validatePassword,
                onChanged: (value) {},
              ),
              BlocBuilder<SignupBloc, SignupState>(
                builder: (context, state) {
                  return state.formState is FormSubmitting
                      ? CircularProgressIndicator()
                      : RoundedButton(
                          size: size,
                          text: "Register",
                          press: () {
                            if (_formKey.currentState!.validate()) {
                              print("[UI] Here is the input");
                              print(
                                  'name : ${_usernameController.text} \n password: ${_passwordController.text} \n email: ${_emailController.text}');
                              context
                                  .read<SignupBloc>()
                                  .add(SignupWithEmailSubmitted(
                                    email: _emailController.text,
                                    password: _passwordController.text,
                                    username: _usernameController.text,
                                  ));
                            }
                          },
                        );
                },
              ),
            ],
          )),
    );
  }
}
