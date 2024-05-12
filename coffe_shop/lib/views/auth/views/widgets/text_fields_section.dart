import 'package:coffe_shop/core/utils/app_styles.dart';
import 'package:coffe_shop/core/utils/colors.dart';
import 'package:coffe_shop/views/auth/views/forget_password.dart';
import 'package:coffe_shop/views/auth/views/widgets/text_form_field.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';

class TexFieldsSection extends StatefulWidget {
  const TexFieldsSection({
    super.key,
    this.emailController,
    this.passwordController,
  });
  final TextEditingController? emailController;
  final TextEditingController? passwordController;
  @override
  State<TexFieldsSection> createState() => _TexFieldsSectionState();
}

class _TexFieldsSectionState extends State<TexFieldsSection> {
  bool isVisible = true;

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
            controller: widget.emailController,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: CustomTextFormField(
            validator: (value) {
              return value!.length < 6 ? "Enter at least 6 characters" : null;
            },
            text: 'Password',
            keyboardType: TextInputType.text,
            isObsecure: isVisible,
            suffixIcon: IconButton(
              onPressed: () {
                setState(() {
                  isVisible = !isVisible;
                });
              },
              icon: isVisible
                  ? const Icon(Icons.visibility)
                  : const Icon(Icons.visibility_off),
            ),
            controller: widget.passwordController,
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        Padding(
          padding: const EdgeInsets.only(right: 10),
          child: GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return const ForgetPassword();
              }));
            },
            child: Text(
              'Forgot Password?',
              style: AppStyles.styleBold20.copyWith(
                color: AppColors.kPrimaryColor,
                fontSize: 12,
              ),
            ),
          ),
        )
      ],
    );
  }
}
