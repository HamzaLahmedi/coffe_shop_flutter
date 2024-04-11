import 'package:flutter/material.dart';

import '../../../models/onBoarding_model.dart';

class OnBoardingItems {
  final List<OnBoardingModel> onBoardingList = const [
    OnBoardingModel(
      image: 'assets/images/Onboarding_1.png',
      title: 'Embrace coffee essence',
      description:
          'Lorem ipsum dolor sit amet consectetur. Vestibulum eget blandit mattis ',
    ),
    OnBoardingModel(
      image: 'assets/images/Onboarding_2.png',
      title: 'Flavorful bean journey',
      description:
          'Lorem ipsum dolor sit amet consectetur. Vestibulum eget blandit mattis ',
    ),
    OnBoardingModel(
      image: 'assets/images/Onboarding_3.png',
      title: 'Unlock bean secrets',
      description:
          'Lorem ipsum dolor sit amet consectetur. Vestibulum eget blandit mattis ',
    ),
  ];
}
