import 'package:data_shelf/auth/screens/login/login_screen.dart';
import 'package:data_shelf/constants.dart';
import 'package:flutter/material.dart';
import 'package:data_shelf/auth/screens/welcome/welcome_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'DataShelf',
      theme: ThemeData(
        primaryColor: primaryColor,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: WelcomeScreen(),
      // home: LoginScreen(),
    );
  }
}
