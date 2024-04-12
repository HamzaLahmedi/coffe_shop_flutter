import 'package:coffe_shop/views/auth/views/widgets/register_body.dart';

import 'package:flutter/material.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.transparent,
      body: DecoratedBox(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              'assets/images/Login_signup_bgg.png',
            ), // Replace with your image path
            fit: BoxFit.cover, // Adjust fit as needed (cover, contain, etc.)
          ),
        ),
        child: RegisterBody(),
      ),
    );
  }
}
