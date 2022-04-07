import 'package:firebase_auth/firebase_auth.dart';

//interface for LoginData
abstract class Auth {
  //emits users current login status
  Stream<User?> get user;

  //create an account
  Future<String?> createAccount({
    required String email,
    required String password,
  });

  //sign in
  Future<String?> signIn({
    required String email,
    required String password,
  });

  //sign out
  Future<String?> signOut();
}
