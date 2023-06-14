import 'package:data_shelf/auth/bloc/google_auth/google_auth_event.dart';
import 'package:data_shelf/auth/bloc/google_auth/google_auth_state.dart';
import 'package:data_shelf/auth/form_submission_state.dart';
import 'package:data_shelf/auth/repository/auth_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GoogleAuthBloc extends Bloc<GoogleAuthEvent, GoogleAuthState> {
  final AuthRepository authRepository;
  GoogleAuthBloc({required this.authRepository}) : super(GoogleAuthState()) {
    on<SignInWithGoogleEvent>(
      (event, emit) async {
        try {} catch (e) {
          debugPrint(e.toString());
        }
      },
    );
  }
}
