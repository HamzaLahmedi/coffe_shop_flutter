import 'package:coffe_shop/core/utils/app_styles.dart';
import 'package:coffe_shop/core/utils/colors.dart';
import 'package:coffe_shop/views/auth/views/widgets/text_form_field.dart';
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
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
          child: CustomTextFormField(
            text: 'Enter your email',
            keyboardType: TextInputType.emailAddress,
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: CustomTextFormField(
            text: 'Password',
            keyboardType: TextInputType.emailAddress,
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
