import 'package:equatable/equatable.dart';

class OTPVerificationState extends Equatable {
  final String code;
  final String email;
  final String username;
  const OTPVerificationState(
      {this.code = '', this.email = '', this.username = ''});

  OTPVerificationState copyWith({
    String? email,
    String? code,
    String? username,
  }) {
    return OTPVerificationState(
        code: code ?? this.code, email: email ?? this.email);
  }

  @override
  List<Object> get props => [this.code, this.email];
}

class OTPVerificationInitial extends OTPVerificationState {
  const OTPVerificationInitial();
}

class OTPVerifyingState extends OTPVerificationState {
  const OTPVerifyingState();
}

class OTPVerifiedState extends OTPVerificationState {
  const OTPVerifiedState();
}

class OTPErrorState extends OTPVerificationState {
  final String errorMessage;

  const OTPErrorState(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}
