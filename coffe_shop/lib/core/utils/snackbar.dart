import 'package:coffe_shop/core/utils/colors.dart';
import 'package:flutter/material.dart';

showSnackBar(BuildContext context, String text) {
  return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    duration: const Duration(seconds: 10),
    elevation: 0,
    backgroundColor: AppColors.kPrimaryColor,
    content: Text(
      text,
      style: const TextStyle(
        color: AppColors.kBackgroundColor,
        fontSize: 18,
      ),
    ),
    action: SnackBarAction(
      label: "close",
      onPressed: () {},
      textColor: AppColors.kBackgroundColor,
    ),
  ));
}
