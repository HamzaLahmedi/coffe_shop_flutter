import 'package:coffe_shop/core/utils/app_styles.dart';
import 'package:coffe_shop/core/utils/colors.dart';
import 'package:flutter/material.dart';

class CustomTransparentButton extends StatelessWidget {
  const CustomTransparentButton(
      {super.key, this.onPressed, required this.title, required this.height, required this.width});
  final Function()? onPressed;
  final String title;
  final double  height;
  final double width;
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
              side: const BorderSide(
                color: AppColors.kPrimaryColor,
                width: 2,
              ),
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
          backgroundColor: MaterialStateProperty.all(Colors.transparent),
          textStyle: MaterialStateProperty.all(AppStyles.styleBold20),
          foregroundColor: MaterialStateProperty.all(AppColors.kPrimaryColor),
        ),
        child: Text(title),
      ),
    );
    ;
  }
}
