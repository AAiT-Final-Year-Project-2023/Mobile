// Http package

// class ADP
// feature  loginwithemail()
// feature  loginwithgoogle()

// API call and response json file decode

import 'dart:convert';
import 'package:data_shelf/auth/models/user_signup.dart';
import 'package:data_shelf/utils/config.dart';
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
    debugPrint('[Provider] $username, $email, $password');
    debugPrint(
        "Trying to connect .................................................");
    final response = await httpClient.post(
      Uri.parse('$_baseURL/auth/signup'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: userSignupEmailToJson(UserSignupEmail(
          username: username, email: email, password: password)),
    );
    debugPrint('[Provider] Waiting for user to be Created in.');
    debugPrint(response.body);
    debugPrint(response.statusCode.toString());
    if (response.statusCode == 201) {
      debugPrint('[Provider] Success user Created.');

      return true;
    } else {
      debugPrint('[Provider] Error user not Created.');
      debugPrint(jsonDecode(response.body)['body']);

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
    debugPrint('[Provider] Waiting for user to be Logged in.');
    if (response.statusCode == 200) {
      debugPrint('[Provider] Success user Logged in.');
      return response.body;
    } else {
      debugPrint('[Provider] Error user not logged in.');
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
    print("Sending Request for Email signup");
    // final response = await httpClient.put(
    //   Uri.parse('$_baseURL/auth/forgot-password'),
    //   headers: <String, String>{
    //     'Content-Type': 'application/json; charset=UTF-8',
    //   },
    //   body: jsonEncode(<String, dynamic>{
    //     "email": email,
    //   }),
    // );
    // if (response.statusCode == 201) {
    //   return true;
    // } else {
    //   throw Exception("Error_SENDING_EMAIL");
    // }
    return true;
  }

  Future<String> matchCodeEntered(
      {required String email,
      required String verificationCode,
      required String username}) async {
    // final response = await httpClient.post(
    //   Uri.parse('$_baseURL/auth/verify'),
    //   headers: <String, String>{
    //     'Content-Type': 'application/json; charset=UTF-8',
    //   },
    //   body: jsonEncode(<String, dynamic>{
    //     "code": verificationCode,
    //     "email": email,
    //   })
    // );

    // if (response.statusCode == 201) {

    //   var token = jsonDecode(response.body)['access-token'];
    //   return token;
    // } else {
    //   throw Exception("Error_WHILE_SENDING_OTP");
    // }
    debugPrint(
        '[Provider matchcode] ${email}, ${username}, ${verificationCode}');

    final mockResponse = {
      'statusCode': 201,
      'body': jsonEncode({'access-token': 'your_fake_access_token'}),
    };
    // Simulate the API call and response
    if (verificationCode == '123456') {
      return jsonEncode({'access-token': 'your_fake_access_token'});
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
