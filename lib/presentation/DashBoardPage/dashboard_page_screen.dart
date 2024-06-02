import 'package:flutter/material.dart';
import 'package:measureap/presentation/AssessmentPage/assessment.dart';
import 'package:measureap/presentation/HomePage/home_page_screen.dart';
import 'package:measureap/presentation/HomePage/newHome.dart';
import 'package:measureap/presentation/NewAssessment/new_assessment_screen.dart';

class DashBoardScreen extends StatefulWidget {
  DashBoardScreen({super.key});
  List screens = [
    HomePageScreen(),
    NewAssessmentPage(),
    HomeScreen(),
    AssessmentScreen()
  ];
  int index = 0;
  @override
  State<DashBoardScreen> createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.screens[widget.index],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Color(0xFF5003).withOpacity(1),
        selectedIconTheme: IconThemeData(color: Color(0xFF5003).withOpacity(1)),
        unselectedIconTheme:
            IconThemeData(color: Color(0x6C7278).withOpacity(1)),
        selectedLabelStyle: TextStyle(fontSize: 12),
        currentIndex: widget.index,
        onTap: (value) {
          print(value);
          setState(() {
            widget.index = value;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.person_2), label: 'Patient'),
          BottomNavigationBarItem(icon: Icon(Icons.note), label: 'History'),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings), label: 'Settings'),
        ],
      ),
    );
  }
}
