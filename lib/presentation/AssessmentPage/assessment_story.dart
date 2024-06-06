import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:measureap/presentation/AssessmentPage/Widgets/option_card_widget.dart';
import 'package:measureap/presentation/AssessmentPage/bloc/assessment_bloc.dart';

class AssessmentStory extends StatefulWidget {
  final VoidCallback onContinue;
  final VoidCallback onBack;

  AssessmentStory({super.key, required this.onContinue, required this.onBack});
  @override
  State<AssessmentStory> createState() => _AssessmentStoryState();
}

class _AssessmentStoryState extends State<AssessmentStory> {
  int maxLine = 2;
  String ShowText = "Show All";
  List<int> selectedAnswer = [];
  List<String> choices = [
    'Jill bought candies.',
    'Jill has a dog as a pet.',
    'Jill took a cab.'
  ];

  void _handleOptionTap(int index) {
    setState(() {
      if (selectedAnswer.contains(index)) {
        selectedAnswer.remove(index);
      } else {
        selectedAnswer.add(index);
      }
    });
  }

  void pressButton() {
    int score = 3;
    if (selectedAnswer.contains(0) &&
        selectedAnswer.contains(2) &&
        selectedAnswer.isNotEmpty) {
      score = 3;
      context.read<AssessmentBloc>().add(correctAnswerEvent(2, score));
      context.read<AssessmentBloc>().add(correctAnswerEvent(3, score));
    } else if (selectedAnswer.contains(0)) {
      context.read<AssessmentBloc>().add(correctAnswerEvent(2, score));
    } else if (selectedAnswer.contains(2)) {
      context.read<AssessmentBloc>().add(correctAnswerEvent(3, score));
    } else {
      score = 0;
    }

    widget.onContinue();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Story "Jill went to the shop"',
            style: Theme.of(context).textTheme.labelLarge!.copyWith(
                  fontWeight: FontWeight.w700,
                ),
          ),
          SizedBox(height: 8),
          Text(
            '"Jill went to the shop to buy candies. Afterwards instead of walking home, she took a cab. When she arrived home, she found her cat waiting at the door. She fed her cat and then sat down to enjoy her candies while watching her favorite TV show. Later, she called her friend to share the news about her day."',
            style: Theme.of(context).textTheme.bodyMedium,
            softWrap: true,
            maxLines: maxLine,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 8),
          TextButton(
            onPressed: () {
              setState(() {
                if (ShowText == "Show All") {
                  maxLine = 8;
                  ShowText = 'Show Less';
                } else {
                  ShowText = "Show All";
                  maxLine = 2;
                }
              });
            },
            child: Text(ShowText),
          ),
          SizedBox(height: 16),
          for (int i = 0; i < choices.length; i++)
            OptionCard(
              text: choices[i],
              isSelected: false,
              index: i,
              onClicked: _handleOptionTap,
            ),
          Spacer(),
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
                  child: Text('Continue'),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
