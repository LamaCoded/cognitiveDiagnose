import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:measureap/presentation/AssessmentPage/Widgets/animal_switch_listtile.dart';
import 'package:measureap/presentation/AssessmentPage/bloc/assessment_bloc.dart';

class AssessmentIdentifyAnimal extends StatefulWidget {
  final VoidCallback onContinue;
  final VoidCallback onBack;

  AssessmentIdentifyAnimal(
      {super.key, required this.onContinue, required this.onBack});

  @override
  State<AssessmentIdentifyAnimal> createState() =>
      _AssessmentIdentifyAnimalState();
}

class _AssessmentIdentifyAnimalState extends State<AssessmentIdentifyAnimal> {
  List<bool> correctAnswer = [false, false, false];

  void handleSwitchChange(int index, bool value) {
    setState(() {
      correctAnswer[index] = value;
    });

    context.read<AssessmentBloc>().add(correctAnswerEvent(index + 4, 3));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text(
            'Identify the animals',
            style: Theme.of(context).textTheme.labelLarge!.copyWith(
                  fontWeight: FontWeight.w700,
                ),
          ),
          SizedBox(height: 8),
          Text(
              'Please show the patient the following animals and check their response.',
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(color: Colors.grey)),
          SizedBox(height: 24),
          AnimalSwitchListTile(
            imageUrl: 'https://prajwollama.com.np/prajwollama.jpg',
            title: 'Chicken',
            isSwitched: correctAnswer[0],
            onChanged: (value) => handleSwitchChange(0, value),
          ),
          AnimalSwitchListTile(
            imageUrl: 'https://prajwollama.com.np/prajwollama.jpg',
            title: 'Horse',
            isSwitched: correctAnswer[1],
            onChanged: (value) => handleSwitchChange(1, value),
          ),
          AnimalSwitchListTile(
            imageUrl: 'https://prajwollama.com.np/prajwollama.jpg',
            title: 'Dog',
            isSwitched: correctAnswer[2],
            onChanged: (value) => handleSwitchChange(2, value),
          ),
          Spacer(),
          Text(
            '${correctAnswer.where((answer) => answer).length} correct',
            style: TextStyle(
              color: Colors.orange,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: widget.onBack,
              ),
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    context.read<AssessmentBloc>().add(saveDataEvent());
                    widget.onContinue();
                  },
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24),
                    ),
                    backgroundColor: Colors.black,
                    foregroundColor: Colors.white,
                  ),
                  child: Text('Finish'),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
