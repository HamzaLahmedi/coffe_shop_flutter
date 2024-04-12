
import 'package:coffe_shop/core/utils/app_styles.dart';
import 'package:coffe_shop/core/utils/colors.dart';
import 'package:flutter/material.dart';

class DividerSection extends StatelessWidget {
  const DividerSection({
    super.key, required this.text,
  });
final String text;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Expanded(
          child: Divider(
            color: AppColors.kPrimaryColor,
            thickness: 1,
            endIndent: 10,
          ),
        ),
        Text(
          text,
          style: AppStyles.styleSemiBold24.copyWith(
            fontSize: 14,
          ),
        ),
        const Expanded(
          child: Divider(
            color: AppColors.kPrimaryColor,
            thickness: 1,
            indent: 10,
          ),
        ),
      ],
    );
  }
}