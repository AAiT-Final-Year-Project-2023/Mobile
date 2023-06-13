import 'package:data_shelf/auth/models/user_model.dart';
import 'package:data_shelf/utils/config.dart';
import 'package:data_shelf/utils/storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class UserInfoDataProvider {
  final _baseURL = BASE_URL;
  final http.Client httpClient;
  SecureStorage secureStorage = SecureStorage();

  UserInfoDataProvider({required this.httpClient});

  Future<UserModel> getUserInfo() async {
    debugPrint('[Provider user info]');
    await secureStorage.readSecureData("username");
    await secureStorage.readSecureData("email");
    await secureStorage.readSecureData("token");
    var userData = await secureStorage.getUserData();
    print("---------------------------");
    print(userData['token'].runtimeType);
    String? token = await userData['token'];
    print(token);
    final userResponse = await httpClient.get(
      Uri.parse('$_baseURL/user/me'),
      headers: <String, String>{
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );
    print(userResponse.body.toString());
    if (userResponse.statusCode == 200) {
      var userData = jsonDecode(userResponse.body);
      var userModel = UserModel.fromJson(userData);
      debugPrint("Found user/me  saving to secure storage");
      // Save the user data to secure storage

      await secureStorage.saveUserData(userModel);
      return userModel;
    } else {
      throw Exception("Error_WHILE_FETCHING_USER_DATA");
    }
  }
}
