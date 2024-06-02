import 'package:flutter/material.dart';

Widget RecentAssessmentCard(BuildContext context) {
  return SizedBox(
    width: MediaQuery.of(context).size.width,
    height: 56,
    child: Card(
      elevation: 2,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              decoration: BoxDecoration(
                color: Color(0x4D6FE7).withOpacity(0.12),
                borderRadius: BorderRadius.circular(30),
              ),
              padding: EdgeInsets.symmetric(horizontal: 0, vertical: 8),
              child: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                        text: 'Z00.00  ',
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            fontWeight: FontWeight.bold,
                            color: Color(0xE7974D1F).withOpacity(0.12))),
                    TextSpan(
                      text: 'Physical Examinations',
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall!
                          .copyWith(color: Color(0xE7974D1F).withOpacity(0.12)),
                    ),
                  ],
                ),
              ),
            ),
            Icon(Icons.next_plan_rounded),
          ],
        ),
      ),
    ),
  );
}
