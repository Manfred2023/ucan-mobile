import 'package:firebase_auth/firebase_auth.dart';

class AuthenticateRemote {
  AuthenticateRemote();
  static final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  //
  static User? get currentUser => _firebaseAuth.currentUser;
  static Stream<User?> get authStateChanges => _firebaseAuth.authStateChanges();
  static String verifyId = '';

  Future<User> signup({
    required String userName,
    required String email,
    required String password,
  }) async {
    try {
      UserCredential userCredential =
          await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (userCredential.user != null) {
        await currentUser!.updateDisplayName(userName);
      }
      return currentUser!;
    } on FirebaseAuthException catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<User> phoneAuthentication({
    required String phone,
    // required Function next,
  }) async {
    try {
      await _firebaseAuth.verifyPhoneNumber(
        phoneNumber: phone,
        timeout: const Duration(seconds: 60),
        verificationCompleted: (PhoneAuthCredential credential) async {
          await currentUser!.updatePhoneNumber(credential);
        },
        verificationFailed: (FirebaseAuthException e) {
          throw Exception(e.toString());
        },
        codeSent: (String verificationId, int? resendToken) async {
          verifyId = verificationId;
        },
        codeAutoRetrievalTimeout: (String verificationId) async {
          // Handle auto-retrieval timeout
          verificationId = verificationId;
        },
      );
      return currentUser!;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<void> signin(
      {required String emailAddress, required String password}) async {
    try {
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: emailAddress, password: password);
      print(credential);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
  }

  Future<void> signout() async {
    await FirebaseAuth.instance.signOut();
  }
}
