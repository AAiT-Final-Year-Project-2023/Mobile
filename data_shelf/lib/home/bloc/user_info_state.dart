import 'package:data_shelf/auth/models/user_model.dart';

abstract class UserInfoState {}

class UserInfoInitial extends UserInfoState {}

class UserInfoLoaded extends UserInfoState {
  final UserModel userModel;

  UserInfoLoaded(this.userModel);
}

class UserInfoError extends UserInfoState {
  final String errorMessage;

  UserInfoError(this.errorMessage);
}
