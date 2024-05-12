import 'package:coffe_shop/core/utils/app_styles.dart';
import 'package:coffe_shop/core/utils/colors.dart';
import 'package:flutter/material.dart';

class CustomListViewItem extends StatelessWidget {
  const CustomListViewItem({
    super.key,
    required this.title,
    required this.iconPath,
  });
  final String title, iconPath;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: AppStyles.styleSemiBold24.copyWith(
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
          const Icon(
            Icons.chevron_right,
            color: AppColors.kPrimaryColor,
            size: 50,
          ),
        ],
      ),
      leading: CircleAvatar(
        radius: 20,
        backgroundColor: AppColors.kPrimaryColor,
        child: Image.asset(iconPath),
      ),
    );
  }
}
