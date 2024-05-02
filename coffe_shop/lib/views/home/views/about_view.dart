import 'package:coffe_shop/core/utils/colors.dart';
import 'package:coffe_shop/views/auth/controllers/auth.dart';
import 'package:coffe_shop/views/auth/views/sign_in_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AboutView extends StatelessWidget {
  AboutView({super.key});
  final AuthController authController = AuthController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton.icon(
            onPressed: () {
              authController.signOut(context);
            },
            label: const Text(
              "logout",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            icon: const Icon(
              Icons.logout,
              color: Colors.white,
            ),
          )
        ],
        // backgroundColor: appbarGreen,
        title: const Text("Profile Page"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(22.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
                child: Container(
              padding: const EdgeInsets.all(11),
              decoration: BoxDecoration(
                  color: AppColors.kPrimaryColor,
                  borderRadius: BorderRadius.circular(11)),
              child: const Text(
                "Info from firebase Auth",
                style: TextStyle(
                  fontSize: 22,
                ),
              ),
            )),
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 11,
                ),
                Text(
                  "Email:       ",
                  style: TextStyle(
                    fontSize: 17,
                  ),
                ),
                SizedBox(
                  height: 11,
                ),
                Text(
                  "Created date:      ",
                  style: TextStyle(
                    fontSize: 17,
                  ),
                ),
                SizedBox(
                  height: 11,
                ),
                Text(
                  "Last Signed In:  ",
                  style: TextStyle(
                    fontSize: 17,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 55,
            ),
            Center(
                child: Container(
                    padding: const EdgeInsets.all(11),
                    decoration: BoxDecoration(
                        color: AppColors.kPrimaryColor,
                        borderRadius: BorderRadius.circular(11)),
                    child: const Text(
                      "Info from firebase firestore",
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ))),
          ],
        ),
      ),
    );
  }
}
