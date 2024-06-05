import 'package:flutter/material.dart';
import 'package:measureap/data/connection.dart';
import 'package:measureap/presentation/HomePage/model/recent_history_model.dart';

Widget buildHistoryCard(BuildContext context, RecentHistoryModel model) {
  return GestureDetector(
    onTap: () => FetchData().getRecentHistory(),
    child: Card(
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
                Text('${model.code} - ${model.title}',
                    style: TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Manrope')),
              ],
            ),
            SizedBox(height: 8.0),
            Text(
              model.name,
              style: Theme.of(context)
                  .textTheme
                  .labelMedium!
                  .copyWith(fontWeight: FontWeight.w600),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('${model.gender} - ${model.age} - ${model.weight}',
                    style: TextStyle(fontSize: 14.0, color: Colors.grey)),
                Text(model.date,
                    style: TextStyle(
                        fontSize: 14.0,
                        color: Colors.grey,
                        fontFamily: 'Manrope')),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}
