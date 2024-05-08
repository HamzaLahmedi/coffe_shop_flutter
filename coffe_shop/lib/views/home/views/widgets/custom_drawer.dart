import 'package:coffe_shop/core/utils/colors.dart';
import 'package:coffe_shop/core/widgets/get_img_from_fire_store.dart';
import 'package:coffe_shop/core/widgets/get_name_from_fire_store.dart';
import 'package:coffe_shop/views/auth/controllers/auth.dart';
import 'package:coffe_shop/views/home/views/widgets/cstom_drawer_list_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  CustomDrawer({
    super.key,
  });
  final AuthController authController = AuthController();
  //this works if signed in with email
  final user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColors.kBackgroundColor,
      child: Column(
        children: [
          const SizedBox(
            height: 40,
          ),
          const GetImgFromFireStore(),
          const GetFirstNameFromFireStore(),
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
