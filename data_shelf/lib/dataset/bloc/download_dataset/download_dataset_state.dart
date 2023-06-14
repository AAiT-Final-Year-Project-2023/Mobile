import 'package:data_shelf/auth/models/user_model.dart';

abstract class DatasetState {}

class LoadDatasetInitial extends DatasetState {}

class LoadDatasetLoaded extends DatasetState {
  final UserModel userModel;

  LoadDatasetLoaded(this.userModel);
}

class LoadDatasetError extends DatasetState {
  final String errorMessage;

  LoadDatasetError(this.errorMessage);
}
