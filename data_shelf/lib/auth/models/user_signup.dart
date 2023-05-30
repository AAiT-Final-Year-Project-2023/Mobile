// To parse this JSON data, do
//
//     final userSignupEmail = userSignupEmailFromJson(jsonString);

import 'dart:convert';

UserSignupEmail userSignupEmailFromJson(String str) =>
    UserSignupEmail.fromJson(json.decode(str));

String userSignupEmailToJson(UserSignupEmail data) =>
    json.encode(data.toJson());

class UserSignupEmail {
  final String username;
  final String email;
  final String password;

  UserSignupEmail({
    required this.username,
    required this.email,
    required this.password,
  });

  UserSignupEmail copyWith({
    String? username,
    String? email,
    String? password,
  }) =>
      UserSignupEmail(
        username: username ?? this.username,
        email: email ?? this.email,
        password: password ?? this.password,
      );

  factory UserSignupEmail.fromJson(Map<String, dynamic> json) =>
      UserSignupEmail(
        username: json["username"],
        email: json["email"],
        password: json["password"],
      );

  Map<String, dynamic> toJson() => {
        "username": username,
        "email": email,
        "password": password,
      };
}
