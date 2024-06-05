import 'package:flutter/material.dart';
import 'package:measureap/presentation/AssessmentPage/Widgets/animal_switch_listtile.dart';

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

  void pressButton() {
    print('...........................');
    print(correctAnswer);
    print('...........................');

    int score = 0;
    int correctCount = correctAnswer.where((answer) => answer).length;
    switch (correctCount) {
      case 3:
        score = 9;
        break;
      case 2:
        score = 6;
        break;
      case 1:
        score = 3;
        break;
      default:
        score = 0;
    }
    print('Score: $score');

    // You might use a state management solution here to communicate score
    // to other parts of your app if needed
  }

  void updateAnswer(int index, bool value) {
    setState(() {
      correctAnswer[index] = value;
    });
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
            onChanged: (value) => updateAnswer(0, value),
          ),
          AnimalSwitchListTile(
            imageUrl: 'https://prajwollama.com.np/prajwollama.jpg',
            title: 'Horse',
            onChanged: (value) => updateAnswer(1, value),
          ),
          AnimalSwitchListTile(
            imageUrl: 'https://prajwollama.com.np/prajwollama.jpg',
            title: 'Dog',
            onChanged: (value) => updateAnswer(2, value),
          ),
          Spacer(),
          Text(
            '${correctAnswer.where((answer) => answer).length} correct', // Display number of selected animals
            style: TextStyle(
              color: Colors.orange,
              fontWeight: FontWeight.bold,
            ),
          ),
          Row(
            children: [
              IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: widget.onBack,
              ),
              Expanded(
                child: ElevatedButton(
                  onPressed: pressButton,
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
