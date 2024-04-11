import 'package:coffe_shop/core/utils/colors.dart';
import 'package:flutter/material.dart';

import '../utils/app_styles.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, this.onPressed, required this.title});
final Function()? onPressed;
final String title;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 53,
      width: 242,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
          backgroundColor: MaterialStateProperty.all(AppColors.kPrimaryColor),
          textStyle: MaterialStateProperty.all(AppStyles.styleBold20),
          foregroundColor:
              MaterialStateProperty.all(AppColors.kBackgroundColor),
        ),
        child:  Text(title),
      ),
    );
  }
}
