import 'package:coffe_shop/core/utils/app_styles.dart';
import 'package:coffe_shop/core/utils/colors.dart';
import 'package:coffe_shop/views/auth/views/widgets/text_form_field.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';

class TexFieldsSection extends StatelessWidget {
  const TexFieldsSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
          child: CustomTextFormField(
            text: 'Enter your email',
            keyboardType: TextInputType.emailAddress,
            validator: (value) {
              return value != null && !EmailValidator.validate(value)
                  ? "Enter a valid email"
                  : null;
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: CustomTextFormField(
            validator: (value) {
              return value!.length < 8 ? "Enter at least 6 characters" : null;
            },
            text: 'Password',
            keyboardType: TextInputType.text,
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        Padding(
          padding: const EdgeInsets.only(right: 10),
          child: Text(
            'Forgot Password?',
            style: AppStyles.styleBold20.copyWith(
              color: AppColors.kPrimaryColor,
              fontSize: 12,
            ),
          ),
        )
      ],
    );
  }
}
