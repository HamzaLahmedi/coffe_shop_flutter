import 'package:coffe_shop/core/utils/colors.dart';
import 'package:coffe_shop/core/utils/snackbar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RegisterController {
  Future<void> userRegister(
      String email, String password, BuildContext context) async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      Navigator.pushNamed(context, '/home');
      print(credential);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
        showSnackBar(context, 'The password provided is too weak');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');

        showSnackBar(context, 'The account already exists for that email');
      } else {
        showSnackBar(context, 'There was an error please try later');
      }
    } catch (e) {
      print(e);
      showSnackBar(context, e.toString());
    }
  }
}
