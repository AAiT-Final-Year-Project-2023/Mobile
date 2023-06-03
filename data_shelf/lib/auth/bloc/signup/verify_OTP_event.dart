import 'package:equatable/equatable.dart';

abstract class OTPVerificationEvent extends Equatable {
  const OTPVerificationEvent();

  @override
  List<Object> get props => [];
}

class OTPEnteredEvent extends OTPVerificationEvent {
  final String code;
  final String email;
  const OTPEnteredEvent(this.code, this.email);

  @override
  List<Object> get props => [code];
}

class ResendOTPEvent extends OTPVerificationEvent {
  const ResendOTPEvent();
}
