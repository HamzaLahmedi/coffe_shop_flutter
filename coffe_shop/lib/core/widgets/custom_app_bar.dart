import 'package:coffe_shop/core/utils/app_images.dart';
import 'package:coffe_shop/core/utils/app_styles.dart';
import 'package:coffe_shop/core/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

AppBar customAppBar(
    {required String title,
    String? imagePath,
    required  Function()? onPressed}) {
  return AppBar(
    backgroundColor: AppColors.kBackgroundColor,
    elevation: 0,
    centerTitle: true,
    title: Text(
      title,
      style: AppStyles.styleBold20.copyWith(
        fontSize: 22,
        color: AppColors.kTextColor,
      ),
    ),
    leading: IconButton(
      icon: const Icon(
        Icons.arrow_back_ios,
        color: AppColors.kPrimaryColor,
      ),
      onPressed: () {
        onPressed == null ? '' : onPressed();
      },
    ),
    actions: [
      imagePath != null
          ? Padding(
              padding: const EdgeInsets.only(right: 20),
              child: SvgPicture.asset(Assets.imagesNotifLogo),
            )
          : const SizedBox()
    ],
  );
}
