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
    on<SignupWithEmailSubmitted>(
      (event, emit) async {
        emit(state.copyWith(formState: FormSubmitting()));
        try {
          debugPrint('[BLOC] Register with Emial Event sent from UI form');
          debugPrint(
              'name : ${event.username} \n password: ${event.password} \n email: ${event.email}');
          await authRepository.signup(
            username: event.username,
            email: event.email,
            password: event.password,
          );
          emit(state.copyWith(
            formState: SubmissionSuccess(),
            username: event.username,
            email: event.email,
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
