import 'package:coffe_shop/views/auth/views/widgets/text_form_field.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';

class RegisterFieldsSection extends StatefulWidget {
  const RegisterFieldsSection({
    super.key,
    this.emailController,
    this.passwordController,
  });
  final TextEditingController? emailController;
  final TextEditingController? passwordController;

  @override
  State<RegisterFieldsSection> createState() => _RegisterFieldsSectionState();
}

class _RegisterFieldsSectionState extends State<RegisterFieldsSection> {
  bool isVisible = true;

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
          controller: widget.emailController,
          keyboardType: TextInputType.emailAddress,
          validator: (value) {
            return value != null && !EmailValidator.validate(value)
                ? "Enter a valid email"
                : null;
          },
        ),
        const SizedBox(
          height: 8,
        ),
        CustomTextFormField(
          text: 'Password',
          controller: widget.passwordController,
          keyboardType: TextInputType.text,
          isObsecure: isVisible,
          validator: (value) {
            return value!.length < 6 ? "Enter at least 6 characters" : null;
          },
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
        ),
        const SizedBox(
          height: 8,
        ),
        // const CustomTextFormField(text: 'Confirm Password'),
      ],
    );
  }
}
