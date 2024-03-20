import 'package:firebase_auth/firebase_auth.dart'; 

class ContactAuthService{

  FirebaseAuth _auth = FirebaseAuth.instance;

  Future<User?> SingupWithEmail(String email, String password) async{
    try{
      UserCredential credential = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      return credential.user;
      
    } catch (e){
      print(e.toString());
    }
    return null;
  }

   Future<User?> SinginWithEmail(String email, String password) async{
    try{
      UserCredential credential = await _auth.signInWithEmailAndPassword(email: email, password: password);
      return credential.user;
      
    } catch (e){
      print(e.toString());
    }
    return null;
  }

}