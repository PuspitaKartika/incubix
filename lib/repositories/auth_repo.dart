import 'package:firebase_auth/firebase_auth.dart';

class AuthRepo {
  // final _fireStore = Firebase
  final _auth = FirebaseAuth.instance;

  Future<void> login({required String email, required String password}) async {
    try {
      final user = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      // await _saveToken(user.user!.uid);
    } on FirebaseException catch (e) {
      throw e.message ?? 'Something wrong!';
    } catch (e) {
      throw e;
    }
  }
}
