class UploadDatasetEvent {}

class FileSelectedEvent extends UploadDatasetEvent {
  final String selectedFilePath;

  FileSelectedEvent({required this.selectedFilePath});
}

class UploadDatasetClickedEvent extends UploadDatasetEvent {}
