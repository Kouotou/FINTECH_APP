import 'package:firebase_auth/firebase_auth.dart' show User;
import 'package:flutter/material.dart';

@immutable
//any class or subclass under @immutable is never going
//to change after initialization
class AuthUser {
  final bool isEmailVerified;

  const AuthUser(this.isEmailVerified);

  factory AuthUser.fromFirebase(User ourUser) =>
      AuthUser(ourUser.emailVerified);
}
