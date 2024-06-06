import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

part 'assessment_event.dart';
part 'assessment_state.dart';

class AssessmentBloc extends Bloc<AssessmentEvent, AssessmentState> {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  AssessmentBloc(AssessmentState initialState) : super(initialState) {
    on<AssessmentInitialEvent>(_onInitialize);
    on<correctAnswerEvent>(_addMarks);
    on<saveDataEvent>(_saveData);
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

  Future<bool> _saveData(
      saveDataEvent event, Emitter<AssessmentState> emit) async {
    try {
      QuerySnapshot querySnapshot = await firestore
          .collection('newAssessment')
          .where('patientName', isEqualTo: 'John Smith')
          .get();

      if (querySnapshot.docs.isNotEmpty) {
        DocumentSnapshot documentSnapshot = querySnapshot.docs.first;
        String documentId = documentSnapshot.id;

        DocumentReference documentReference =
            firestore.collection('newAssessment').doc(documentId);
        print(state.answeredCorrectly);

        await documentReference
            .update({'correctAnswer': state.answeredCorrectly});
        return true;
      } else {
        print('No document found with the specified patientName');
        return false;
      }
    } catch (e) {
      print('Error saving data: $e');
      return false;
    }
  }
}
