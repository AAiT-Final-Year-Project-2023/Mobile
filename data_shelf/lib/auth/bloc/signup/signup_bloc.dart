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
import 'package:data_shelf/auth/form_submission_state.dart';
import 'package:data_shelf/auth/repository/auth_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignupBloc extends Bloc<SignupEvent, SignupState> {
  final AuthRepository authRepository;
  SignupBloc({required this.authRepository}) : super(SignupState()) {
    on<SignupNameChanged>(
      (event, emit) {
        emit(state.copyWith(username: event.username));
      },
    );
    on<SignupEmailChanged>(
      (event, emit) {
        emit(state.copyWith(username: event.email));
      },
    );
    on<SignupPasswordChanged>(
      (event, emit) {
        emit(state.copyWith(username: event.password));
      },
    );
    on<SignupSubmitted>(
      (event, emit) async {
        emit(state.copyWith(formState: FormSubmitting()));
        try {
          await authRepository.signup(
            username: event.username,
            email: event.email,
            password: event.password,
          );
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
