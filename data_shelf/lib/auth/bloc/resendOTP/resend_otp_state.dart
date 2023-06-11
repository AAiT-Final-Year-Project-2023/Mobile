import 'package:data_shelf/auth/form_submission_state.dart';
import 'package:equatable/equatable.dart';

class ResendOTPState extends Equatable {
  final FormSubmissionState formState;

  ResendOTPState({this.formState = const InitialFormStatus()});

  ResendOTPState copyWith({
    FormSubmissionState? formState,
  }) {
    return ResendOTPState(formState: formState ?? this.formState);
  }

  @override
  List<Object?> get props => [this.formState];
}
