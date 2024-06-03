import 'package:flutter/material.dart';
import 'package:measureap/presentation/AssessmentPage/Widgets/option_card_widget.dart';

class AssessmentStory extends StatefulWidget {
  @override
  State<AssessmentStory> createState() => _AssessmentStoryState();
}

class _AssessmentStoryState extends State<AssessmentStory> {
  int maxLine = 2;
  String ShowText = "Show All";

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
          OptionCard(
            text: 'Jill bought candies.',
            isSelected: true,
          ),
          OptionCard(
            text: 'Jill has a dog as a pet.',
            isSelected: false,
          ),
          OptionCard(
            text: 'Jill took a cab.',
            isSelected: true,
          ),
          Spacer(),
          Row(
            children: [
              IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () {},
              ),
              Expanded(
                child: ElevatedButton(
                  onPressed: () {},
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
