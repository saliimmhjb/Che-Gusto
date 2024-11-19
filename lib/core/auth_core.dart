import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  // taaml instance of firebase auth
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  // get current user
  User? getCurrentUser() {
    return _firebaseAuth.currentUser;
  }

  // sign in
  Future<UserCredential> signInWithEmailAndPassword(String email,
      password) async {
    try {
      UserCredential userCredential = await _firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);
      return userCredential;
    }

    on FirebaseAuthException catch(e) {
      throw Exception(e.code);
    }
  }

  // sign up
  Future<UserCredential> signUnWithEmailAndPassword(String email,
      password, username) async {
    try {
      UserCredential userCredential = await _firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);
      User? user = userCredential.user;
      user!.updateProfile(displayName: username);


      return userCredential;
    }

    on FirebaseAuthException catch(e) {
      throw Exception(e.code);
    }
  }

  // sign out
  Future<void> signOut() async {
    return await _firebaseAuth.signOut();
  }
}