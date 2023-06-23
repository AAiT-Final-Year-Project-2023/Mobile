import 'package:bloc/bloc.dart';
import 'package:data_shelf/dataset/bloc/upvote_downvote/vote_event.dart';
import 'package:data_shelf/dataset/bloc/upvote_downvote/vote_state.dart';
import 'package:data_shelf/dataset/repository/dataset_repository.dart';
import 'package:data_shelf/utils/storage.dart';
import 'package:http/http.dart' as http;

class VoteBloc extends Bloc<VoteEvent, VoteState> {
  final DatasetRepository datasetRepository;
  SecureStorage ss = SecureStorage();

  VoteBloc(this.datasetRepository) : super(InitialVoteState()) {
    on<UpvoteEvent>((event, emit) async {
      try {
        final dataset = await datasetRepository.upvoteDataset(event.datasetId);
        // do logic
        bool hasVoted = true;
        print("dataset upvoted");
        emit(
          VoteSuccessState(hasVoted: hasVoted, dm: dataset),
        );
      } catch (e) {
        emit(VoteErrorState(e.toString()));
      }
    });
  }
}

  // @override
  // Stream<VoteState> mapEventToState(VoteEvent event) async* {
  //   if (event is UpvoteEvent) {
  //     yield* _mapUpvoteEventToState(event.datasetId);
  //   } else if (event is DownvoteEvent) {
  //     yield* _mapDownvoteEventToState(event.datasetId);
  //   }
  // }

//   Stream<VoteState> _mapUpvoteEventToState(String datasetId) async* {
//     yield InitialVoteState();

//     try {
//       final url = '$baseUrl/api/dataset/$datasetId/upvote';
//       final response = await http.post(Uri.parse(url));

//       if (response.statusCode == 200) {
//         yield VoteSuccessState();
//       } else {
//         yield VoteErrorState('Failed to upvote the dataset');
//       }
//     } catch (e) {
//       yield VoteErrorState('An error occurred while upvoting');
//     }
//   }

//   Stream<VoteState> _mapDownvoteEventToState(String datasetId) async* {
//     yield InitialVoteState();

//     try {
//       final url = '$baseUrl/api/dataset/$datasetId/downvote';
//       final response = await http.post(Uri.parse(url));

//       if (response.statusCode == 200) {
//         yield VoteSuccessState();
//       } else {
//         yield VoteErrorState('Failed to downvote the dataset');
//       }
//     } catch (e) {
//       yield VoteErrorState('An error occurred while downvoting');
//     }
//   }
// }
