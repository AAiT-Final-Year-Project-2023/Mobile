import 'package:data_shelf/auth/form_submission_state.dart';
import 'package:equatable/equatable.dart';

class SigninState extends Equatable {
  final String username;
  final String password;
  final FormSubmissionState formState;

  SigninState(
      {this.username = '',
      this.password = '',
      this.formState = const InitialFormStatus()});

  SigninState copyWith({
    String? username,
    String? password,
    FormSubmissionState? formState,
  }) {
    return SigninState(
        password: password ?? this.password,
        formState: formState ?? this.formState);
  }

  @override
  List<Object?> get props => [this.password, this.formState];
}
