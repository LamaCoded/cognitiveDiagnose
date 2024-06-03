import 'package:flutter/material.dart';

class AssessmentSentence extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Text(
            'Read the sentences',
            style: Theme.of(context)
                .textTheme
                .labelLarge!
                .copyWith(fontWeight: FontWeight.w700),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 16),
          Text(
            'Proin ultrices fringilla et scelerisque sed duis massa nulla. Eget arcu urna ipsum in neque ornare. Integer placerat rhoncus arcu sit et ultricies. Pharetra amet faucibus tincidunt mattis in enim. Duis pharetra integer adipiscing quisque elementum lacus porta. Sit diam ullamcorper quisque porta tortor.',
            textAlign: TextAlign.center,
            style: Theme.of(context)
                .textTheme
                .bodySmall!
                .copyWith(color: Colors.grey[600], fontSize: 14),
          ),
          SizedBox(height: 16),
          Text(
            'Ut turpis consectetur massa libero. Habitant lobortis dictum pretium et tortor facilisi in enim porttitor. Purus porta ut ultricies ut aliquam ultricies lacus quam. Gravida elit bibendum tempus ornare quis odio leo dignissim. Et arcu et lacus quisque.',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.grey[600]),
          ),
          SizedBox(height: 16),
          Text(
            'Pellentesque pellentesque et amet vitae turpis hac in. Felis eu purus vel interdum accumsan lorem dictum.',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.grey[600]),
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
