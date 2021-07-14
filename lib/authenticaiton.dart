import 'package:firebase_auth/firebase_auth.dart';

class Authentication {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Stream<User> get user {
    return _firebaseAuth.authStateChanges();
  }

  Future signIn({String email, String password}) async {
    try {
      UserCredential result = await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      User user = result.user;
      return user;
    } on FirebaseAuthException catch (e) {
      print(e.message);
      return null;
    } catch (e) {
      print(e.message);
    }
  }

  Future<String> register({String email, String password}) async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      return "Registered";
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  //signout
  Future signOut() async {
    try {
      return await _firebaseAuth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
