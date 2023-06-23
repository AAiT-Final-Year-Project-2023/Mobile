import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import '../../repository/contribute_image_repository.dart';

part 'contribute_image_event.dart';
part 'contribute_image_state.dart';

class ContributeImageBloc
    extends Bloc<ContributeImageEvent, ContributeImageState> {
  final ContributionRepository contributionRepository;

  ContributeImageBloc({required this.contributionRepository})
      : super(ContributeImageInitial()) {
    on<UploadImageClickedEvent>((event, emit) async {
      emit(ContributeImageLoading());
      try {
        await contributionRepository.uploadImage(
            filePath: event.filePath,
            requestPost: event.requestPost,
            dataLabel: event.dataLabel,
            dataInfo: event.dataInfo);
        emit(ContributeImageSuccess());
      } catch (e) {
        emit(ContributeImageError(errorMessage: "Could not upload "));
      }
      // TODO: implement event handler
    });
  }
}
