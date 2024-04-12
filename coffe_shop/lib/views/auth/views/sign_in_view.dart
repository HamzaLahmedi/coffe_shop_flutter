import 'package:coffe_shop/views/auth/views/widgets/signIn_body.dart';
import 'package:coffe_shop/views/auth/views/widgets/text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SignInView extends StatelessWidget {
  const SignInView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.transparent, // Make background transparent
      body: DecoratedBox(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              'assets/images/Login_signup_bgg.png',
            ), // Replace with your image path
            fit: BoxFit.cover, // Adjust fit as needed (cover, contain, etc.)
          ),
        ),
        child: Column(
          children: [
            SignInBody(),
          ],
        ),
      ),
    );
  }
}
