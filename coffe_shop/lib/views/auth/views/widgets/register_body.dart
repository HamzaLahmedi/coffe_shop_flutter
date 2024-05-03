import 'package:coffe_shop/core/utils/snackbar.dart';
import 'package:coffe_shop/core/widgets/custom_button.dart';
import 'package:coffe_shop/views/auth/controllers/auth.dart';
import 'package:coffe_shop/views/auth/views/sign_in_view.dart';
import 'package:coffe_shop/views/auth/views/widgets/bottom_text.dart';
import 'package:coffe_shop/views/auth/views/widgets/custom_social_icons.dart';
import 'package:coffe_shop/views/auth/views/widgets/divider_section.dart';
import 'package:coffe_shop/views/auth/views/widgets/register_fields_section.dart';
import 'package:coffe_shop/views/auth/views/widgets/signIn_header.dart';
import 'package:flutter/material.dart';

class RegisterBody extends StatelessWidget {
  RegisterBody({
    super.key,
  });
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final AuthController registerController = AuthController();
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const AlwaysScrollableScrollPhysics(),
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
                  firstNameController: firstNameController,
                  lastNameController: lastNameController,
                  ageController: ageController,
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
                        emailController.text,
                        passwordController.text,
                        firstNameController.text,
                        lastNameController.text,
                        ageController.text,
                        context);
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
              const SizedBox(
                height: 20,
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
              const Expanded(
                child: SizedBox(
                  height: 50,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
