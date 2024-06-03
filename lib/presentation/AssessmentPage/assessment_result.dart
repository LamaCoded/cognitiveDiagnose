import 'package:flutter/material.dart';

class AssessmentResults extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          'Confirm the results',
          style: Theme.of(context).textTheme.labelLarge!.copyWith(
                fontWeight: FontWeight.w700,
              ),
        ),
        SizedBox(height: 20),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            border: Border.all(color: Colors.black.withOpacity(.08)),
          ),
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: [
              CircularProgressIndicator(
                value: 0.6,
                strokeWidth: 10,
                backgroundColor: Colors.grey[200],
                valueColor: AlwaysStoppedAnimation<Color>(Colors.teal),
              ),
              SizedBox(height: 20),
              Text(
                '12/20',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              Divider(
                color: Colors.black.withOpacity(.08),
              ),
              ListTile(
                title: Text('Question 1'),
                trailing: Text(
                  'Correct',
                  style: TextStyle(color: Colors.green),
                ),
              ),
              ListTile(
                title: Text('Question 2'),
                trailing: Text(
                  'Correct',
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
                trailing: Text(
                  'Correct',
                  style: TextStyle(color: Colors.green),
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
        Spacer(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ElevatedButton(
              onPressed: () {},
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
    ));
  }
}
