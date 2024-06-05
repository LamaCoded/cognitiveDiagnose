import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:measureap/presentation/AssessmentPage/bloc/assessment_bloc.dart';

class AssessmentMain extends StatefulWidget {
  final VoidCallback onContinue;
  AssessmentMain({super.key, required this.onContinue});

  @override
  State<AssessmentMain> createState() => _AssessmentMainState();
}

class _AssessmentMainState extends State<AssessmentMain> {
  bool isCorrectSelected = false;
  bool isIncorrectSelected = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text(
            'How many fingers do you see?',
            style: Theme.of(context).textTheme.labelLarge!.copyWith(
                  fontWeight: FontWeight.w700,
                ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 8.0),
          Text(
            'Please show the patient a certain amount of fingers and follow their reaction.',
            style: Theme.of(context).textTheme.bodyMedium,
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 32.0),
          GestureDetector(
            onTap: () {
              setState(() {
                isCorrectSelected = true;
                context.read<AssessmentBloc>().add(correctAnswerEvent(1, 3));
              });
            },
            child: Container(
              padding: EdgeInsets.all(16.0),
              decoration: isCorrectSelected
                  ? BoxDecoration(
                      border: Border.all(color: Colors.orange),
                      borderRadius: BorderRadius.circular(8.0),
                    )
                  : BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(8.0),
                    ),
              child: Center(
                child: Text(
                  'Correct',
                  style: TextStyle(fontSize: 18.0),
                ),
              ),
            ),
          ),
          SizedBox(height: 16.0),
          GestureDetector(
            onTap: () {
              setState(() {
                isIncorrectSelected = true;
              });
            },
            child: Container(
              padding: EdgeInsets.all(16.0),
              decoration: isIncorrectSelected
                  ? BoxDecoration(
                      border: Border.all(color: Colors.orange),
                      borderRadius: BorderRadius.circular(8.0),
                    )
                  : BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(8.0),
                    ),
              child: Center(
                child: Text(
                  'Incorrect',
                  style: TextStyle(fontSize: 18.0),
                ),
              ),
            ),
          ),
          Spacer(),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: ElevatedButton(
              onPressed: widget.onContinue,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                foregroundColor: Colors.white,
                padding: EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24.0),
                ),
              ),
              child: Text(
                'Continue',
                style: TextStyle(fontSize: 18.0),
              ),
            ),
          ),
          SizedBox(height: 16.0),
        ],
      ),
    );
  }
}
