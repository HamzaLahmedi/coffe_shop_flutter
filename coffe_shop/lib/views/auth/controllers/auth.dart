import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coffe_shop/core/utils/snackbar.dart';
import 'package:coffe_shop/views/auth/views/sign_in_view.dart';
import 'package:coffe_shop/views/home/views/home_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class AuthController {
  Future<void> userRegister(
      String email,
      String password,
      String firstName,
      String lastName,
      String age,
      File imgPath,
      String imgName,
      BuildContext context) async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      //upload img to store
      final storageRef = FirebaseStorage.instance.ref('users-imgs/$imgName');
      await storageRef.putFile(imgPath);

      // Get img url
      String url = await storageRef.getDownloadURL();

      CollectionReference users =
          FirebaseFirestore.instance.collection('users');

      users
          .doc(credential.user!.uid)
          .set({
            'firstName': firstName,
            'lastName': lastName,
            'age': age,
            'email': email,
            'imgUrl': url,
            //'password': password,
          })
          .then((value) => showSnackBar(context, 'User Added'))
          .catchError((error) => showSnackBar(context, 'Failed to add user: $error'));
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

  signOut(BuildContext context) {
    try {
      FirebaseAuth.instance.signOut();
     showSnackBar(context, 'Signed out');
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
        return const SignInView();
      }));
    } catch (e) {
      showSnackBar(context, 'Error signing out: $e');
      // Handle the error, show a message, or perform other actions.
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
