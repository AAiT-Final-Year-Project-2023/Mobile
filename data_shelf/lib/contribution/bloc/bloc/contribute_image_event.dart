part of 'contribute_image_bloc.dart';

class ContributeImageEvent {}

class UploadImageClickedEvent extends ContributeImageEvent {
  final String filePath;
  final String requestPost;
  final String dataLabel;
  final String dataInfo;

  UploadImageClickedEvent(this.requestPost, this.dataLabel, this.dataInfo,
      {required this.filePath});
}
