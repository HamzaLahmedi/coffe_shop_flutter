import 'package:coffe_shop/core/utils/snackbar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignInController {
  Future<void> userLogin(
      String email, String password, BuildContext context) async {
    try {
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);

      if (credential.user != null) {
        print('Logged in');
        showSnackBar(context, 'Done');
      } else {
        print('Sign-in failed: User credentials are null');
        showSnackBar(context, 'Sign-in failed');
      }
    } on FirebaseAuthException catch (e) {
      print('FirebaseAuthException: ${e.code}');
      if (e.code == 'user-not-found') {
        showSnackBar(context, 'No user found for that email');
      } else if (e.code == 'wrong-password') {
        showSnackBar(context, 'Wrong password provided for that user.');
      } else {
        showSnackBar(context, 'An error occurred');
      }
    } catch (e) {
      print('Error: $e');
      showSnackBar(context, 'An unexpected error occurred');
    }
  }
}
