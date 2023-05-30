// class Auth_event:

// class signupgoogle extends authevent
// class signupemail extends authevent

import 'package:equatable/equatable.dart';

abstract class SignupEvent extends Equatable {}

class SignUpWithGoogle extends SignupEvent {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class SignupNameChanged extends SignupEvent {
  final String username;

  SignupNameChanged({required this.username});

  @override
  List<Object?> get props => [username];
}

class SignupEmailChanged extends SignupEvent {
  final String email;

  SignupEmailChanged({required this.email});

  @override
  List<Object?> get props => [email];
}

class SignupPhoneChanged extends SignupEvent {
  final String phone;

  SignupPhoneChanged({required this.phone});

  @override
  List<Object?> get props => [phone];
}

class SignupPasswordChanged extends SignupEvent {
  final String password;

  SignupPasswordChanged({required this.password});

  @override
  List<Object?> get props => [password];
}

class SignupSubmitted extends SignupEvent {
  final String username;
  final String email;
  final String phone;
  final String password;

  SignupSubmitted(
      {required this.username,
      required this.email,
      required this.phone,
      required this.password});
  @override
  List<Object?> get props => [];
}
