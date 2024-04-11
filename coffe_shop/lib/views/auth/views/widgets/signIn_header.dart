import 'package:coffe_shop/core/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SignInHeader extends StatelessWidget {
  const SignInHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.center,
          child: Column(
            children: [
              SvgPicture.asset('assets/images/login_signup_logo.svg'),
              const Text(
                'Welcome to Login',
                style: AppStyles.styleSemiBold24,
              )
            ],
          ),
        ),
      ],
    );
  }
}
