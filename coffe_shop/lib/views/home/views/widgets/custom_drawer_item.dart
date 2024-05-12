import 'package:coffe_shop/core/utils/app_styles.dart';
import 'package:coffe_shop/core/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomDrawerItem extends StatelessWidget {
  const CustomDrawerItem({
    super.key,
    required this.title,
    required this.iconPath,
  });
  final String title, iconPath;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        title,
        style: AppStyles.styleSemiBold24.copyWith(
          fontSize: 18,
          fontWeight: FontWeight.w500,
        ),
      ),
      leading: CircleAvatar(
        radius: 20,
        backgroundColor: AppColors.kPrimaryColor,
        child: SvgPicture.asset(
          iconPath,
          fit: BoxFit.cover,
          colorFilter: const ColorFilter.mode(
            Colors.white,
            BlendMode.srcIn,
          ),
        ),
      ),
    );
  }
}
