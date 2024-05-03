import 'package:coffe_shop/core/utils/colors.dart';
import 'package:coffe_shop/core/widgets/get_data_from_fireStore.dart';
import 'package:coffe_shop/views/auth/controllers/auth.dart';
import 'package:coffe_shop/views/auth/views/sign_in_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AboutView extends StatelessWidget {
  AboutView({super.key});
  final AuthController authController = AuthController();
  final credintial = FirebaseAuth.instance.currentUser;
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
          //mainAxisAlignment: MainAxisAlignment.start,
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
            Column(
              //mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 11,
                ),
                Container(
                  height: 45,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(3),
                    color: AppColors.kPrimaryColor,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Row(
                      children: [
                        Text(
                          "Email:${credintial!.email}",
                          style: const TextStyle(
                            fontSize: 17,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 11,
                ),
                Container(
                  height: 45,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(3),
                    color: AppColors.kPrimaryColor,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Row(
                      children: [
                        Text(
                          "Created date:${DateFormat.yMMMd().format(credintial!.metadata.creationTime!)}      ",
                          style: const TextStyle(
                            fontSize: 17,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 11,
                ),
                Container(
                  height: 45,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(3),
                    color: AppColors.kPrimaryColor,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Row(
                      children: [
                        Text(
                          "Last Signed In:${DateFormat.yMMMd().format(credintial!.metadata.lastSignInTime!)}  ",
                          style: const TextStyle(
                            fontSize: 17,
                          ),
                        ),
                      ],
                    ),
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
                ),
              ),
            ),
            GetDataFromFireStore(documentId: credintial!.uid),
          ],
        ),
      ),
    );
  }
}
