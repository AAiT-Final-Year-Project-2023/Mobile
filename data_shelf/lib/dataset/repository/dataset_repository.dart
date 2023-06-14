import 'dart:io';

import 'package:data_shelf/dataset/data_provider/dataset_data_provider.dart';

import '../models/dataset_model.dart';

class DatasetRepository {
  final DatasetDataProvider datasetDataProvider;

  DatasetRepository({required this.datasetDataProvider});

  Future<List<DatasetModel>> loadDataset() async {
    return await datasetDataProvider.loadDataset();
  }

  Future<void> uploadFile(File file, String title, String description,
      List<String> labels, String dataType) async {
    return await datasetDataProvider.uploadFile(
        file, title, description, labels, dataType);
  }
}
