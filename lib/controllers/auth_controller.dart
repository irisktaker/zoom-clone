import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AuthController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  // save the user in our firebase database
  final _firebaseStore = FirebaseFirestore.instance;
  //. we need this to keep the user sign_in if user is signed in after checking the the user state
  //. to look for if the user authenticated or not
  Stream<User?> get authChanges => _auth.authStateChanges();
  User get user => _auth.currentUser!; // this user have all values of our users

  //.
  signInWithGoogle() async {
    try {
      GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      //. to make sure the user is currently sign_in
      GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

      //. access to legal user data, and save it in authentication/users
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      //. upload the data to the authentication/users
      UserCredential userCredential =
          await _auth.signInWithCredential(credential);

      User? user = userCredential.user;
      if (user != null) {
        // to not repeat the same user data
        if (userCredential.additionalUserInfo!.isNewUser) {
          // if new user we need to save the user in our firebase database
          _firebaseStore.collection('users').doc(user.uid).set({
            'username': user.displayName,
            'uid': user.uid,
            'user_image': user.photoURL,
          });
        }
      }
      //..
    } catch (e) {
      //..
      print("err: $e");
    }
  }
}
