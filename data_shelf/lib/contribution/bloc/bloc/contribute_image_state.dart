part of 'contribute_image_bloc.dart';

abstract class ContributeImageState {
  @override
  List<Object?> get props => [];
}

class ContributeImageInitial extends ContributeImageState {}

class ContributeImageLoading extends ContributeImageState {
  ContributeImageLoading();
}

class ContributeImageSuccess extends ContributeImageState {
  ContributeImageSuccess();
}

class ContributeImageError extends ContributeImageState {
  final String errorMessage;

  ContributeImageError({required this.errorMessage});
}
