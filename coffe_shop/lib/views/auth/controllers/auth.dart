import 'package:coffe_shop/core/utils/colors.dart';
import 'package:coffe_shop/core/utils/snackbar.dart';
import 'package:coffe_shop/views/auth/views/sign_in_view.dart';
import 'package:coffe_shop/views/home/views/home_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthController {
  Future<void> userRegister(
      String email, String password, BuildContext context) async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (!context.mounted) return;
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const SignInView()));
      // print(credential);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        // print('The password provided is too weak.');
        if (!context.mounted) return;
        showSnackBar(context, 'The password provided is too weak');
      } else if (e.code == 'email-already-in-use') {
        //print('The account already exists for that email.');
        if (!context.mounted) return;
        showSnackBar(context, 'The account already exists for that email');
      } else {
        if (!context.mounted) return;
        showSnackBar(context, 'There was an error please try later');
      }
    } catch (e) {
      // print(e);
      if (!context.mounted) return;
      showSnackBar(context, e.toString());
    }
  }

  Future<void> userLogin(
      String email, String password, BuildContext context) async {
    try {
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);

      if (credential.user != null) {
        // print('Logged in');
        if (!context.mounted) return;
        showSnackBar(context, 'Done');
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => HomeView()),
        );
      } else {
        //print('Sign-in failed: User credentials are null');
        if (!context.mounted) return;
        showSnackBar(context, 'Sign-in failed');
      }
    } on FirebaseAuthException catch (e) {
      // print('FirebaseAuthException: ${e.code}');
      if (!context.mounted) return;
      showSnackBar(context, "error : ${e.code}");
      /*if (e.code == 'user-not-found') {
        showSnackBar(context, 'No user found for that email');
      } else if (e.code == 'wrong-password') {
        showSnackBar(context, 'Wrong password provided for that user.');
      } else {
        showSnackBar(context, 'An error occurred');
      }*/
    } catch (e) {
      // print('Error: $e');
      if (!context.mounted) return;
      showSnackBar(context, 'An unexpected error occurred');
    }
  }

  resetPassword(String email, BuildContext context) async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);

      if (!context.mounted) return;
      showSnackBar(context, 'Done please check your email');
    } on FirebaseAuthException catch (e) {
      // print('FirebaseAuthException: ${e.code}');

      if (!context.mounted) return;
      showSnackBar(context, "error : ${e.code}");
    } catch (e) {
      // print('Error: $e');
      if (!context.mounted) return;
      showSnackBar(context, 'An unexpected error occurred');
    }
  }
}
