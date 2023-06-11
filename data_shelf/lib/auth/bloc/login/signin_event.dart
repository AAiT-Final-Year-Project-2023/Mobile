import 'package:equatable/equatable.dart';

abstract class SigninEvent extends Equatable {}

class SigninWithGoogle extends SigninEvent {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class SigninWithEmailSubmitted extends SigninEvent {
  final String username;
  final String email;
  final String password;

  SigninWithEmailSubmitted(
      {required this.username, required this.email, required this.password});
  @override
  List<Object?> get props => [];
}
