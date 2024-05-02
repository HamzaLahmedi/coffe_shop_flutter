import 'package:coffe_shop/core/utils/app_styles.dart';
import 'package:coffe_shop/core/utils/colors.dart';
import 'package:coffe_shop/views/auth/controllers/auth.dart';
import 'package:coffe_shop/views/auth/views/sign_in_view.dart';
import 'package:coffe_shop/views/home/views/widgets/cstom_drawer_list_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  CustomDrawer({
    super.key,
  });
  final AuthController authController = AuthController();
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
          CustomDrawerListView(),
          const Expanded(
            child: SizedBox(
              height: 60,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 26),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.kPrimaryColor,
                foregroundColor: AppColors.kTextColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onPressed: () {
                authController.signOut(context);
              },
              child: const Text('sign out'),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
