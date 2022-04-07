import 'package:firebase_auth/firebase_auth.dart';

import 'auth.dart';

class AuthImpl implements Auth {
  final FirebaseAuth firebaseAuth;

  AuthImpl({
    required this.firebaseAuth,
  });

  @override
  Stream<User?> get user => firebaseAuth.authStateChanges();

  @override
  Future<String?> createAccount({
    required String email,
    required String password,
  }) async {
    try {
      await firebaseAuth.createUserWithEmailAndPassword(
        email: email.trim(),
        password: password.trim(),
      );
      return "Success";
    } on FirebaseAuthException catch (e) {
      return e.message;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<String?> signIn({
    required String email,
    required String password,
  }) async {
    try {
      await firebaseAuth.signInWithEmailAndPassword(
        email: email.trim(),
        password: password.trim(),
      );
      return "Success";
    } on FirebaseAuthException catch (e) {
      return e.message;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<String?> signOut() async {
    try {
      await firebaseAuth.signOut();
      return "Success";
    } on FirebaseAuthException catch (e) {
      return e.message;
    } catch (e) {
      rethrow;
    }
  }
}
