import 'package:data_shelf/auth/bloc/login/signin_event.dart';
import 'package:data_shelf/auth/bloc/login/signin_state.dart';
import 'package:data_shelf/auth/form_submission_state.dart';
import 'package:data_shelf/auth/repository/auth_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SigninBloc extends Bloc<SigninEvent, SigninState> {
  final AuthRepository authRepository;
  SigninBloc({required this.authRepository}) : super(SigninState()) {
    on<SigninWithEmailSubmitted>(
      (event, emit) async {
        emit(state.copyWith(formState: FormSubmitting()));
        try {
          debugPrint('[BLOC] Login with Emial Event sent from UI form');
          debugPrint(
              'password: ${event.password} \n username: ${event.username}');
          await authRepository.login(
            username: event.username,
            password: event.password,
          );
          emit(state.copyWith(
            formState: SubmissionSuccess(),
            username: event.username,
          ));
        } catch (e) {
          debugPrint(e.toString());
          emit(state.copyWith(
              formState: SubmissionFailed(Exception(e), e.toString())));
        }
      },
    );
  }
}
