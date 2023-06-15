import 'package:data_shelf/auth/models/user_model.dart';
import 'package:data_shelf/dataset/models/dataset_model.dart';
import 'package:equatable/equatable.dart';

class UploadDatasetState {
  final String selectedFilePath;
  final String title;
  final String description;
  final List<String> labels;
  final String dataType;

  UploadDatasetState({
    this.selectedFilePath = '',
    this.title = '',
    this.description = '',
    this.labels = const [],
    this.dataType = '',
  });

  UploadDatasetState copyWith({
    String? selectedFilePath,
    String? title,
    String? description,
    List<String>? labels,
    String? dataType,
  }) =>
      UploadDatasetState(
        selectedFilePath: selectedFilePath ?? this.selectedFilePath,
        title: title ?? this.title,
        description: description ?? this.description,
        labels: labels ?? this.labels,
        dataType: dataType ?? this.dataType,
      );
}

class UploadDatasetInitial extends UploadDatasetState {
  UploadDatasetInitial();
}

class UploadScreenLoading extends UploadDatasetState {
  UploadScreenLoading();
}

class UploadScreenSuccess extends UploadDatasetState {
  final String uploadedFileUrl;

  UploadScreenSuccess({required this.uploadedFileUrl});
}

class UploadScreenError extends UploadDatasetState {
  final String errorMessage;

  UploadScreenError({required this.errorMessage});
}



// import 'dart:async';
// import 'package:bloc/bloc.dart';
// import 'package:meta/meta.dart';

// // Define the state for the upload screen
// class UploadScreenState {
//   final String selectedFilePath;
//   final String title;
//   final String description;
//   final List<String> labels;
//   final String dataType;

//   UploadScreenState({
//     required this.selectedFilePath,
//     required this.title,
//     required this.description,
//     required this.labels,
//     required this.dataType,
//   });
// }

// // Define the events for the upload screen
// abstract class UploadScreenEvent {}

// class FileSelectedEvent extends UploadScreenEvent {
//   final String selectedFilePath;

//   FileSelectedEvent({required this.selectedFilePath});
// }

// class UploadScreenBloc extends Bloc<UploadScreenEvent, UploadScreenState> {
//   UploadScreenBloc() : super(UploadScreenState(
//     selectedFilePath: '',
//     title: '',
//     description: '',
//     labels: [],
//     dataType: '',
//   ));

//   @override
//   Stream<UploadScreenState> mapEventToState(UploadScreenEvent event) async* {
//     if (event is FileSelectedEvent) {
//       yield state.copyWith(selectedFilePath: event.selectedFilePath);
//     }
//     // Add more event handlers here for other events
//   }
// }

// // Helper extension method for copying the state with updated values
// extension UploadScreenStateCopyWith on UploadScreenState {
//   UploadScreenState copyWith({
//     String? selectedFilePath,
//     String? title,
//     String? description,
//     List<String>? labels,
//     String? dataType,
//   }) {
//     return UploadScreenState(
//       selectedFilePath: selectedFilePath ?? this.selectedFilePath,
//       title: title ?? this.title,
//       description: description ?? this.description,
//       labels: labels ?? this.labels,
//       dataType: dataType ?? this.dataType,
//     );
//   }
// }
