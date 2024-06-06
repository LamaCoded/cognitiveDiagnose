import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:measureap/presentation/AssessmentPage/bloc/assessment_bloc.dart';

class AssessmentResults extends StatelessWidget {
  AssessmentResults({required this.onBack});
  final VoidCallback onBack;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          'Confirm the results',
          style: Theme.of(context).textTheme.labelLarge!.copyWith(
                fontWeight: FontWeight.w700,
              ),
        ),
        SizedBox(height: 20),
        Expanded(
          child: BlocBuilder<AssessmentBloc, AssessmentState>(
            builder: (context, state) {
              if (state.isLoading) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }

              return SingleChildScrollView(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    border: Border.all(color: Colors.black.withOpacity(.08)),
                  ),
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          SizedBox(
                            height: 100,
                            width: 100,
                            child: CircularProgressIndicator(
                              value: 0.6,
                              strokeWidth: 10,
                              backgroundColor: Colors.grey[200],
                              valueColor:
                                  AlwaysStoppedAnimation<Color>(Colors.teal),
                            ),
                          ),
                          Positioned(
                            child: Text(
                              '${state.marks}/20',
                              style: TextStyle(
                                  fontSize: 24, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      Divider(
                        color: Colors.black.withOpacity(.08),
                      ),
                      ListTile(
                        title: Text('Question 1'),
                        trailing: state.answeredCorrectly.contains(1)
                            ? Text('Correct',
                                style: TextStyle(color: Colors.green))
                            : Text(
                                'Incorrect',
                                style: TextStyle(color: Colors.red),
                              ),
                      ),
                      ListTile(
                        title: Text('Question 2'),
                        trailing: Text(
                          state.answeredCorrectly.contains(2) ||
                                  state.answeredCorrectly.contains(3)
                              ? 'Correct'
                              : 'Incorrect',
                          style: TextStyle(color: Colors.green),
                        ),
                      ),
                      ListTile(
                        title: Text('Question 3'),
                        trailing: Text(
                          'Incorrect',
                          style: TextStyle(color: Colors.red),
                        ),
                      ),
                      ListTile(
                        title: Text('Question 4'),
                        trailing: state.answeredCorrectly.contains(4) ||
                                state.answeredCorrectly.contains(5) ||
                                state.answeredCorrectly.contains(6)
                            ? Text('Correct',
                                style: TextStyle(color: Colors.green))
                            : Text(
                                'Incorrect',
                                style: TextStyle(color: Colors.red),
                              ),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          'Show all',
                          style: TextStyle(color: Colors.orange),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ElevatedButton(
              onPressed: onBack,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: Colors.black,
              ),
              child: Text('Back'),
            ),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                foregroundColor: Colors.white,
              ),
              child: Text('Print'),
            ),
          ],
        ),
      ],
    );
  }
}
