import 'package:coffe_shop/core/utils/colors.dart';
import 'package:coffe_shop/views/home/controller/navigation_list.dart';
import 'package:coffe_shop/views/home/views/liked_view.dart';
import 'package:coffe_shop/views/home/views/profile_view.dart';
import 'package:coffe_shop/views/home/views/shop_view.dart';
import 'package:coffe_shop/views/home/views/widgets/home_view_body.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.kBackgroundColor,
      body: HomeViewBody(),
    );
  }
}
