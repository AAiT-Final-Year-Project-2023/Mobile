import 'package:data_shelf/auth/bloc/resendOTP/resend_otp_event.dart';
import 'package:data_shelf/auth/bloc/resendOTP/resend_otp_state.dart';
import 'package:data_shelf/auth/bloc/signup/signup_state.dart';
import 'package:data_shelf/auth/form_submission_state.dart';
import 'package:data_shelf/auth/repository/auth_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ResendOTPBloc extends Bloc<ResendOTPEvent, ResendOTPState> {
  final AuthRepository authRepository;
  ResendOTPBloc({required this.authRepository}) : super(ResendOTPState()) {
    on<ResendOTPSubmittedEvent>(
      (event, emit) async {
        emit(state.copyWith(formState: FormSubmitting()));
        try {
          debugPrint('[BLOC] Resend OTP Event sent from UI');
          debugPrint('email: ${event.email}');
          await authRepository.resendOTP(
              email: event.email, username: event.username);
          emit(state.copyWith(formState: SubmissionSuccess()));
        } catch (e) {
          debugPrint(e.toString());
          emit(state.copyWith(
              formState: SubmissionFailed(Exception(e), e.toString())));
        }
      },
    );
  }
}
