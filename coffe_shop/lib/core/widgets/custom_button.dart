import 'package:coffe_shop/core/utils/colors.dart';
import 'package:flutter/material.dart';

import '../utils/app_styles.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, this.onPressed, required this.title, required this.height, required this.width});
final Function()? onPressed;
final String title;
final double height,width;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
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
