import 'package:equatable/equatable.dart';

abstract class OTPVerificationEvent extends Equatable {
  const OTPVerificationEvent();

  @override
  List<Object> get props => [];
}

class OTPEnteredEvent extends OTPVerificationEvent {
  final String code;
  final String email;
  final String username;
  const OTPEnteredEvent(this.code, this.email, this.username);

  @override
  List<Object> get props => [this.code, this.email, this.username];
}

class ResendOTPEvent extends OTPVerificationEvent {
  const ResendOTPEvent();
}
