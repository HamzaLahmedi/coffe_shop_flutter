import 'package:coffe_shop/views/auth/views/widgets/text_form_field.dart';
import 'package:flutter/material.dart';

class RegisterFieldsSection extends StatelessWidget {
  const RegisterFieldsSection({
    super.key,
    this.emailController,
    this.passwordController,
  });
  final TextEditingController? emailController;
  final TextEditingController? passwordController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // const CustomTextFormField(text: 'Full Name'),
        const SizedBox(
          height: 8,
        ),
        CustomTextFormField(
          text: 'E-mail Addresse',
          controller: emailController,
          keyboardType: TextInputType.emailAddress,
        ),
        const SizedBox(
          height: 8,
        ),
        CustomTextFormField(
          text: 'Password',
          controller: passwordController,
          isObsecure: true,
        ),
        const SizedBox(
          height: 8,
        ),
        // const CustomTextFormField(text: 'Confirm Password'),
      ],
    );
  }
}
