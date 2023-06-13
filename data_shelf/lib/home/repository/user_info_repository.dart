import 'package:data_shelf/auth/models/user_model.dart';
import 'package:data_shelf/home/data_provider/user_info_data_provider.dart';

class UserInfoRepository {
  final UserInfoDataProvider userInfoDataProvider;

  UserInfoRepository({required this.userInfoDataProvider});

  // calls the signin method of auth data provider with given email and password
  Future<UserModel> getUserInfo() async {
    return await userInfoDataProvider.getUserInfo();
  }
}
