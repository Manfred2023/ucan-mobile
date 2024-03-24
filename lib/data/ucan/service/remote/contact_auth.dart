import 'package:firebase_auth/firebase_auth.dart';

class ContactAuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<User?> singupWithEmail(String email, String password) async {
    try {
      UserCredential credential = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      return credential.user;
    } catch (e) {
      print(e.toString());
    }
    return null;
  }

  Future<User?> singinWithEmail(String email, String password) async {
    try {
      UserCredential credential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      return credential.user;
    } catch (e) {
      print(e.toString());
    }
    return null;
  }
 
    
}
