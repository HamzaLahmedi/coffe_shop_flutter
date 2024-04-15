import 'package:coffe_shop/core/utils/app_images.dart';
import 'package:coffe_shop/core/utils/colors.dart';
import 'package:coffe_shop/core/widgets/custom_app_bar.dart';
import 'package:coffe_shop/views/home/views/widgets/profile_body.dart';
import 'package:flutter/material.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kBackgroundColor,
      appBar: customAppBar(
        onPressed: () => Navigator.pop(context),
        title: 'Profile',
        imagePath: Assets.imagesNotifLogo,
      ),
      body: const ProfileBody(),
    );
  }
}
