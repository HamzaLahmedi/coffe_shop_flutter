import 'package:coffe_shop/models/onBoarding_model.dart';
import 'package:coffe_shop/views/onBoarding_view/controller/onBoarding_list.dart';
import 'package:coffe_shop/views/onBoarding_view/views/widgets/onBoarding_header.dart';
import 'package:coffe_shop/views/onBoarding_view/views/widgets/onboarding_section.dart';
import 'package:flutter/material.dart';

class OnBoardingBody extends StatefulWidget {
  const OnBoardingBody({super.key});

  @override
  State<OnBoardingBody> createState() => _OnBoardingBodyState();
}

class _OnBoardingBodyState extends State<OnBoardingBody> {
  final controller = OnBoardingItems();
  final PageController pageController = PageController();

  @override
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      child: PageView.builder(
        itemCount: controller.onBoardingList.length,
        controller: pageController,
        itemBuilder: (context, index) {
          return Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(controller.onBoardingList[index].image),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              children: [
                OnBoardingSection(
                  index: index,
                  pageController: pageController,
                  controller: controller,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
