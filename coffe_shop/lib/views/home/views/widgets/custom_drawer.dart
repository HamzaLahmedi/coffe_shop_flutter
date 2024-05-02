import 'package:coffe_shop/core/utils/app_styles.dart';
import 'package:coffe_shop/core/utils/colors.dart';
import 'package:coffe_shop/views/auth/views/sign_in_view.dart';
import 'package:coffe_shop/views/home/views/widgets/cstom_drawer_list_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({
    super.key,
  });

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  signOut(BuildContext context) {
    try {
      FirebaseAuth.instance.signOut();
      print('signed out');
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return const SignInView();
      }));

      // Optionally, you can also navigate to a login screen or perform other actions after sign-out.
    } catch (e) {
      print('Error signing out: $e');
      // Handle the error, show a message, or perform other actions.
    }
  }

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
                signOut(context);
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
