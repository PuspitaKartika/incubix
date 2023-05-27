import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class AuthController {
  FirebaseAuth auth = FirebaseAuth.instance;
  Stream<User?> get streamAuthStatus => auth.authStateChanges();
  void signup(){}
  void login(String email, String pass) async{
    try {
      await auth.signInWithEmailAndPassword(
          email: email,
          password: pass
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
  }

  void logout(){}

}