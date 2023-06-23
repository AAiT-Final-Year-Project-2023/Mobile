import 'package:bloc/bloc.dart';
import 'package:data_shelf/dataset/bloc/upload_dataset/upload_dataset_event.dart';
import 'package:data_shelf/dataset/bloc/upload_dataset/upload_dataset_state.dart';
import 'package:data_shelf/dataset/repository/dataset_repository.dart';
import 'package:equatable/equatable.dart';

class UploadDatasetBloc extends Bloc<UploadDatasetEvent, UploadDatasetState> {
  final DatasetRepository datasetRepository;
  UploadDatasetBloc({required this.datasetRepository})
      : super(UploadDatasetInitial()) {
    on<UploadDatasetClickedEvent>((event, emit) async {
      emit(UploadDatasetLoading());
      try {
        await datasetRepository.uploadFile(
            dataType: event.dataType,
            description: event.description,
            filePath: event.filePath,
            labels: event.labels,
            title: event.title);
        emit(UploadDatasetSuccess());
      } catch (e) {
        emit(UploadDatasetError(errorMessage: "Could not upload "));
      }
    });
  }
}

// class SigninBloc extends Bloc<SigninEvent, SigninState> {
//   final AuthRepository authRepository;
//   SigninBloc({required this.authRepository}) : super(SigninState()) {
//     on<SigninWithEmailSubmitted>(
//       (event, emit) async {
//         emit(state.copyWith(formState: FormSubmitting()));
//         try {
//           debugPrint('[BLOC] Login with Emial Event sent from UI form');
//           debugPrint(
//               'password: ${event.password} \n username: ${event.username}');
//           await authRepository.login(
//             username: event.username,
//             password: event.password,
//           );
//           emit(state.copyWith(
//             formState: SubmissionSuccess(),
//             username: event.username,
//           ));
//         } catch (e) {
//           debugPrint(e.toString());
//           emit(state.copyWith(
//               formState: SubmissionFailed(Exception(e), e.toString())));
//         }
//       },
//     );
//   }
// }