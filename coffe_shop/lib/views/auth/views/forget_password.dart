import 'package:coffe_shop/views/auth/views/widgets/forget_password_body.dart';
import 'package:coffe_shop/views/auth/views/widgets/signIn_body.dart';
import 'package:flutter/material.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        title: const Text('Forget Password'),
      ),
      body: DecoratedBox(
        decoration:const  BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              'assets/images/Login_signup_bgg.png',
            ), // Replace with your image path
            fit: BoxFit.cover, // Adjust fit as needed (cover, contain, etc.)
          ),
        ),
        child: Column(
          children: [
            ForgetPasswordBody(),
          ],
        ),
      ),
    );
  }
}
