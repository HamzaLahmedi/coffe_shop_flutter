import 'package:coffe_shop/core/utils/app_styles.dart';
import 'package:coffe_shop/core/utils/colors.dart';
import 'package:flutter/material.dart';

class BottomText extends StatelessWidget {
  const BottomText({
    super.key, required this.text, required this.onPressed,
  });
final String text;
final Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
         'Don’t have an account ?' ,
          style: AppStyles.styleSemiBold24.copyWith(
            fontSize: 16,
          ),
        ),
        TextButton(
          onPressed: onPressed,
          style: TextButton.styleFrom(
            padding: EdgeInsets.zero, // Remove padding to minimize space
          ),
          child: Text(
            text,
            style: AppStyles.styleBold20.copyWith(
              fontSize: 16,
              color: AppColors.kPrimaryColor,
            ),
          ),
        )
      ],
    );
  }
}