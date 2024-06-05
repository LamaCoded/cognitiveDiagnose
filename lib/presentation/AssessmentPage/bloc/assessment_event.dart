part of 'assessment_bloc.dart';

class AssessmentEvent extends Equatable {
  const AssessmentEvent();

  @override
  List<Object> get props => [];
}

class AssessmentInitialEvent extends AssessmentEvent {}

class correctAnswerEvent extends AssessmentEvent {
  correctAnswerEvent(this.payload, this.marksReceived);

  int payload;
  int marksReceived;
}
