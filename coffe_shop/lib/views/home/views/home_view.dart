import 'package:coffe_shop/core/utils/colors.dart';
import 'package:coffe_shop/views/home/views/widgets/home_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:coffe_shop/core/utils/app_images.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.kBackgroundColor,
      body:  HomeViewBody(),
    );
  }
}
