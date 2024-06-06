import 'package:cloud_firestore/cloud_firestore.dart';

class FetchData {
  Future<List<Map<String, dynamic>>> getRecentAssessment() async {
    final snapshot =
        await FirebaseFirestore.instance.collection('RecentAssessment').get();
    return snapshot.docs
        .map((doc) => doc.data() as Map<String, dynamic>)
        .toList();
  }

  Future<List<Map<String, dynamic>>> getRecentHistory() async {
    final snapshot =
        await FirebaseFirestore.instance.collection('RecentHistory').get();
    return snapshot.docs
        .map((doc) => doc.data() as Map<String, dynamic>)
        .toList();
  }
}
