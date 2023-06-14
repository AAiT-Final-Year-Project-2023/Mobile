import 'package:data_shelf/dataset/bloc/load_dataset/dataset_event.dart';
import 'package:data_shelf/dataset/bloc/load_dataset/dataset_state.dart';
import 'package:data_shelf/dataset/repository/dataset_repository.dart';
import 'package:data_shelf/home/bloc/user_info_event.dart';
import 'package:data_shelf/home/bloc/user_info_state.dart';
import 'package:data_shelf/home/repository/user_info_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DatasetBloc extends Bloc<DatasetEvent, DatasetState> {
  final DatasetRepository datasetRepository;

  DatasetBloc(this.datasetRepository) : super(LoadDatasetInitial()) {
    on<LoadDatasetEvent>((event, emit) async {
      try {
        final datasets = await datasetRepository.loadDataset();
        print('[Dataset UI]');
        emit(DatasetLoaded(datasets));
      } catch (e) {
        emit(LoadDatasetError(e.toString()));
      }
    });
  }
}
