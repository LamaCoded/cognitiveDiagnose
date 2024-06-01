import 'package:flutter/material.dart';

Widget RecentHistoryCard(BuildContext context) {
  return Container(
    padding: EdgeInsets.all(12),
    margin: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
    width: MediaQuery.of(context).size.width,
    child: Card(
      elevation: 2,
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                decoration: BoxDecoration(
                    color: Color(0x4D6FE7).withOpacity(0.12),
                    borderRadius: BorderRadius.circular(30)),
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                child: RichText(
                  text: TextSpan(children: [
                    TextSpan(
                        text: 'Z00.00  ',
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall!
                            .copyWith(fontWeight: FontWeight.bold)),
                    TextSpan(
                        text: 'Physical Examinations',
                        style: Theme.of(context).textTheme.bodySmall)
                  ]),
                ),
              ),
              Icon(Icons.next_plan_rounded)
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Text('Davis Culhane', style: Theme.of(context).textTheme.bodyMedium),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                'Male',
                style: Theme.of(context).textTheme.bodySmall,
              ),
              Text(
                '41 7ear 84 kg',
                style: Theme.of(context).textTheme.bodySmall,
              ),
              Text(
                '01.03.2920',
                style: Theme.of(context).textTheme.bodySmall,
              )
            ],
          )
        ],
      ),
    ),
  );
}
