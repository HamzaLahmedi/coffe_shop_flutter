import 'package:coffe_shop/core/widgets/custom_button.dart';
import 'package:coffe_shop/views/auth/controllers/register.dart';
import 'package:coffe_shop/views/auth/views/widgets/bottom_text.dart';
import 'package:coffe_shop/views/auth/views/widgets/custom_social_icons.dart';
import 'package:coffe_shop/views/auth/views/widgets/divider_section.dart';
import 'package:coffe_shop/views/auth/views/widgets/register_fields_section.dart';
import 'package:coffe_shop/views/auth/views/widgets/signIn_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class RegisterBody extends StatelessWidget {
  RegisterBody({
    super.key,
  });
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final RegisterController registerController = RegisterController();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: SizedBox(
          height: MediaQuery.sizeOf(context).height,
          width: MediaQuery.sizeOf(context).width,
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
              RegisterFieldsSection(
                emailController: emailController,
                passwordController: passwordController,
              ),
              const SizedBox(
                height: 25,
              ),
              CustomButton(
                title: 'Register',
                height: MediaQuery.sizeOf(context).height * 0.08,
                width: MediaQuery.sizeOf(context).width,
                onPressed: () {
                  registerController.userRegister(
                      emailController.text, passwordController.text, context);
                },
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
        ),
      ),
    );
  }
}
