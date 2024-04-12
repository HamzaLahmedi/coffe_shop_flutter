import 'package:coffe_shop/core/widgets/custom_button.dart';
import 'package:coffe_shop/views/auth/views/widgets/bottom_text.dart';
import 'package:coffe_shop/views/auth/views/widgets/custom_social_icons.dart';
import 'package:coffe_shop/views/auth/views/widgets/divider_section.dart';
import 'package:coffe_shop/views/auth/views/widgets/register_fields_section.dart';
import 'package:coffe_shop/views/auth/views/widgets/signIn_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class RegisterBody extends StatelessWidget {
  const RegisterBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          const SizedBox(
            height: 80,
          ),
          const SignInHeader(
            title: 'Register your Account',
          ),
          const SizedBox(
            height: 20,
          ),
          const RegisterFieldsSection(),
          const SizedBox(
            height: 25,
          ),
          CustomButton(
            title: 'Register',
            height: MediaQuery.sizeOf(context).height * 0.08,
            width: MediaQuery.sizeOf(context).width,
          ),
          const SizedBox(
            height: 25,
          ),
          const DividerSection(
            text: 'Or Register with',
          ),
          const SizedBox(
            height: 25,
          ),
          const CustomSocialicons(),
          const Expanded(
            child: SizedBox(
              height: 20,
            ),
          ),
          BottomText(
            text: 'Login',
            onPressed: () {
              Navigator.pushNamed(context, '/signin');
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
