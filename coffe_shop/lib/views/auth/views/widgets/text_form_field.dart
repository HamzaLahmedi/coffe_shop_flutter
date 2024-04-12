import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField(
      {super.key, required this.text, this.isObsecure, this.keyboardType});
  final String text;
  final bool? isObsecure;
  final TextInputType? keyboardType;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        label: Text(
          text,
          style: const TextStyle(
            color: Color(0xff828282),
            fontSize: 12,
            fontWeight: FontWeight.w400,
          ),
        ),
        fillColor: const Color(0xff16181C),
        filled: true,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(
            color: Color(0xff16181C),
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(
            color: Color(0xff16181C),
          ),
        ),
      ),
      obscureText: isObsecure ?? false,
      keyboardType: keyboardType,
    );
  }
}
