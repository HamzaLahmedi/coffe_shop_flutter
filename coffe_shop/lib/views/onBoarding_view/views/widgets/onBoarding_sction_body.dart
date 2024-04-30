import 'package:coffe_shop/core/utils/app_styles.dart';
import 'package:coffe_shop/core/widgets/custom_button.dart';
import 'package:coffe_shop/views/auth/views/resgister_view.dart';
import 'package:coffe_shop/views/auth/views/sign_in_view.dart';
import 'package:coffe_shop/views/onBoarding_view/views/widgets/custom_transparant_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class OnBoardingSectionBody extends StatelessWidget {
  const OnBoardingSectionBody(
      {super.key,
      required this.title,
      required this.description,
      required this.image,
      required this.index});
  final String image, title, description;
  final int index;
  @override
  Widget build(BuildContext context) {
    return index == 2
        ? Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                title,
                style: AppStyles.styleBold36,
              ),
              Text(
                description,
                style: AppStyles.styleRegular14,
              ),
              const SizedBox(
                height: 240,
              ),
              Column(
                children: [
                  CustomButton(
                    height: MediaQuery.sizeOf(context).height * 0.07,
                    width: MediaQuery.sizeOf(context).width * 0.9,
                    title: 'Register',
                    onPressed: () {
                      // Navigator.pushNamed(context, '/register');
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const RegisterView()));
                    },
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  CustomTransparentButton(
                    title: 'Sign In',
                    height: MediaQuery.sizeOf(context).height * 0.07,
                    width: MediaQuery.sizeOf(context).width * 0.9,
                    onPressed: () {
                      // Navigator.pushNamed(context, '/register');
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SignInView()));
                    },
                  ),
                ],
              )
            ],
          )
        : Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                title,
                style: AppStyles.styleBold36,
              ),
              Text(
                description,
                style: AppStyles.styleRegular14,
              ),
            ],
          );
  }
}
