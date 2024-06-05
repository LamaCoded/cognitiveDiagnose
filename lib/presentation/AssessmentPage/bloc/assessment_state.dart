part of 'assessment_bloc.dart';

class AssessmentState extends Equatable {
  AssessmentState(
      {this.marks = 0,
      this.isLoading = false,
      this.answeredCorrectly = const []});
  int marks;
  bool isLoading;
  List<int> answeredCorrectly;
  @override
  List<Object?> get props => [marks, isLoading, answeredCorrectly];

  AssessmentState copyWith(
      {int? marks, bool? isLoading, List<int>? answeredCorrectly}) {
    return AssessmentState(
        marks: marks ?? this.marks,
        isLoading: isLoading ?? this.isLoading,
        answeredCorrectly: answeredCorrectly ?? this.answeredCorrectly);
  }
}
