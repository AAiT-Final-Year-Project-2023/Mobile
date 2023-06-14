import 'package:data_shelf/auth/bloc/verifyEmail/verify_OTP_bloc.dart';
import 'package:data_shelf/auth/bloc/verifyEmail/verify_OTP_event.dart';
import 'package:data_shelf/auth/repository/auth_repository.dart';
import 'package:data_shelf/auth/screens/login/forgot_password_screen.dart';
import 'package:data_shelf/auth/screens/login/login_screen.dart';
import 'package:data_shelf/auth/screens/login/password_reset_screen.dart';
import 'package:data_shelf/auth/screens/signup/confirm_email_screen.dart';
import 'package:data_shelf/dataset/screens/dataset_screen.dart';
import 'package:data_shelf/routes.dart';
import 'package:data_shelf/utils/constants.dart';
import 'package:data_shelf/home/screens/home_screen.dart';
import 'package:data_shelf/request/screen/request_create_screen.dart';
import 'package:data_shelf/utils/storage.dart';
import 'package:flutter/material.dart';
import 'package:data_shelf/auth/screens/welcome/welcome_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'auth/bloc/signup/signup_bloc.dart';
import 'auth/data_provider/auth_data_provider.dart';

import 'package:http/http.dart' as http;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final AuthRepository authRepo = new AuthRepository(
      authDataProvider: AuthDataProvider(httpClient: http.Client()));
  final secureStorage = SecureStorage();
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
        value: authRepo,
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'DataShelf',
          theme: ThemeData(
            primaryColor: primaryColor,
            scaffoldBackgroundColor: Colors.white,
          ),
          // home: RouteGenerator.welcomePage,
          onGenerateRoute: RouteGenerator.generateRoute,
          // home: WelcomeScreen(),
          home: const HomeScreen(),
          // home: RequestPage(),
          // home: LoginScreen(),
          // home: ConfirmEmailScreen(),
          // home: ForgotPasswordScreen(),
          // home: PasswordResetScreen(),
        ));
  }
}

class MyApp2 extends StatelessWidget {
  MyApp2({super.key});
  final AuthRepository authRepo = new AuthRepository(
      authDataProvider: AuthDataProvider(httpClient: http.Client()));

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
        value: authRepo,
        child: MultiBlocProvider(
            providers: [
              BlocProvider(
                  create: (_) => SignupBloc(
                        authRepository: authRepo,
                      )),
              BlocProvider(
                  create: (_) => OTPVerificationBloc(
                        authRepository: authRepo,
                      )),
            ],
            child: MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'DataShelf',
              theme: ThemeData(
                primaryColor: primaryColor,
                scaffoldBackgroundColor: Colors.white,
              ),
              // home: RouteGenerator.welcomePage,
              onGenerateRoute: RouteGenerator.generateRoute,
              // home: WelcomeScreen(),
              // home: const HomeScreen(),
              home: DatasetScreen(),
              // home: RequestPage(),
              // home: LoginScreen(),
              // home: ConfirmEmailScreen(),
              // home: ForgotPasswordScreen(),
              // home: PasswordResetScreen(),
            )));
  }
}
