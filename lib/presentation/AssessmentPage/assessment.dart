import 'package:flutter/material.dart';

class AssessmentScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {},
        ),
        title: Text('Assessment'),
        actions: [
          IconButton(
            icon: Icon(Icons.more_vert),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(5, (index) {
                return Container(
                  margin: EdgeInsets.symmetric(horizontal: 4.0),
                  width: 40.0,
                  height: 4.0,
                  color: index == 0 ? Colors.black : Colors.grey[300],
                );
              }),
            ),
            SizedBox(height: 32.0),
            Text(
              'How many fingers do you see?',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 8.0),
            Text(
              'Please show the patient a certain amount of fingers and follow their reaction.',
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.grey,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 32.0),
            GestureDetector(
              onTap: () {},
              child: Container(
                padding: EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.orange),
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
              onTap: () {},
              child: Container(
                padding: EdgeInsets.all(16.0),
                decoration: BoxDecoration(
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
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              child: Text(
                'Continue',
                style: TextStyle(fontSize: 18.0),
              ),
            ),
            SizedBox(height: 16.0),
          ],
        ),
      ),
    );
  }
}
