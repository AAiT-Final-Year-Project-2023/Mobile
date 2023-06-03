// class Auth_state:

// class Auth_initial extends auth_state:

// class Auth_succuss extends auth_state:
// can have fields

// class Auth_error extends auth_state:
// class Auth_loading extends auth_state:

import 'package:equatable/equatable.dart';

abstract class OTPVerificationState extends Equatable {
  const OTPVerificationState();

  @override
  List<Object> get props => [];
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
