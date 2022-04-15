import 'package:firebase_auth/firebase_auth.dart';

class ApiServices {
  Future<String> logIn({
    required String email,
    required String password,
  }) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      return 'true';
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        return 'No user found for that email.';
      } else if (e.code == 'wrong-password') {
        return 'Wrong password provided for that user';
      }
    }
    return 'false';
  }

  void signOut() async {
    await FirebaseAuth.instance.signOut();
  }
}
