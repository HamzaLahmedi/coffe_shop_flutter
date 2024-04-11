import 'package:coffe_shop/core/utils/app_styles.dart';
import 'package:coffe_shop/core/utils/colors.dart';
import 'package:coffe_shop/views/onBoarding_view/controller/onBoarding_list.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingHeader extends StatelessWidget {
  const OnBoardingHeader(
      {super.key, required this.pageController, required this.controller});
  final PageController pageController;
  final OnBoardingItems controller;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SmoothPageIndicator(
          controller: pageController,
          count: controller.onBoardingList.length,
          effect: const ExpandingDotsEffect(
            dotColor: AppColors.kTextColor,
            activeDotColor: AppColors.kPrimaryColor,
            dotHeight: 3,
            dotWidth: 20,
            expansionFactor: 2,
          ),
        ),
        const Spacer(),
        TextButton(
          onPressed: () {},
          child: Text(
            'Skip',
            style: AppStyles.styleBold20.copyWith(
              fontSize: 14,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
