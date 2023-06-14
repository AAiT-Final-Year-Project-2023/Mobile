import 'package:data_shelf/auth/models/user_model.dart';
import 'package:data_shelf/dataset/models/dataset_model.dart';

abstract class DatasetState {}

class LoadDatasetInitial extends DatasetState {}

class DatasetLoaded extends DatasetState {
  final List<DatasetModel> datasetModel;

  DatasetLoaded(this.datasetModel);
}

class LoadDatasetError extends DatasetState {
  final String errorMessage;

  LoadDatasetError(this.errorMessage);
}
