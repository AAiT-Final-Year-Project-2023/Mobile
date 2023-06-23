import 'package:data_shelf/auth/models/user_model.dart';
import 'package:data_shelf/dataset/models/dataset_model.dart';

abstract class VoteState {}

class InitialVoteState extends VoteState {}

class VoteSuccessState extends VoteState {
  final bool hasVoted;
  final DatasetModel dm;
  VoteSuccessState({required this.hasVoted, required this.dm});
}

class VoteErrorState extends VoteState {
  final String errorMessage;

  VoteErrorState(this.errorMessage);
}
