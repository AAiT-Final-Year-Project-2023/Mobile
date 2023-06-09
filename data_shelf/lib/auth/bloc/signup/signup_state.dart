import 'package:data_shelf/auth/form_submission_state.dart';
import 'package:equatable/equatable.dart';

class SignupState extends Equatable {
  final String username;
  final String email;
  final String password;
  final FormSubmissionState formState;

  SignupState(
      {this.username = '',
      this.email = '',
      this.password = '',
      this.formState = const InitialFormStatus()});

  SignupState copyWith({
    String? username,
    String? email,
    String? password,
    FormSubmissionState? formState,
  }) {
    return SignupState(
        username: username ?? this.username,
        email: email ?? this.email,
        password: password ?? this.password,
        formState: formState ?? this.formState);
  }

  @override
  List<Object?> get props =>
      [this.email, this.username, this.password, this.formState];
}
