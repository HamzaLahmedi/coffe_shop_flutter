import 'package:coffe_shop/core/widgets/custom_button.dart';
import 'package:coffe_shop/views/auth/controllers/auth.dart';
import 'package:coffe_shop/views/auth/views/resgister_view.dart';
import 'package:coffe_shop/views/auth/views/widgets/bottom_text.dart';
import 'package:coffe_shop/views/auth/views/widgets/custom_social_icons.dart';
import 'package:coffe_shop/views/auth/views/widgets/divider_section.dart';
import 'package:coffe_shop/views/auth/views/widgets/signIn_header.dart';
import 'package:coffe_shop/views/auth/views/widgets/text_fields_section.dart';
import 'package:flutter/material.dart';

class SignInBody extends StatelessWidget {
  SignInBody({super.key});
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final AuthController authController = AuthController();
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
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
            Form(
              key: formKey,
              child: TexFieldsSection(
                emailController: emailController,
                passwordController: passwordController,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: CustomButton(
                title: 'Sign in',
                height: MediaQuery.sizeOf(context).height * 0.08,
                width: MediaQuery.sizeOf(context).width,
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    authController.userLogin(
                        emailController.text, passwordController.text, context);
                  }
                },
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
            const SizedBox(
              height: 120,
            ),
            BottomText(
              text: 'Register',
              onPressed: () {
                // Navigator.pushNamed(context, '/register');
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const RegisterView()));
              },
            ),
            const SizedBox(
              height: 50,
            ),
          ],
        ),
      ),
    );
  }
}
