import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_application_5/services/auth_service.dart';

class FirebaseDbService {
  var db = FirebaseFirestore.instance;

  postFeedback(message) async {
    try {
      var feedback = await db.collection('Feedbacks').add({
        'user': await FirebaseAuthService().checkUser(),
        'photo': 'photo',
        'message': message,
        'created_at': DateTime.now()
      });
      return feedback;
    } catch (e) {
      throw e;
    }
  }
}
