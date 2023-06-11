import 'package:equatable/equatable.dart';

abstract class ResendOTPEvent extends Equatable {
  const ResendOTPEvent();
  @override
  List<Object> get props => [];
}

class ResendOTPSubmittedEvent extends ResendOTPEvent {
  final String email;
  final String username;
  const ResendOTPSubmittedEvent({this.email = '', this.username = ''});
}
