import 'dart:io';

import 'package:data_shelf/auth/data_provider/auth_data_provider.dart';
import 'package:data_shelf/dataset/data_provider/dataset_data_provider.dart';

import '../models/dataset_model.dart';

class DatasetRepository {
  final DatasetDataProvider datasetDataProvider;
  // final AuthDataProvider authDataProvider;

  DatasetRepository({
    // required this.authDataProvider,
    required this.datasetDataProvider,
  });

  Future<List<DatasetModel>> loadDataset() async {
    return await datasetDataProvider.loadDataset();
  }

  Future<void> uploadFile(
      {required String filePath,
      required String title,
      required String description,
      required List<String> labels,
      required String dataType}) async {
    return await datasetDataProvider.uploadFile(
        filePath, title, description, labels, dataType);
  }

  Future<DatasetModel> upvoteDataset(String id) async {
    return await datasetDataProvider.upvoteDataset(id);
  }

  uploadImage(
    Set set,
    requestPost,
    dataLabel,
    dataInfo,
  ) {}
}
