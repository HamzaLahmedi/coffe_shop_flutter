import 'package:coffe_shop/views/auth/views/widgets/custom_icon.dart';
import 'package:flutter/material.dart';

class CustomSocialicons extends StatelessWidget {
  const CustomSocialicons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomIcon(
          image: 'assets/images/facebook_logo1.svg',
        ),
        CustomIcon(
          image: 'assets/images/Google_logo.svg',
        ),
        CustomIcon(
          image: 'assets/images/twitter.svg',
        ),
      ],
    );
  }
}
