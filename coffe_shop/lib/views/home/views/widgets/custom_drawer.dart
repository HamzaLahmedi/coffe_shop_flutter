import 'package:coffe_shop/core/utils/app_styles.dart';
import 'package:coffe_shop/core/utils/colors.dart';
import 'package:coffe_shop/views/home/views/widgets/cstom_drawer_list_view.dart';
import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColors.kBackgroundColor,
      child: Column(
        children: [
          const SizedBox(
            height: 40,
          ),
          CircleAvatar(
            radius: 30,
            // Set the background to the SVG image
            backgroundColor: AppColors.kBackgroundColor,
            child: Image.asset(
              'assets/images/profile1.png',
              //height: 30 * 2,
              // width: 30 * 2,
              //fit: BoxFit.contain,
            ),
          ),
          Text(
            'Shahzaib',
            style: AppStyles.styleSemiBold24.copyWith(
              fontSize: 22,
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          const CustomDrawerListView()
        ],
      ),
    );
  }
}
