import 'dart:io';

import 'package:data_shelf/dataset/bloc/load_dataset/dataset_event.dart';
import 'package:data_shelf/dataset/bloc/load_dataset/dataset_state.dart';
import 'package:data_shelf/dataset/bloc/upload_dataset/upload_dataset_event.dart';
import 'package:data_shelf/dataset/bloc/upload_dataset/upload_dataset_state.dart';
import 'package:data_shelf/dataset/repository/dataset_repository.dart';
import 'package:data_shelf/home/bloc/user_info_event.dart';
import 'package:data_shelf/home/bloc/user_info_state.dart';
import 'package:data_shelf/home/repository/user_info_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// class UploadDatasetBloc extends Bloc<UploadDatasetBloc, UploadDatasetState> {
//   final DatasetRepository datasetRepository;

//   UploadDatasetBloc(this.datasetRepository) : super(UploadDatasetInitial()) {
//     on<UploadDatasetClickedEvent>((event, emit) async {
//       try {
//         final datasets = await datasetRepository.uploadFile();
//         print('[Dataset UI]');
//         emit(DatasetLoaded(datasets));
//       } catch (e) {
//         emit(LoadDatasetError(e.toString()));
//       }
//     });
//   }
// }

class UploadDatasetBloc extends Bloc<UploadDatasetEvent, UploadDatasetState> {
  UploadDatasetBloc() : super(UploadDatasetInitial());

  @override
  Stream<UploadDatasetEvent> mapEventToState(UploadDatasetEvent event) async* {
    if (event is FileSelectedEvent) {
      // yield state.copyWith(selectedFilePath: event.selectedFilePath);
    } else if (event is UploadDatasetClickedEvent) {
      // Perform additional validations if required
      if (_isValidForm()) {
        // Perform any necessary operations like uploading the file or saving the data
        // You can access the form data from the current state
        final uploadState = state;
        // Example: Saving the file to a temporary directory
        // final appDir = await getTemporaryDirectory();
        // final file = File('${appDir.path}/uploaded_file.zip');
        // await File(uploadState.selectedFilePath).copy(file.path);
        // // Perform other actions as needed

        // // Emit a success state or any other appropriate state
        // yield UploadScreenState(
        //   selectedFilePath: '',
        //   title: '',
        //   description: '',
        //   labels: [],
        //   dataType: '',
        // );
      }
    }
  }

  bool _isValidForm() {
    final uploadState = state;
    // Add your form validation logic here
    if (uploadState.selectedFilePath.isEmpty) {
      // File not selected
      return false;
    }
    if (uploadState.title.isEmpty) {
      // Title is required
      return false;
    }
    // Add more validation checks as needed
    return true;
  }
}
