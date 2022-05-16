import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirestoreController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance; // to access the user id

  void addMeetingToFirestore(String meetingName) {
    // to add a sub collection for user
    try {
      // access user collection
      // in case the user create a meeting
      // if the user did not create a meeting will not be access to this collection
      _firestore
          .collection('users')
          .doc(_auth.currentUser!.uid)
          .collection('meeting')
          .add({
        'meetingName': meetingName,
        'createAt': DateTime.now(),
      });
    } catch (e) {
      print(e);
    }
  }
}
