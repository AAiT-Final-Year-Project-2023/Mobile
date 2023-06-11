import 'package:data_shelf/auth/bloc/login/signin_bloc.dart';
import 'package:data_shelf/auth/bloc/login/signin_event.dart';
import 'package:data_shelf/auth/bloc/login/signin_state.dart';
import 'package:data_shelf/auth/data_provider/auth_data_provider.dart';
import 'package:data_shelf/auth/form_submission_state.dart';
import 'package:data_shelf/auth/repository/auth_repository.dart';
import 'package:data_shelf/auth/screens/login/components/background.dart';
import 'package:data_shelf/auth/screens/login/components/rounded_password_field.dart';
import 'package:data_shelf/auth/screens/login/components/rounded_text_field.dart';
import 'package:data_shelf/auth/screens/login/components/text_field_container.dart';
import 'package:data_shelf/auth/screens/login/forgot_password_screen.dart';
import 'package:data_shelf/auth/screens/login/signin_with_google_screen.dart';
import 'package:data_shelf/auth/screens/signup/components/or_divider.dart';
import 'package:data_shelf/auth/screens/signup/components/signup_with_google_button.dart';
import 'package:data_shelf/auth/screens/signup/signup_screen.dart';
import 'package:data_shelf/auth/screens/signup/validators.dart';
import 'package:data_shelf/auth/screens/welcome/components/rounded_button.dart';
import 'package:data_shelf/utils/constants.dart';
import 'package:data_shelf/home/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

import 'have_account_check.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var authRepo = AuthRepository(
        authDataProvider: AuthDataProvider(httpClient: http.Client()));

    return Background(
        child: SingleChildScrollView(
      child: SafeArea(
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
            Text("Login", style: TextStyle(fontWeight: FontWeight.bold)),
            SizedBox(height: size.height * 0.05),
            BlocProvider(
              create: (context) => SigninBloc(authRepository: authRepo),
              child: LoginForm(),
            ),
            HaveAccountCheck(
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
            OrDivider(),
            SignupWithGoogleButton(
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return SigninWithGoogleScreen();
                    },
                  ),
                );
              },
              signup: false,
            )
          ],
        ),
      ),
    ));
  }
}

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  var _usernameController = TextEditingController();
  var _emailController = TextEditingController();
  var _passwordController = TextEditingController();
  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return BlocListener<SigninBloc, SigninState>(
      listener: (context, state) {
        if (state.formState is SubmissionSuccess) {
          debugPrint("[UI] User being transfered to Homepage :) ");
          debugPrint('The user with name ${state.username} ');
          Navigator.of(context).push(MaterialPageRoute(
            builder: (BuildContext context) => HomeScreen(),
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
            // RoundedTextField(
            //   validator: Validators().validateEmail,
            //   controller: _emailController,
            //   hintText: "Your Email",
            //   onChanged: (value) {},
            // ),
            RoundedTextField(
              controller: _usernameController,
              hintText: "Your Username",
              onChanged: (value) {},
              validator: Validators().validateName,
            ),
            RoundedPasswordField(
              controller: _passwordController,
              validator: Validators().validatePassword,
              onChanged: (value) {},
            ),
            SizedBox(height: size.height * 0.015),
            forgotPassword(() {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return ForgotPasswordScreen();
                  },
                ),
              );
            }),
            SizedBox(height: size.height * 0.015),
            BlocBuilder<SigninBloc, SigninState>(
              builder: (context, state) {
                return state.formState is FormSubmitting
                    ? CircularProgressIndicator()
                    : RoundedButton(
                        size: size,
                        text: "Login",
                        press: () {
                          if (_formKey.currentState!.validate()) {
                            print("[UI] Here is Login input");
                            print(
                                'password: ${_passwordController.text} \n email: ${_emailController.text}');
                            context
                                .read<SigninBloc>()
                                .add(SigninWithEmailSubmitted(
                                  email: _emailController.text,
                                  username: _usernameController.text,
                                  password: _passwordController.text,
                                ));
                          }
                        },
                      );
              },
            ),
          ],
        ),
      ),
    );
  }

  Container forgotPassword(press) {
    return Container(
      padding: EdgeInsets.only(right: 55),
      child: Align(
        alignment: Alignment.bottomRight,
        child: GestureDetector(
          onTap: press,
          child: Text(
            "Forgot Password?",
          ),
        ),
      ),
    );
  }
}
