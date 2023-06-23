import 'dart:convert';
import 'dart:io';
import 'package:data_shelf/dataset/models/dataset_model.dart';
import 'package:data_shelf/utils/config.dart';
import 'package:data_shelf/utils/storage.dart';
import 'package:http/http.dart' as http;

class ContributionDataProvider {
  final _baseURL = BASE_URL;
  final http.Client httpClient;
  SecureStorage secureStorage = SecureStorage();

  ContributionDataProvider({required this.httpClient});

  Future<void> uploadImage(String filePath, String requestPost,
      String dataLabel, String dataInfo) async {
    var getuserData = await secureStorage.getUserData();
    String token = getuserData['token']!;
    print(token);
    Map<String, String> headers = {
      HttpHeaders.authorizationHeader: 'Bearer $token',
      'Content-Type': 'multipart/form-data',
    };
    var request = http.MultipartRequest(
        'POST',
        Uri.parse(
          '$_baseURL/requestpost/d7dc1fd8-a2f4-4a7b-9c04-33dd4465bc94/contribution/upload',
        ));
    request.headers.addAll(headers);

    // Set the file field
    request.files.add(await http.MultipartFile.fromPath('file', filePath));
    // final fileBytes = await File(filePath).readAsBytes();
    // request.files.add(http.MultipartFile.fromBytes(
    //   'file',
    //   fileBytes,
    //   filename: 'file.zip',
    // ));
    // Set other form fields
    request.fields['request_post'] = requestPost;
    request.fields['data_label'] = dataLabel;
    request.fields['data_info'] = dataInfo;

    var response = await request.send();
    final responseString = await response.stream.bytesToString();
    print(responseString);

    if (response.statusCode == 200) {
      print('File uploaded successfully!');
    } else {
      print('Error uploading file: ${response.reasonPhrase}');
      throw Exception();
    }
  }
}
