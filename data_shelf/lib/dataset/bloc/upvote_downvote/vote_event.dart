class VoteEvent {}

class UpvoteEvent extends VoteEvent {
  final String datasetId;
  UpvoteEvent(this.datasetId);
}

class DownvoteEvent extends VoteEvent {
  final String datasetId;
  DownvoteEvent(this.datasetId);
}
