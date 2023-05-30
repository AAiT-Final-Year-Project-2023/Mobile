// class auth_repository
// dataprovider obj
// will have same function signiture ( feature and async)
// dataprovider.function

import 'package:data_shelf/auth/data_provider/auth_data_provider.dart';

class AuthRepository {
  final AuthDataProvider authDataProvider;

  AuthRepository({required this.authDataProvider});

  // calls the signin method of auth data provider with given email and password
  Future<String> login({
    required String email,
    required String password,
  }) async {
    return await authDataProvider.signIn(email: email, password: password);
  }

  Future<void> signup({
    required String username,
    required String email,
    required String password,
  }) async {
    await authDataProvider.signUp(
        username: username, email: email, password: password);
  }

  Future<bool> verifyEmail(
      {required String email, required int otpCode}) async {
    return await authDataProvider.verifyEmail(email: email, otpCode: otpCode);
  }

  Future<bool> sendEmailForVerificationCode(String email) async {
    return await authDataProvider.sendEmailForVerificationCode(
      email: email,
    );
  }

  Future<String> matchCodeEntered(
      {required String verificationCode, required String email}) async {
    final String resetToken = await authDataProvider.matchCodeEntered(
      email: email,
      verificationCode: verificationCode,
    );
    return resetToken;
  }

//calls continuewithgoogle method of authdataprovider with the token
  Future<String> continueWithGoogle({required String? token}) async {
    return await authDataProvider.continueWithGoogle(token: token);
  }

  //calls updateforgottenpassowrd method of authdataprovider with the token and newpassword
  Future<void> updateForgottenPassword({
    required resetToken,
    required newPassword,
  }) async {
    await authDataProvider.updateForgottenPassword(
      resetToken: resetToken,
      newPassword: newPassword,
    );
  }
}