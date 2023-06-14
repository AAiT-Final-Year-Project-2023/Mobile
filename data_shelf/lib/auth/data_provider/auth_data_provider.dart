// Http package

// class ADP
// feature  loginwithemail()
// feature  loginwithgoogle()

// API call and response json file decode

import 'dart:convert';
import 'package:data_shelf/auth/models/user_model.dart';
import 'package:data_shelf/auth/models/user_signup.dart';
import 'package:data_shelf/utils/config.dart';
import 'package:data_shelf/utils/storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class AuthDataProvider {
  final _baseURL = BASE_URL;
  final http.Client httpClient;
  SecureStorage secureStorage = SecureStorage();

  AuthDataProvider({required this.httpClient});

  Future<bool> signUp(
      {required String username,
      required String email,
      required String password}) async {
    debugPrint('[Provider] $username, $email, $password');
    debugPrint(
        "Trying to connect .................................................");
    var name_on_storage = await secureStorage.readSecureData("username");
    var email_on_storage = await secureStorage.readSecureData("email");
    var token_on_storage = await secureStorage.readSecureData("token");

    debugPrint(
        '[Provider SignUn] Current Storge status:  $name_on_storage | $email_on_storage | $token_on_storage');

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

      Map<String, dynamic> decodedResponse = jsonDecode(response.body);

      var token = decodedResponse['access_token'];

      // Fetch user data from /user/me endpoint using the obtained token
      final userResponse = await httpClient.get(
        Uri.parse('$_baseURL/user/me'),
        headers: <String, String>{
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );

      if (userResponse.statusCode == 200) {
        var userData = jsonDecode(userResponse.body);
        var userModel = UserModel.fromJson(userData);
        debugPrint(userModel.email);
        debugPrint("Found user/me  saving to secure storage");
        // Save the user data to secure storage

        await secureStorage.saveUserData(userModel);

        await secureStorage.writeSecureData('token', token);
        return true;
        // return userData;
      } else {
        throw Exception("Error_WHILE_FETCHING_USER_DATA");
      }
    } else {
      debugPrint('[Provider] Error user not Created.');
      debugPrint(jsonDecode(response.body)['body']);

      throw Exception(jsonDecode(response.body)['body']);
    }
  }

// sends post request to the api with the given email and password
  Future<String> signIn(
      {required String username, required String password}) async {
    var name_on_storage = await secureStorage.readSecureData("username");
    var email_on_storage = await secureStorage.readSecureData("email");
    var token_on_storage = await secureStorage.readSecureData("token");

    debugPrint(
        '[Provider SignIn] Current Storge status:  $name_on_storage | $email_on_storage | $token_on_storage');

    final response = await httpClient.post(
      Uri.parse('$_baseURL/auth/signin'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(
          <String, dynamic>{"username": username, "password": password}),
    );
    debugPrint('[Provider Signin] Waiting for user to be Logged in.');

    debugPrint(response.body);
    debugPrint(response.statusCode.toString());
    if (response.statusCode == 201) {
      Map<String, dynamic> decodedResponse = jsonDecode(response.body);

      var token = decodedResponse['access_token'];

      debugPrint(
          '[Provider] Success user ------------------------- Logged in.');

      // Fetch user data from /user/me endpoint using the obtained token
      final userResponse = await httpClient.get(
        Uri.parse('$_baseURL/user/me'),
        headers: <String, String>{
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );

      debugPrint(token);
      debugPrint("Fetching user/me =====================================");
      // return token;
      if (userResponse.statusCode == 200) {
        var userData = jsonDecode(userResponse.body);
        var userModel = UserModel.fromJson(userData);
        debugPrint(userModel.email);
        debugPrint("Found user/me  saving to secure storage");
        // Save the user data to secure storage

        await secureStorage.saveUserData(userModel);

        await secureStorage.writeSecureData('token', token);

        return response.body;
        // return userData;
      } else {
        throw Exception("Error_WHILE_FETCHING_USER_DATA");
      }
    } else {
      debugPrint('[Provider] Error user not logged in.');
      throw Exception('Failed to login user');
    }
  }

  Future<String> matchCodeEntered(
      {required String email,
      required String verificationCode,
      required String username}) async {
    debugPrint(
        '[Provider matchCodeEntered] ---------- OTP RESPONSE --- $email ');

    final response = await httpClient.post(Uri.parse('$_baseURL/auth/verify'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, dynamic>{
          "code": verificationCode,
          "email": email,
        }));

    debugPrint('[Provider] ---------- OTP RESPONSE ${response.body}}');

    if (response.statusCode == 201) {
      String token = jsonDecode(response.body)['access-token'];
      debugPrint('The token is $token');
      await secureStorage.writeSecureData('token', token);
      await secureStorage.writeSecureData('username', username);
      await secureStorage.writeSecureData('email', email);
      return token;
    } else {
      throw Exception("Error_WHILE_SENDING_OTP");
    }
  }

  // sends post request to the api with the token
  Future<String> continueWithGoogle() async {
    final response = await httpClient.post(
        Uri.parse('$_baseURL/auth/continue-with-google'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        });

    debugPrint(response.statusCode.toString());
    debugPrint(response.body);
    if (response.statusCode == 200) {
      return response.body;
    } else {
      throw Exception('Failed to register User');
    }
  }

// not using this
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

  Future<bool> resendOTP({
    required String username,
    required String email,
  }) async {
    print("Sending resend OTP Request");
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
    // return true;
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

  Future<String> finduser() async {
    var token = await secureStorage.readSecureData("token");

    // Fetch user data from /user/me endpoint using the obtained token
    final userResponse = await httpClient.get(
      Uri.parse('$_baseURL/user/me'),
      headers: <String, String>{
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );

    debugPrint(token);
    debugPrint("Fetching user/me =====================================");
    debugPrint(userResponse.toString());

    // return token;
    if (userResponse.statusCode == 200) {
      var userData = jsonDecode(userResponse.body);
      var userModel = UserModel.fromJson(userData);
      debugPrint("Found user/me  saving to secure storage");
      // Save the user data to secure storage

      await secureStorage.saveUserData(userModel);
      return userData;
    } else {
      throw Exception("Error_WHILE_FETCHING_USER_DATA");
    }
  }
}
