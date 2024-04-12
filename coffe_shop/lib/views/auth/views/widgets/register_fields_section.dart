import 'package:coffe_shop/views/auth/views/widgets/text_form_field.dart';
import 'package:flutter/material.dart';

class RegisterFieldsSection extends StatelessWidget {
  const RegisterFieldsSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        CustomTextFormField(text: 'Full Name'),
        SizedBox(
          height: 8,
        ),
        CustomTextFormField(text: 'E-mail Addresse'),
        SizedBox(
          height: 8,
        ),
        CustomTextFormField(text: 'Password'),
        SizedBox(
          height: 8,
        ),
        CustomTextFormField(text: 'Confirm Password'),
      ],
    );
  }
}
