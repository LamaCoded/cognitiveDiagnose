import 'package:flutter/material.dart';
import 'package:measureap/presentation/AssessmentPage/assessment_identify_animal.dart';
import 'package:measureap/presentation/AssessmentPage/assessment_main.dart';
import 'package:measureap/presentation/AssessmentPage/assessment_result.dart';
import 'package:measureap/presentation/AssessmentPage/assessment_sentence.dart';
import 'package:measureap/presentation/AssessmentPage/assessment_story.dart';

class AssessmentScreen extends StatefulWidget {
  @override
  State<AssessmentScreen> createState() => _AssessmentScreenState();
}

class _AssessmentScreenState extends State<AssessmentScreen> {
  int pageValue = 0;
  final PageController _pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Assessment',
          style: Theme.of(context)
              .textTheme
              .labelMedium!
              .copyWith(fontWeight: FontWeight.w800),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.more_vert),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(5, (index) {
                  return Container(
                    margin: EdgeInsets.symmetric(horizontal: 4.0),
                    width: 40.0,
                    height: 4.0,
                    color: index == pageValue ? Colors.black : Colors.grey[300],
                  );
                }),
              ),
              SizedBox(height: 32.0),
              Expanded(
                child: PageView(
                  controller: _pageController,
                  pageSnapping: true,
                  onPageChanged: (index) {
                    setState(() {
                      pageValue = index;
                    });
                  },
                  children: [
                    AssessmentMain(),
                    AssessmentStory(),
                    AssessmentSentence(),
                    AssessmentIdentifyAnimal(),
                    AssessmentResults()
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
