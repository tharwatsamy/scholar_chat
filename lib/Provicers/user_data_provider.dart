import 'package:firebase_auth/firebase_auth.dart';

class UserProvider {
  UserCredential userCredential;

  set s(UserCredential userCredential) {
    this.userCredential = userCredential;
  }

  UserCredential get getUser {
    return userCredential;
  }
}
