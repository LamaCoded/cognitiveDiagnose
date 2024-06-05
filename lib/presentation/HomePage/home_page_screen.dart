import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:measureap/presentation/HomePage/bloc/home_bloc.dart';

import 'package:measureap/presentation/HomePage/widgets/recent_assessment_card.dart';
import 'package:measureap/presentation/HomePage/widgets/recent_history_card.dart';

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
              const CircleAvatar(
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
        BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            if (state.isHistoryLoading == true) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            return Container(
              height: 390,
              child: ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  itemCount: state.recentHistoryModelList.length,
                  itemBuilder: (context, item) {
                    return buildHistoryCard(
                        context, state.recentHistoryModelList[item]);
                  }),
            );
          },
        ),
      ],
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
        BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            if (state.isAssesmentLoading == true) {
              return Center(child: CircularProgressIndicator());
            }
            return Container(
              height: 220,
              child: ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  itemCount: state.recentAssessmentModelList.length,
                  itemBuilder: (context, item) {
                    return buildAssessmentCard(
                        context, state.recentAssessmentModelList[item]);
                  }),
            );
          },
        ),
      ],
    );
  }
}
