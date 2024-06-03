import 'package:flutter/material.dart';
import 'package:measureap/presentation/AssessmentPage/assessment.dart';
import 'package:measureap/presentation/DashBoardPage/dashboard_page_screen.dart';
import 'package:measureap/presentation/HomePage/home_page_screen.dart';
import 'package:measureap/presentation/NewAssessment/new_assessment_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MeasureAp',
      theme: ThemeData(
        textTheme: TextTheme(
            labelLarge: TextStyle(
              fontFamily: 'Manrope',
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: Color(0x1A1C1E).withOpacity(1),
            ),
            labelMedium: TextStyle(
              fontFamily: 'Manrope',
              fontSize: 16,
              fontWeight: FontWeight.w700,
              color: Color(0x1A1C1E).withOpacity(1),
            ),
            bodySmall: TextStyle(
              fontFamily: 'Manrope',
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: Color(0x6C7278).withOpacity(1),
            )),
        colorScheme:
            ColorScheme.fromSeed(seedColor: Color(0x1A1C1E).withOpacity(1)),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => DashBoardScreen(),
        '/Home': (context) => HomeScreen(),
        '/newAssessment': (context) => NewAssessmentPage(),
        '/startAssessment': (context) => AssessmentScreen()
      },
    );
  }
}
