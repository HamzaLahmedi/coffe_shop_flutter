import 'package:coffe_shop/core/utils/colors.dart';
import 'package:coffe_shop/core/widgets/custom_app_bar.dart';
import 'package:coffe_shop/views/home/views/widgets/custom_liked_grid_view.dart';
import 'package:flutter/material.dart';

class LikedView extends StatelessWidget {
  const LikedView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kBackgroundColor,
      appBar: customAppBar(
        title: 'Favorites',
        onPressed: () => Navigator.pop(context),
      ),
      body:const CustomLikedGridView(),
    );
  }
}

