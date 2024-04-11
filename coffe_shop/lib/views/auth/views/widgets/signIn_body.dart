import 'package:coffe_shop/views/auth/views/widgets/signIn_header.dart';
import 'package:coffe_shop/views/auth/views/widgets/text_fields_section.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SignInBody extends StatelessWidget {
  const SignInBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height,
      child: const Column(
        children: [
          SizedBox(
            height: 100,
          ),
          SignInHeader(),
          SizedBox(
            height: 20,
          ),
          Expanded(
            child: TexFieldsSection(),
          ),
        ],
      ),
    );
  }
}
