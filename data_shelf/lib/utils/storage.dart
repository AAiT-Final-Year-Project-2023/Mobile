import 'package:data_shelf/auth/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage {
  final FlutterSecureStorage storage = const FlutterSecureStorage();

  writeSecureData(String key, String value) async {
    await storage.write(key: key, value: value);
  }

  readSecureData(String key) async {
    String value = await storage.read(key: key) ?? 'No data found!';
    debugPrint('Data read from secure storage: $value');
  }

  deleteSecureData(String key) async {
    await storage.delete(key: key);
  }

  Future<void> saveUserData(UserModel user) async {
    await storage.write(key: 'userId', value: user.id);
    await storage.write(key: 'username', value: user.username);
    await storage.write(key: 'email', value: user.email);
    await storage.write(key: 'image', value: user.image);
    await storage.write(
        key: 'currentBalance', value: user.currentBalance.toString());
    await storage.write(
        key: 'totalEarnings', value: user.totalEarnings.toString());
    await storage.write(
        key: 'bankInformation', value: user.bankInformation.toString());
    // Save other user data properties to secure storage as needed
  }

  Future<Map<String, String>> getUserData() async {
    final userID = await storage.read(key: 'userID') ?? '';
    final username = await storage.read(key: 'username') ?? '';
    final email = await storage.read(key: 'email') ?? '';
    final token = await storage.read(key: 'token') ?? '';
    final image = await storage.read(key: 'image') ?? '';
    final currentBalance = await storage.read(key: 'currentBalance') ?? '';
    final totalEarnings = await storage.read(key: 'totalEarnings') ?? '';
    final bankInformation = await storage.read(key: 'bankInformation') ?? '';

    return {
      'userID': userID,
      'username': username,
      'email': email,
      'token': token,
      'image': image,
      'currentBalance': currentBalance,
      'totalEarnings': totalEarnings,
      'bankInformation': bankInformation
    };
  }

  Future<void> deleteUserData() async {
    await storage.delete(key: 'username');
    await storage.delete(key: 'email');
    await storage.delete(key: 'token');
    await storage.read(key: 'userID');
    await storage.read(key: 'image');
    await storage.read(key: 'currentBalance');
    await storage.read(key: 'totalEarnings');
    await storage.read(key: 'bankInformation');
  }
}
