import 'package:coffe_shop/provider/google_signin.dart';
import 'package:coffe_shop/views/auth/views/widgets/custom_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class CustomSocialicons extends StatelessWidget {
  const CustomSocialicons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final googleSignInProvider = Provider.of<GoogleSignInProvider>(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const CustomIcon(
          image: 'assets/images/facebook_logo1.svg',
        ),
        GestureDetector(
          onTap: () {
            googleSignInProvider.googlelogin();
          },
          child: const CustomIcon(
            image: 'assets/images/Google_logo.svg',
          ),
        ),
        const CustomIcon(
          image: 'assets/images/twitter.svg',
        ),
      ],
    );
  }
}
