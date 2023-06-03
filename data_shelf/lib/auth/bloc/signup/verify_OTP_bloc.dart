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
import 'package:data_shelf/auth/bloc/signup/verify_OTP_event.dart';
import 'package:data_shelf/auth/bloc/signup/verify_OTP_state.dart';
import 'package:data_shelf/auth/repository/auth_repository.dart';
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
        );
        // Replace this with your actual API call
        // await Future.delayed(Duration(seconds: 2));

        // Simulate a successful verification
        final isOTPValid = event.code == '123456';

        if (isOTPValid) {
          yield OTPVerifiedState();
        } else {
          yield OTPErrorState('Invalid OTP');
        }
      } catch (e) {
        yield OTPErrorState('An error occurred');
      }
    }
  }
}
