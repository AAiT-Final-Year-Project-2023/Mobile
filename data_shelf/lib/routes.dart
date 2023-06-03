import 'package:data_shelf/auth/screens/login/login_screen.dart';
import 'package:data_shelf/auth/screens/signup/signup_screen.dart';
import 'package:data_shelf/auth/screens/welcome/welcome_screen.dart';
import 'package:data_shelf/contribution/screen/contribution_detail_screen.dart';
import 'package:data_shelf/contribution/screen/contribution_screen.dart';
import 'package:data_shelf/home/screens/home_screen.dart';
import 'package:data_shelf/request/screen/request_create_screen.dart';
import 'package:data_shelf/request/screen/request_detail_screen.dart';
import 'package:data_shelf/request/screen/request_screen.dart';
import 'package:data_shelf/user/screen/profile_screen.dart';
import 'package:flutter/material.dart';

class RouteGenerator {
  static const String welcomePage = "/welcome";
  static const String homePage = "/home";
  static const String signupPage = "/register";
  static const String signinPage = "/login";
  static const String contributionPage = "/contribution";
  static const String contributionDetailPage = "/contributionDetail";
  static const String datasetPage = "/dataset";
  static const String datasetDetailPage = "/datasetDetail";
  static const String requestPage = "/request";
  static const String requestDetailPage = "/requestDetail";
  static const String requestCreatePage = "/requestcreate";
  static const String profilePage = "/profile";

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case welcomePage:
        return MaterialPageRoute(builder: (_) => WelcomeScreen());
      case homePage:
        return MaterialPageRoute(builder: (_) => HomeScreen());
      case signinPage:
        return MaterialPageRoute(builder: (_) => LoginScreen());
      case signupPage:
        return MaterialPageRoute(builder: (_) => SignUpScreen());

      case contributionPage:
        return MaterialPageRoute(builder: (_) => ContributionScreen());
      // case contributionDetailPage:
      //   return MaterialPageRoute(builder: (_) => ContributionDetailsScreen());

      case requestPage:
        return MaterialPageRoute(builder: (_) => RequestScreen());
      case requestCreatePage:
        return MaterialPageRoute(builder: (_) => RequestCreateScreen());

      // to do
      case requestDetailPage:
        return MaterialPageRoute(builder: (_) => RequestDetailScreen());

      // to do
      case profilePage:
        return MaterialPageRoute(builder: (_) => ProfileScreen());
      default:
        throw FormatException("Route was not found");
    }
  }
}
