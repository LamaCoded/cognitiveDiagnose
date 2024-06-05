import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:measureap/presentation/AssessmentPage/assessment.dart';
import 'package:measureap/presentation/AssessmentPage/bloc/assessment_bloc.dart';
import 'package:measureap/presentation/DashBoardPage/dashboard_page_screen.dart';
import 'package:measureap/presentation/HomePage/bloc/home_bloc.dart';
import 'package:measureap/presentation/HomePage/home_page_screen.dart';
import 'package:measureap/presentation/NewAssessment/new_assessment_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Platform.isAndroid
      ? await Firebase.initializeApp(
          options: FirebaseOptions(
              apiKey: "AIzaSyAB0mkYxFDDExNVOPP-Pm2f2R4bFAS-SUA",
              appId: "1:921705614729:android:1d3535490c92c33ff7a558",
              messagingSenderId: "921705614729",
              projectId: "measureap-abbe6"))
      : await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => HomeBloc(HomeState())..add(HomeInitialEvent()),
          ),
          BlocProvider(
            create: (context) => AssessmentBloc(AssessmentState())
              ..add(AssessmentInitialEvent()),
          ),
        ],
        child: MaterialApp(
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
            '/newAssessment': (context) => NewAssessmentPage(
                arguments: ModalRoute.of(context)?.settings.arguments
                    as Map<String, dynamic>?),
            '/startAssessment': (context) => AssessmentScreen()
          },
        ));
  }
}
