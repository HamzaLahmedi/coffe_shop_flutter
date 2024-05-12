import 'package:coffe_shop/core/utils/app_images.dart';
import 'package:coffe_shop/core/widgets/custom_button.dart';
import 'package:coffe_shop/views/onBoarding_view/views/onboarding_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashViewBody extends StatelessWidget {
  const SplashViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.sizeOf(context).height,
      width: MediaQuery.sizeOf(context).width,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(Assets.imagesSplashBg),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Expanded(
            child: SizedBox(
              height: 20,
            ),
          ),
          Center(
            child: //SvgPicture.asset('assets/images/Liberica.svg'),
                SvgPicture.asset(Assets.imagesCoffeSplashLogo),
          ),
          const Expanded(
            child: SizedBox(
              height: 20,
            ),
          ),
          CustomButton(
            height: MediaQuery.sizeOf(context).height * 0.07,
            width: MediaQuery.sizeOf(context).width * 0.9,
            title: 'Get Started',
            onPressed: () {
              // Navigator.pushNamed(context, '/register');
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const OnBoardingView()));
            },
          ),
          const SizedBox(
            height: 60,
          ),
        ],
      ),
    );
  }
}
