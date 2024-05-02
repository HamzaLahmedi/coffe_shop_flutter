import 'package:coffe_shop/core/utils/app_styles.dart';
import 'package:coffe_shop/core/widgets/custom_button.dart';
import 'package:coffe_shop/views/auth/controllers/auth.dart';
import 'package:coffe_shop/views/auth/views/widgets/signIn_header.dart';
import 'package:coffe_shop/views/auth/views/widgets/text_form_field.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ForgetPasswordBody extends StatelessWidget {
  ForgetPasswordBody({super.key});

  final TextEditingController emailController = TextEditingController();
  AuthController authController = AuthController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          const SizedBox(
            height: 60,
          ),
          Align(
              alignment: Alignment.center,
              child: SvgPicture.asset('assets/images/login_signup_logo.svg')),
          const Text(
            "Enter your email to reset \npassword",
            textAlign: TextAlign.center,
            style: AppStyles.styleSemiBold24,
          ),
          const SizedBox(
            height: 120,
          ),
          CustomTextFormField(
            text: 'Enter Your Email',
            controller: emailController,
            keyboardType: TextInputType.emailAddress,
            validator: (value) {
              return value != null && !EmailValidator.validate(value)
                  ? "Enter a valid email"
                  : null;
            },
          ),
          const SizedBox(
            height: 20,
          ),
          CustomButton(
            title: 'Reset Password',
            height: MediaQuery.sizeOf(context).height * 0.08,
            width: MediaQuery.sizeOf(context).width,
            onPressed: () {
              authController.resetPassword(emailController.text, context);
            },
          )
        ],
      ),
    );
  }
}
