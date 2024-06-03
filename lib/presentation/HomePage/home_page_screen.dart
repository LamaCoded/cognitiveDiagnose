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
              _buildHeader(context),
              SizedBox(height: 16.0),
              _buildRecentHistory(context),
              SizedBox(height: 16.0),
              _buildRecentAssessments(context),
              SizedBox(height: 60.0),
            ],
          ),
        ),
        floatingActionButton: Container(
          margin: EdgeInsets.only(bottom: 10, top: 10, left: 20, right: 20),
          width: MediaQuery.of(context).size.width,
          child: FloatingActionButton(
            backgroundColor: Colors.black,
            onPressed: () => Navigator.pushNamed(context, '/newAssessment'),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.add,
                  color: Colors.white,
                ),
                Text(
                  'New Assessment',
                  style: TextStyle(color: Colors.white),
                  textAlign: TextAlign.center,
                )
              ],
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.0),
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              CircleAvatar(
                backgroundImage:
                    NetworkImage('https://prajwollama.com.np/prajwollama.jpg'),
                radius: 25,
              ),
              SizedBox(width: 12.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Welcome Back,',
                      style: Theme.of(context).textTheme.bodySmall),
                  Text('Dr. Johnson',
                      style: Theme.of(context)
                          .textTheme
                          .labelLarge!
                          .copyWith(fontSize: 16)),
                ],
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text('Monday', style: Theme.of(context).textTheme.bodySmall),
              Text('16 April, 2024',
                  style: Theme.of(context)
                      .textTheme
                      .labelLarge!
                      .copyWith(fontSize: 16)),
            ],
          ),
        ],
      ),
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
                style: Theme.of(context).textTheme.labelLarge!),
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
        _buildHistoryCard(context, 'Z00.0', 'Physical Examination', 'Male',
            '36 Years old', '84 kg', '02.03.2024', 'Davis Culgane'),
        _buildHistoryCard(context, 'Z01.89', 'Diagnostic Tests', 'Male',
            '41 Years old', '84 kg', '01.03.2024', 'Davis Culgane'),
        _buildHistoryCard(context, 'Z01.89', 'Diagnostic Tests', 'Male',
            '41 Years old', '84 kg', '01.03.2024', 'Davis Culgane'),
      ],
    );
  }

  Widget _buildHistoryCard(BuildContext context, String code, String title,
      String gender, String age, String weight, String date, String name) {
    return Card(
      color: Colors.white,
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
                    style: TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Manrope')),
              ],
            ),
            SizedBox(height: 8.0),
            Text(
              name,
              style: Theme.of(context)
                  .textTheme
                  .labelMedium!
                  .copyWith(fontWeight: FontWeight.w600),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('$gender - $age - $weight',
                    style: TextStyle(fontSize: 14.0, color: Colors.grey)),
                Text(date,
                    style: TextStyle(
                        fontSize: 14.0,
                        color: Colors.grey,
                        fontFamily: 'Manrope')),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRecentAssessments(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Recent assessments',
                style: Theme.of(context).textTheme.labelLarge!),
            TextButton(
              onPressed: () {},
              child: Text('See more',
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall!
                      .copyWith(fontWeight: FontWeight.w700)),
            )
          ],
        ),
        _buildAssessmentCard(context, 'COGNITION', 'SLUMS'),
        _buildAssessmentCard(context, 'Z00.0', 'Physical Examination'),
        _buildAssessmentCard(context, 'Z01.89', 'Diagnostic Tests'),
      ],
    );
  }

  Widget _buildAssessmentCard(BuildContext context, String code, String title) {
    return Card(
      color: Colors.white,
      margin: EdgeInsets.symmetric(vertical: 8.0),
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            RichText(
              text: TextSpan(children: [
                TextSpan(
                    text: '${code} . ',
                    style: Theme.of(context).textTheme.labelMedium!.copyWith(
                        fontWeight: FontWeight.bold, color: Colors.orange)),
                TextSpan(
                    text: title,
                    style: Theme.of(context).textTheme.labelMedium!.copyWith(
                        color: Colors.orange, fontWeight: FontWeight.normal))
              ]),
            ),
            Icon(Icons.arrow_forward, color: Colors.orange),
          ],
        ),
      ),
    );
  }
}
