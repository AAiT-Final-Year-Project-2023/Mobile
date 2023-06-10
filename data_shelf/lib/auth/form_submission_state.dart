import 'package:equatable/equatable.dart';

abstract class FormSubmissionState extends Equatable {
  const FormSubmissionState();
}

class InitialFormStatus extends FormSubmissionState {
  const InitialFormStatus();

  @override
  List<Object?> get props => [];
}

class FormSubmitting extends FormSubmissionState {
  @override
  List<Object?> get props => [];
}

class SubmissionSuccess extends FormSubmissionState {
  @override
  List<Object?> get props => [];
}

class SubmissionFailed extends FormSubmissionState {
  final Exception exception;
  final String error;

  const SubmissionFailed(this.exception, this.error);

  @override
  List<Object?> get props => [error];
}
