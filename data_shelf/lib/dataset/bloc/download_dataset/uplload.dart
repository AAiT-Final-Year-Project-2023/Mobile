// @override
//   Future<bool> createEpisode(String title, String description, String podcastId,
//       File episodeFile) async {
//     try {
//       SecureStorage secureStorage = SecureStorage();
//       String? token = await secureStorage.getAccessToken();
//       token ??= '';

//       final fileBytes = episodeFile.readAsBytesSync();
//       http.MultipartRequest request =
//           http.MultipartRequest("POST", Uri.parse("$apiUrl/episodes/"));
//       http.MultipartFile multipartFile = http.MultipartFile.fromBytes(
//         "file",
//         fileBytes,
//         contentType: MediaType('audio', 'mpeg'),
//         filename: episodeFile.path.split("/").last,
//       );

//       request.fields["title"] = title;
//       request.fields["description"] = description;
//       request.fields["podcast_id"] = podcastId;
//       request.headers.addAll({"Authorization": 'Bearer $token'});
//       request.headers["Content-Type"] = "multipart/form-data";
//       request.files.add(multipartFile);

//       var response = await request.send();
//       if (response.statusCode == 401) {
//         String? refreshToken = await secureStorage.getRefreshToken();
//         refreshToken ??= "";
//         // 
//         var body = json.encode({
//           "refresh": refreshToken,
//         });
//         final refreshResponse = await http.post(
//           Uri.parse(Constants.refreshTokenUrl),
//           headers: <String, String>{
//             'Content-Type': 'application/json',
//           },
//           body: body,
//         );
//         if (refreshResponse.statusCode == 401) {
//           await secureStorage.deleteAll();
//           throw UnauthorizedUserException(ErrorType.HTTP_401_EXPIRED_TOKEN);
//         }
//         token = json.decode(refreshResponse.body)["access"];
//         await secureStorage.setAccessToken(token!);

//         http.MultipartRequest request =
//             http.MultipartRequest("POST", Uri.parse("$apiUrl/episodes/"));
//         http.MultipartFile multipartFile = http.MultipartFile.fromBytes(
//           "file",
//           fileBytes,
//           contentType: MediaType('audio', 'mpeg'),
//           filename: episodeFile.path.split("/").last,
//         );

//         request.fields["title"] = title;
//         request.fields["description"] = description;
//         request.fields["podcast_id"] = podcastId;
//         request.headers.addAll({"Authorization": 'Bearer $token'});
//         request.headers["Content-Type"] = "multipart/form-data";
//         request.files.add(multipartFile);
//         response = await request.send();
//       }
//       if (response.statusCode == 200 || response.statusCode == 201) {
//         return true;
//       }
//       return false;
//     } on SocketException {
//       throw NetworkException(ErrorType.CONNECTION_ERROR);
//     } catch (e) {
//       throw NetworkException(ErrorType.CONNECTION_ERROR);
//     }
//   }