import 'package:learnflutter/services/auth/auth_user.dart';

abstract class AuthProvider {
  AuthUser? get currentUser;

  //funtion to login a user
  Future<AuthUser> logIn({
    required String email,
    required String password,
  });

  //funtion to create a user
  Future<AuthUser> createUser({
    required String email,
    required String password,
  });

  //funtion to logOut a user
  Future<AuthUser> logOut();

  //funtion to sendEmailVerification tp a user
  Future<AuthUser> sendEmailVerification();
}
