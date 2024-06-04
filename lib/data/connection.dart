import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';

class FetchData {
  final Stream<QuerySnapshot> recentAssessments =
      FirebaseFirestore.instance.collection('RecentAssessment').snapshots();
  final Stream<QuerySnapshot> recentHistory =
      FirebaseFirestore.instance.collection('RecentHistory').snapshots();

  Stream<List<Map<String, dynamic>>> getRecentAssessment() {
    return recentAssessments.map((snapshot) {
      return snapshot.docs
          .map((doc) => doc.data() as Map<String, dynamic>)
          .toList();
    });
  }

  Stream<List<Map<String, dynamic>>> getRecentHistory() {
    return recentHistory.map((snapshot) {
      return snapshot.docs
          .map((doc) => doc.data() as Map<String, dynamic>)
          .toList();
    });
  }
}
