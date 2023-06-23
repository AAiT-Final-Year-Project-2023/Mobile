// import 'dart:io';
// import 'package:flutter_bloc/flutter_bloc.dart';

// import 'dart:io';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:http/http.dart' as http;

// enum FileDownloadEvent { StartDownload }

// class FileDownloadBloc extends Bloc<FileDownloadEvent, File> {
//   FileDownloadBloc() : super();

//   @override
//   Stream<File> mapEventToState(FileDownloadEvent event) async* {
//     if (event == FileDownloadEvent.StartDownload) {
//       final file = await _downloadFile(); // Await the download operation
//       yield file;
//     }
//   }

//   Future<File> _downloadFile() async {
//     final url = 'https://example.com/sample_image.jpg';
//     final response = await http.get(Uri.parse(url));

//     final file = File('/path/to/save/file.jpg');
//     await file
//         .writeAsBytes(response.bodyBytes); // Await the file write operation

//     return file;
//   }
// }
