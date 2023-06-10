// class authbloc extends bloc<Authevent,Authstate>
// Repo =  repository obj()
// onloginsubmitedd
// try(
//   emit loading :
//     repo.loadiningfunction
// emit success:

// get the user created
// save user.id to storage

// )
// catch
// emit error

import 'package:data_shelf/auth/bloc/signup/signup_event.dart';
import 'package:data_shelf/auth/bloc/signup/signup_state.dart';
import 'package:data_shelf/auth/bloc/verifyEmail/verify_OTP_event.dart';
import 'package:data_shelf/auth/bloc/verifyEmail/verify_OTP_state.dart';
import 'package:data_shelf/auth/repository/auth_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Define the BLoC
class OTPVerificationBloc
    extends Bloc<OTPVerificationEvent, OTPVerificationState> {
  final AuthRepository authRepository;

  OTPVerificationBloc({required this.authRepository})
      : super(OTPVerificationInitial());

  String _code = ''; // Private variable to store the entered OTP code

  String get code =>
      _code; // Getter property for accessing the entered OTP code

  @override
  Stream<OTPVerificationState> mapEventToState(
      OTPVerificationEvent event) async* {
    if (event is OTPEnteredEvent) {
      // Perform any necessary validation here

      yield OTPVerifyingState();

      try {
        // Call your OTP verification API here
        await authRepository.matchCodeEntered(
          email: event.email,
          verificationCode: event.code,
          userName: event.username,
        );
        // Replace this with your actual API call
        // await Future.delayed(Duration(seconds: 2));

        // Simulate a successful verification
        // put to shared prefernces
        yield OTPVerifiedState();
      } catch (e) {
        yield OTPErrorState('An error occurred');
      }
    }
  }
}

class OTPVerificationBloc2
    extends Bloc<OTPVerificationEvent, OTPVerificationState> {
  final AuthRepository authRepository;
  OTPVerificationBloc2({required this.authRepository})
      : super(OTPVerificationInitial()) {
    on<OTPEnteredEvent>(
      (event, emit) async {
        emit(OTPVerifyingState());
        try {
          debugPrint('[BLOC] Code sent from UI form');

          debugPrint('email : ${event.email} \n code: ${event.code}');
          await authRepository.matchCodeEntered(
            email: event.email,
            verificationCode: event.code,
            userName: event.username,
          );
          debugPrint('[BLOC] Code sent Verified');
          emit(OTPVerifiedState());
        } catch (e) {
          debugPrint(e.toString());
          emit(OTPErrorState(e.toString()));
        }
      },
    );
  }
}
