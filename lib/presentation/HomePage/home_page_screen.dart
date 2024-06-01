import 'package:flutter/material.dart';
import 'package:measureap/presentation/HomePage/widgets/recent_history_card.dart';

class HomePageScreen extends StatelessWidget {
  const HomePageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Container(
            child: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RecentHistoryCard(context),
          RecentHistoryCard(context),
          RecentHistoryCard(context),
        ],
      ),
    )));
  }
}
