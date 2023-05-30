// Http package

// class ADP
// feature  loginwithemail()
// feature  loginwithgoogle()

// API call and response json file decode

import 'dart:convert';
import 'package:data_shelf/auth/models/user_signup.dart';
import 'package:data_shelf/config.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class AuthDataProvider {
  final _baseURL = BASE_URL;
  final http.Client httpClient;

  AuthDataProvider({required this.httpClient});

  Future<bool> signUp(
      {required String username,
      required String email,
      required String password}) async {
    debugPrint('$username, $email, $password');
    final response = await httpClient.post(
      Uri.parse('$_baseURL/auth/signup'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: userSignupEmailToJson(UserSignupEmail(
          username: "BontuFufa",
          email: "bontu@gmail.com",
          password: "1Bontu@DS!")),
    );
    debugPrint(response.body);
    debugPrint(response.statusCode.toString());
    if (response.statusCode == 201) {
      return true;
    } else {
      throw Exception(jsonDecode(response.body)['body']);
    }
  }

// sends post request to the api with the given email and password
  Future<String> signIn(
      {required String email, required String password}) async {
    final response = await httpClient.post(
      Uri.parse('$_baseURL/auth/signin'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{"email": email, "password": password}),
    );
    if (response.statusCode == 200) {
      return response.body;
    } else {
      throw Exception('Failed to login user');
    }
  }

  // sends post request to the api with the token
  Future<String> continueWithGoogle({
    required String? token,
  }) async {
    final response = await httpClient.post(
      Uri.parse('$_baseURL/auth/continue-with-google'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        "token": token,
        "roleId": "61315200b7a8b20d5d94f63b"
      }),
    );
    debugPrint(response.statusCode.toString());
    debugPrint(response.body);
    if (response.statusCode == 200) {
      return response.body;
    } else {
      throw Exception('Failed to register User');
    }
  }

  Future<bool> verifyEmail(
      {required String email, required int otpCode}) async {
    final response = await httpClient.post(
      Uri.parse('$_baseURL/auth/verify-email'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{"email": email, "otpCode": otpCode}),
    );
    debugPrint('Status code = ${response.statusCode}');
    debugPrint(response.toString());
    if (response.statusCode == 201) {
      return true;
    }

    throw Exception(jsonDecode(response.body)["message"]);
  }

  Future<bool> sendEmailForVerificationCode({
    required String email,
  }) async {
    final response = await httpClient.put(
      Uri.parse('$_baseURL/auth/forgot-password'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        "email": email,
      }),
    );
    if (response.statusCode == 201) {
      return true;
    } else {
      throw Exception("Error_SENDING_EMAIL");
    }
  }

  Future<String> matchCodeEntered(
      {required String email, required String verificationCode}) async {
    final response = await httpClient.post(
      Uri.parse('$_baseURL/auth/verify-otp'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        "otpCode": verificationCode,
        "email": email,
      }),
    );
    if (response.statusCode == 201) {
      return jsonDecode(response.body)['resetToken'];
    } else {
      throw Exception("Error_WHILE_SENDING_OTP");
    }
  }

  // sends the put request to the api with the token and the given new password
  Future<void> updateForgottenPassword({
    required resetToken,
    required newPassword,
  }) async {
    final response = await httpClient.put(
      Uri.parse('$_baseURL/auth/reset-password'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        "resetToken": resetToken,
        "password": newPassword,
      }),
    );
    if (response.statusCode == 201) {
    } else {
      throw Exception("Error_WHILE_SENDING_OTP");
    }
  }
}