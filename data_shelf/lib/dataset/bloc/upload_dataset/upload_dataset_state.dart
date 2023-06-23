import 'package:data_shelf/auth/models/user_model.dart';
import 'package:data_shelf/dataset/models/dataset_model.dart';
import 'package:equatable/equatable.dart';

class UploadDatasetState extends Equatable {
  @override
  List<Object?> get props => [];
}

class UploadDatasetInitial extends UploadDatasetState {
  UploadDatasetInitial();
}

class UploadDatasetLoading extends UploadDatasetState {
  UploadDatasetLoading();
}

class UploadDatasetSuccess extends UploadDatasetState {
  UploadDatasetSuccess();
}

class UploadDatasetError extends UploadDatasetState {
  final String errorMessage;

  UploadDatasetError({required this.errorMessage});
}
