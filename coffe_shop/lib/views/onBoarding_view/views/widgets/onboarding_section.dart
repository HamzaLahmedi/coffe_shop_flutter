import 'package:coffe_shop/views/onBoarding_view/controller/onBoarding_list.dart';
import 'package:coffe_shop/views/onBoarding_view/views/widgets/onBoarding_header.dart';
import 'package:coffe_shop/views/onBoarding_view/views/widgets/onBoarding_sction_body.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class OnBoardingSection extends StatelessWidget {
  OnBoardingSection(
      {super.key,
      required this.index,
      required this.pageController,
      required this.controller});
  final OnBoardingItems onBoardingItem = OnBoardingItems();
  final PageController pageController;
  final int index;
  final OnBoardingItems controller;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: OnBoardingHeader(
            pageController: pageController,
            controller: controller,
          ),
        ),
        const SizedBox(
          height: 200,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 50),
          child: OnBoardingSectionBody(
            index: index,
            title: onBoardingItem.onBoardingList[index].title,
            description: onBoardingItem.onBoardingList[index].description,
            image: onBoardingItem.onBoardingList[index].image,
          ),
        ),
      ],
    );
  }
}