import 'package:firebase_auth/firebase_auth.dart' show User;
import 'package:flutter/material.dart';

class AuthUser {
  final String id;
  final String email;
  final bool isEmailVerified;

  const AuthUser({
    required this.id,
    required this.email,
    required this.isEmailVerified,
  });

  factory AuthUser.fromfirebase(User user) => AuthUser(
        id: user.uid,
        email: user.email!,
        isEmailVerified: user.emailVerified,
      );
}
