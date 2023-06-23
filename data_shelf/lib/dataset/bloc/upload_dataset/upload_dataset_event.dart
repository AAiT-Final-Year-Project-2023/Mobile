class UploadDatasetEvent {}

class UploadDatasetClickedEvent extends UploadDatasetEvent {
  final String filePath;
  final String title;
  final String description;
  final List<String> labels;
  final String dataType;

  UploadDatasetClickedEvent(
      {required this.filePath,
      required this.title,
      required this.description,
      required this.labels,
      required this.dataType});
}
