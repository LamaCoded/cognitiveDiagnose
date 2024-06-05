import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:measureap/presentation/HomePage/bloc/home_bloc.dart';

class NewAssessmentPage extends StatefulWidget {
  final Map<String, dynamic>? arguments;

  NewAssessmentPage({this.arguments});

  @override
  State<NewAssessmentPage> createState() => _NewAssessmentPageState();
}

class _NewAssessmentPageState extends State<NewAssessmentPage> {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  String? cognitionStatus;
  String? applicableMeasure;
  void initState() {
    super.initState();
    cognitionStatus = widget.arguments != null
        ? widget.arguments!['congitionStatus'] as String?
        : 'Select Cognitive Test';
    applicableMeasure = widget.arguments != null
        ? widget.arguments!['applicableMeasure'] as String?
        : 'Select Applicable Measures';
  }

  List<String> cognitiveStatus = [
    'Select Cognitive Test',
    'Cognition',
    'Z00.0',
    'Z01.89',
    'Z00.89'
  ];

  List<String> applicableMeasures = [
    'Select Applicable Measures',
    'SLUMS',
    'Physical Examination',
    'Diagnostic Tests'
  ];

  final PatientName = 'John Smith';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Text(
            'New assessment',
            style: Theme.of(context)
                .textTheme
                .labelMedium!
                .copyWith(fontWeight: FontWeight.w800),
          ),
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.transparent,
          foregroundColor: Colors.black,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Cognitive status'),
              SizedBox(height: 8),
              DropdownButtonFormField<String>(
                onChanged: (value) {
                  print(value);
                  setState(() {
                    cognitionStatus = value;
                  });
                },
                value: cognitionStatus,
                items: cognitiveStatus.map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16),
              Text('Applicable measures'),
              SizedBox(height: 8),
              DropdownButtonFormField<String>(
                value: applicableMeasure,
                items: applicableMeasures.map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (newValue) {
                  setState(() {
                    applicableMeasure = newValue;
                  });
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16),
              Text('Patient'),
              SizedBox(height: 8),
              TextFormField(
                initialValue: PatientName,
                decoration: InputDecoration(
                  hintText: 'Enter patient name or ID',
                  border: OutlineInputBorder(),
                ),
              ),
              Spacer(),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () async {
                    Map<String, dynamic> formData = {
                      'congitionStatus': cognitionStatus,
                      'applicableMeasure': applicableMeasure,
                      'patientName': PatientName
                    };
                    final docRef = firestore.collection('newAssessment').doc();
                    await docRef.set(formData);

                    Navigator.pushNamed(context, '/startAssessment');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    foregroundColor: Colors.white,
                    padding: EdgeInsets.symmetric(vertical: 16),
                  ),
                  child: Text('Start assessment'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
