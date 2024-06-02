import 'package:flutter/material.dart';
import 'package:measureap/presentation/HomePage/widgets/recent_assessment_card.dart';
import 'package:measureap/presentation/HomePage/widgets/recent_history_card.dart';

class HomePageScreen extends StatelessWidget {
  const HomePageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              buildProfileBar(context),
              buildRecentHistory(context),
              buildRecentAssessment(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildRecentHistory(BuildContext context) {
    return Container(
      height: 440,
      width: MediaQuery.of(context).size.width,

      padding: EdgeInsets.symmetric(
          horizontal: 16.0, vertical: 6.0), // Optional: Add padding
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Recent History',
                style: Theme.of(context).textTheme.labelLarge,
              ),
              Text(
                'See more ->',
                style: Theme.of(context)
                    .textTheme
                    .bodySmall!
                    .copyWith(fontWeight: FontWeight.w700),
              ),
            ],
          ),
          ListView.separated(
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return RecentHistoryCard(context);
              },
              separatorBuilder: (context, index) => SizedBox(
                    height: 4.0,
                  ),
              itemCount: 3)
        ],
      ),
    );
  }

  Widget buildProfileBar(BuildContext context) {
    return Container(
      height: 100,
      padding: EdgeInsets.symmetric(horizontal: 10),
      width: MediaQuery.of(context).size.width,
      child: Row(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundImage:
                NetworkImage('https://prajwollama.com.np/prajwollama.jpg'),
          ),
          SizedBox(width: 10), // Add spacing between avatar and text
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment:
                  CrossAxisAlignment.start, // Align text to the start
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Welcome Back'),
                    Text('Monday'),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [Text('Welcome Back'), Text('Monday')],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildRecentAssessment(BuildContext context) {
    return Container(
      height: 218,
      width: MediaQuery.of(context).size.width,

      padding: EdgeInsets.symmetric(
          horizontal: 16.0, vertical: 6.0), // Optional: Add padding
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Recent History',
                style: Theme.of(context).textTheme.labelLarge,
              ),
              Text(
                'See more ->',
                style: Theme.of(context)
                    .textTheme
                    .bodySmall!
                    .copyWith(fontWeight: FontWeight.w700),
              ),
            ],
          ),
          ListView.separated(
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return RecentAssessmentCard(context);
              },
              separatorBuilder: (context, index) => SizedBox(
                    height: 4.0,
                  ),
              itemCount: 3)
        ],
      ),
    );
  }
}
