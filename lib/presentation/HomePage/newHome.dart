import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeader(),
              SizedBox(height: 16.0),
              _buildRecentHistory(context),
              SizedBox(height: 16.0),
              _buildRecentAssessments(),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: Row(
            children: [Icon(Icons.add), Text('New Assessment')],
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage('https://placehold.co/50x50'),
              radius: 25,
            ),
            SizedBox(width: 12.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Welcome Back,', style: TextStyle(fontSize: 16.0)),
                Text('Dr. Johnson',
                    style:
                        TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold)),
              ],
            ),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text('Monday', style: TextStyle(fontSize: 16.0)),
            Text('16 April, 2024', style: TextStyle(fontSize: 16.0)),
          ],
        ),
      ],
    );
  }

  Widget _buildRecentHistory(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Recent history',
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)),
            TextButton(
                onPressed: () {},
                child: Text(
                  'See more',
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall!
                      .copyWith(fontWeight: FontWeight.w700),
                )),
          ],
        ),
        _buildHistoryCard('Z00.0', 'Physical Examination', 'Male',
            '36 Years old', '84 kg', '02.03.2024'),
        _buildHistoryCard('Z01.89', 'Diagnostic Tests', 'Male', '41 Years old',
            '84 kg', '01.03.2024'),
        _buildHistoryCard('Z01.89', 'Diagnostic Tests', 'Male', '41 Years old',
            '84 kg', '01.03.2024'),
      ],
    );
  }

  Widget _buildHistoryCard(String code, String title, String gender, String age,
      String weight, String date) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8.0),
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('$code - $title',
                    style:
                        TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold)),
                Text(date,
                    style: TextStyle(fontSize: 14.0, color: Colors.grey)),
              ],
            ),
            SizedBox(height: 8.0),
            Text('$gender - $age - $weight',
                style: TextStyle(fontSize: 14.0, color: Colors.grey)),
          ],
        ),
      ),
    );
  }

  Widget _buildRecentAssessments() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Recent assessments',
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)),
            TextButton(onPressed: () {}, child: Text('See more')),
          ],
        ),
        _buildAssessmentCard('COGNITION', 'SLUMS', Colors.orange),
        _buildAssessmentCard('Z00.0', 'Physical Examination', Colors.red),
        _buildAssessmentCard('Z01.89', 'Diagnostic Tests', Colors.red),
      ],
    );
  }

  Widget _buildAssessmentCard(String code, String title, Color color) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8.0),
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('$code - $title',
                style: TextStyle(
                    fontSize: 16.0, fontWeight: FontWeight.bold, color: color)),
            Icon(Icons.arrow_forward, color: color),
          ],
        ),
      ),
    );
  }
}
