import 'package:equatable/equatable.dart';

abstract class SignupEvent extends Equatable {}

class SignUpWithGoogle extends SignupEvent {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class SignupWithEmailSubmitted extends SignupEvent {
  final String username;
  final String email;
  final String password;

  SignupWithEmailSubmitted(
      {required this.username, required this.email, required this.password});
  @override
  List<Object?> get props => [];
}
