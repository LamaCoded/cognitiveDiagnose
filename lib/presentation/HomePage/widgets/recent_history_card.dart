import 'package:flutter/material.dart';
import 'package:measureap/data/connection.dart';

Widget buildHistoryCard(BuildContext context, String code, String title,
    String gender, String age, String weight, String date, String name) {
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
    ),
  );
}
