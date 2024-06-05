import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'assessment_event.dart';
part 'assessment_state.dart';

class AssessmentBloc extends Bloc<AssessmentEvent, AssessmentState> {
  AssessmentBloc(AssessmentState initialState) : super(initialState) {
    on<AssessmentInitialEvent>(_onInitialize);
    on<correctAnswerEvent>(_addMarks);
  }
  void _onInitialize(
      AssessmentInitialEvent event, Emitter<AssessmentState> emit) {
    print('marks is ${state.marks}');
  }

  void _addMarks(correctAnswerEvent event, Emitter<AssessmentState> emit) {
    emit(state.copyWith(
        marks: state.marks + event.marksReceived,
        answeredCorrectly: [...state.answeredCorrectly, event.payload]));
    print(state.marks);
  }
}
