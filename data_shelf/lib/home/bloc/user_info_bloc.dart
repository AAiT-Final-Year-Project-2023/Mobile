import 'package:data_shelf/home/bloc/user_info_event.dart';
import 'package:data_shelf/home/bloc/user_info_state.dart';
import 'package:data_shelf/home/repository/user_info_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserInfoBloc extends Bloc<UserInfoEvent, UserInfoState> {
  final UserInfoRepository userInfoRepository;

  UserInfoBloc(this.userInfoRepository) : super(UserInfoInitial()) {
    on<FetchUserInfoEvent>((event, emit) async {
      try {
        final userInfo = await userInfoRepository.getUserInfo();
        emit(UserInfoLoaded(userInfo));
      } catch (e) {
        emit(UserInfoError(e.toString()));
      }
    });
  }
}
