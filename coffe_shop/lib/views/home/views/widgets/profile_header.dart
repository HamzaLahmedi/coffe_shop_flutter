import 'package:coffe_shop/core/utils/app_images.dart';
import 'package:flutter/material.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      Assets.imagesProfile1,
      height: 80,
      width: 80,
      fit: BoxFit.cover,
    );
  }
}
