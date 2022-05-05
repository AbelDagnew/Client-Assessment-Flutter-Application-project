import 'package:firebase_auth/firebase_auth.dart';
import 'package:untitled4/Household.dart';
class AuthService{
  final FirebaseAuth _auth;
  AuthService(this._auth);
  Stream<User> get authStateChange => _auth.authStateChanges();
  Future<String> Login(String email, String password) async{
    try{
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      return "Logged In";
    }  catch(e){
      return e;
    }
  }
  Future<String> signUp(String email, String password) async{
    try{
      await _auth.createUserWithEmailAndPassword(email: email, password: password);
      return "Logged In";
    }  catch(e){
      return e;
    }
  }
}