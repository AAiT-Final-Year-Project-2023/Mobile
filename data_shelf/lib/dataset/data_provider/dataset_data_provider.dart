import 'dart:convert';
import 'dart:io';
import 'package:data_shelf/dataset/models/dataset_model.dart';
import 'package:data_shelf/utils/config.dart';
import 'package:data_shelf/utils/storage.dart';
import 'package:http/http.dart' as http;

class DatasetDataProvider {
  final _baseURL = BASE_URL;
  final http.Client httpClient;
  SecureStorage secureStorage = SecureStorage();

  DatasetDataProvider({required this.httpClient});

  Future<List<DatasetModel>> loadDataset() async {
    var token_on_storage = await secureStorage.readSecureData("token");
    var t =
        "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6IkJvbm5pZWYiLCJzdWIiOiJiZjViZDVlNi0xYmU0LTQyNzItYTBmMy0wNWE1YzgxMjU0ZGQiLCJyb2xlcyI6WyJ1c2VyIl0sImlhdCI6MTY4NjQ3NjA0NiwiZXhwIjoxNjg2OTA4MDQ2fQ.eNKDrEbBPqU0py4i5ALlW4a1k5XW47vSuaQ7-w6VH7E";
    // final response = await httpClient.get(
    //   Uri.parse(
    //     '$_baseURL/dataset',
    //   ).replace(queryParameters: {
    //     'page': 1,
    //     'limit': 10,
    //   }),
    //   headers: <String, String>{
    //     'Content-Type': 'application/json',
    //     'Authorization': 'Bearer $token_on_storage',
    //   },
    // );
    final response = await httpClient.get(
      Uri.parse(
        '$_baseURL/dataset/?page=1&limit=10',
      ),
      headers: <String, String>{
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $t',
      },
    );
    print(response.statusCode);
    print(response.body);
    if (response.statusCode == 200) {
      final body = jsonDecode(response.body)['results'];
      print("body");
      print(body.runtimeType);
      final availableDatasets = body as List;
      print("after list");
      print(availableDatasets.runtimeType);
      for (var dataset in availableDatasets) {
        dataset = DatasetModel.fromJson(dataset);
        print(dataset.runtimeType);
      }
      final datasets = availableDatasets
          .map((dataset) => DatasetModel.fromJson(dataset))
          .toList();
      return datasets;
    }
    throw ('Failed to get available datasets');
  }

  Future<void> uploadFile(String filePath, String title, String description,
      List<String> labels, String dataType) async {
    var getuserData = await secureStorage.getUserData();
    String token = getuserData['token']!;
    print(token);
    Map<String, String> headers = {
      HttpHeaders.authorizationHeader: 'Bearer $token',
      'Content-Type': 'multipart/form-data',
      'Accept': '*/*',
      'Accept-Encoding': 'gzip, deflate, br',
      'Connection': 'keep-alive'
    };
    var request = http.MultipartRequest(
        'POST',
        Uri.parse(
          '$_baseURL/dataset',
        ));
    request.headers.addAll(headers);

    // Set the file field
    // request.files.add(await http.MultipartFile.fromPath('file', filePath));
    final fileBytes = await File(filePath).readAsBytes();
    request.files.add(http.MultipartFile.fromBytes(
      'file',
      fileBytes,
      filename: 'file.zip',
    ));
    // Set other form fields
    request.fields['title'] = title;
    request.fields['description'] = description;
    request.fields['labels'] = labels.join(',');
    request.fields['dataType'] = dataType;

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

  Future<DatasetModel> upvoteDataset(String id) async {
    var token_on_storage = await secureStorage.readSecureData("token");
    var t =
        "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6IkJvbm5pZWYiLCJzdWIiOiJiZjViZDVlNi0xYmU0LTQyNzItYTBmMy0wNWE1YzgxMjU0ZGQiLCJyb2xlcyI6WyJ1c2VyIl0sImlhdCI6MTY4NjQ3NjA0NiwiZXhwIjoxNjg2OTA4MDQ2fQ.eNKDrEbBPqU0py4i5ALlW4a1k5XW47vSuaQ7-w6VH7E";
    print(id);
    print("dataset ID");
    final response = await httpClient.get(
      Uri.parse(
        '$_baseURL/dataset/$id/upvote',
      ),
      headers: <String, String>{
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $t',
      },
    );
    print(response.statusCode);
    print(response.body);
    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);

      var dataset = DatasetModel.fromJson(body);

      return dataset;
    }
    throw ('Failed to get available datasets');
  }
}
