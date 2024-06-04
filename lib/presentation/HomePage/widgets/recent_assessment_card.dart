import 'package:flutter/material.dart';
import 'package:measureap/data/connection.dart';
import 'package:measureap/presentation/HomePage/model/recent_assessment_model.dart';

Widget buildAssessmentCard(BuildContext context, RecentAssessmentModel model) {
  return GestureDetector(
    onTap: () => FetchData().getRecentAssessment(),
    child: Card(
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
                    text: '${model.code} . ',
                    style: Theme.of(context).textTheme.labelMedium!.copyWith(
                        fontWeight: FontWeight.bold, color: Colors.orange)),
                TextSpan(
                    text: model.title,
                    style: Theme.of(context).textTheme.labelMedium!.copyWith(
                        color: Colors.orange, fontWeight: FontWeight.normal))
              ]),
            ),
            Icon(Icons.arrow_forward, color: Colors.orange),
          ],
        ),
      ),
    ),
  );
}
