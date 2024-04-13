import 'package:coffe_shop/core/utils/colors.dart';
import 'package:coffe_shop/views/home/controller/navigation_list.dart';
import 'package:coffe_shop/views/home/views/liked_view.dart';
import 'package:coffe_shop/views/home/views/profile_view.dart';
import 'package:coffe_shop/views/home/views/shop_view.dart';
import 'package:coffe_shop/views/home/views/widgets/home_view_body.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

int _currentIndex = 0;

final List<Widget> _pages = [
  const HomeViewBody(),
  // Add other pages here, for example:
  const ShopView(),
  const LikedView(),
  const ProfileView(),
];

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kBackgroundColor,
      body: _pages[_currentIndex],
      bottomNavigationBar: ConvexAppBar(
        backgroundColor: AppColors.kPrimaryColor,
        //color: AppColors.kBackgroundColor,
        activeColor: AppColors.kBackgroundColor,
        curveSize: 80,
        // color: AppColors.kPrimaryColor,
        items: NavigationList.toTabItems(
          activeIndex: _currentIndex,
        ),
        initialActiveIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
