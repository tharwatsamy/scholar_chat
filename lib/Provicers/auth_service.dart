import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class AuthService {
  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  signIn(String email, String password) async {
    await _firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password);
  }

  //it creates an email for user using email and password ;
  Future<UserCredential> signUp(
      {@required String email, @required String password}) async {
    UserCredential userCredential = await _firebaseAuth
        .createUserWithEmailAndPassword(email: email, password: password);

    return userCredential;
  }
}
