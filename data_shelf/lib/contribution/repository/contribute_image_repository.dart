import 'package:data_shelf/contribution/data_provider/contribute_image_data_provider.dart';

class ContributionRepository {
  final ContributionDataProvider contributionDataProvider;
  // final AuthDataProvider authDataProvider;

  ContributionRepository({
    // required this.authDataProvider,
    required this.contributionDataProvider,
  });

  Future<void> uploadImage(
      {required String filePath,
      required String requestPost,
      required String dataLabel,
      required String dataInfo}) async {
    return await contributionDataProvider.uploadImage(
        filePath, requestPost, dataLabel, dataInfo);
  }
}
