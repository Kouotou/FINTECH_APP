import 'package:learnflutter/services/auth/auth_user.dart';

abstract class AuthProvider {
  Future<void> initialize();
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
  Future<void> logOut();

  //funtion to sendEmailVerification tp a user
  Future<void> sendEmailVerification();
}
