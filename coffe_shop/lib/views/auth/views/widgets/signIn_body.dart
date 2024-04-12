import 'package:coffe_shop/core/widgets/custom_button.dart';
import 'package:coffe_shop/views/auth/views/widgets/bottom_text.dart';
import 'package:coffe_shop/views/auth/views/widgets/custom_social_icons.dart';
import 'package:coffe_shop/views/auth/views/widgets/divider_section.dart';
import 'package:coffe_shop/views/auth/views/widgets/signIn_header.dart';
import 'package:coffe_shop/views/auth/views/widgets/text_fields_section.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignInBody extends StatelessWidget {
  const SignInBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height,
      child: Column(
        children: [
          const SizedBox(
            height: 80,
          ),
          const SignInHeader(
            title: 'Welcome to Login',
          ),
          const SizedBox(
            height: 20,
          ),
          const TexFieldsSection(),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: CustomButton(
              title: 'Sign in',
              height: MediaQuery.sizeOf(context).height * 0.08,
              width: MediaQuery.sizeOf(context).width,
              onPressed: () => Navigator.pushNamed(context, '/home'),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          const DividerSection(
            text: 'Or Login with',
          ),
          const SizedBox(
            height: 30,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: CustomSocialicons(),
          ),
          const Expanded(
            child: SizedBox(
              height: 20,
            ),
          ),
          BottomText(
            text: 'Login',
            onPressed: () {
              Navigator.pushNamed(context, '/register');
            },
          ),
          const SizedBox(
            height: 50,
          ),
        ],
      ),
    );
  }
}
