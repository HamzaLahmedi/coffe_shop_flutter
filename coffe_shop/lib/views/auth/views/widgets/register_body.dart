import 'package:coffe_shop/core/utils/snackbar.dart';
import 'package:coffe_shop/core/widgets/custom_button.dart';
import 'package:coffe_shop/views/auth/controllers/auth.dart';
import 'package:coffe_shop/views/auth/views/sign_in_view.dart';
import 'package:coffe_shop/views/auth/views/widgets/bottom_text.dart';
import 'package:coffe_shop/views/auth/views/widgets/custom_social_icons.dart';
import 'package:coffe_shop/views/auth/views/widgets/divider_section.dart';
import 'package:coffe_shop/views/auth/views/widgets/register_fields_section.dart';
import 'package:coffe_shop/views/auth/views/widgets/signIn_header.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class RegisterBody extends StatelessWidget {
  RegisterBody({
    super.key,
  });
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final AuthController registerController = AuthController();
  final formKey = GlobalKey<FormState>();
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
              Form(
                key: formKey,
                child: RegisterFieldsSection(
                  emailController: emailController,
                  passwordController: passwordController,
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              CustomButton(
                title: 'Register',
                height: MediaQuery.sizeOf(context).height * 0.085,
                width: MediaQuery.sizeOf(context).width,
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    registerController.userRegister(
                        emailController.text, passwordController.text, context);
                  } else {
                    showSnackBar(context, 'Respect Authentication Rules');
                  }
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
                  // Navigator.pushNamed(context, '/register');
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SignInView()));
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
