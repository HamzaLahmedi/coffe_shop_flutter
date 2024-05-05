import 'package:coffe_shop/core/utils/app_images.dart';
import 'package:coffe_shop/core/utils/app_styles.dart';
import 'package:coffe_shop/core/utils/colors.dart';
import 'package:coffe_shop/core/widgets/get_data_from_fireStore.dart';
import 'package:coffe_shop/views/auth/controllers/auth.dart';
import 'package:coffe_shop/views/home/views/profile_info_section.dart';
import 'package:coffe_shop/views/home/views/widgets/info_from_firebase_auth.dart';
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
        title: const Text("Profile "),
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            children: [
              Image.asset(
                Assets.imagesProfile1,
                height: 80,
                width: 80,
                fit: BoxFit.cover,
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  'Change Profile Picture',
                  style: AppStyles.styleRegular14.copyWith(
                    color: Colors.grey,
                  ),
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              const Divider(),
              const SizedBox(
                height: 16,
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Profile Information',
                  style: AppStyles.styleBold20.copyWith(
                    color: AppColors.kTextColor,
                  ),
                ),
              ),
              const SizedBox(
                height: 18,
              ),
              ProfileInfoSection(
                title: 'Email',
                value: credintial!.email!,
              ),
              const SizedBox(
                height: 18,
              ),
              ProfileInfoSection(
                title: 'User id',
                value: credintial!.uid,
              ),
              const SizedBox(
                height: 18,
              ),
              ProfileInfoSection(
                title: 'Created date:',
                value: DateFormat.yMMMd()
                    .format(credintial!.metadata.creationTime!),
              ),
              const SizedBox(
                height: 18,
              ),
              ProfileInfoSection(
                title: 'Last Sign in',
                value: DateFormat.yMMMd()
                    .format(credintial!.metadata.lastSignInTime!),
              ),
              const SizedBox(
                height: 18,
              ),
              const Divider(),
              const SizedBox(
                height: 18,
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Personal Information',
                  style: AppStyles.styleBold20.copyWith(
                    color: AppColors.kTextColor,
                  ),
                ),
              ),
              const SizedBox(
                height: 18,
              ),
              GetDataFromFireStore(documentId: credintial!.uid),
              const SizedBox(
                height: 18,
              ),
              const Divider(),
              const SizedBox(
                height: 18,
              ),
              TextButton(
                onPressed: () {},
                child: const Text(
                  'Delete Account',
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 18,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/*class ProfileBeta extends StatelessWidget {
  const ProfileBeta({
    super.key,
    required this.credintial,
  });

  final User? credintial;

  @override
  Widget build(BuildContext context) {
    return Padding(
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
          InfoFromFirebaseAuth(credintial: credintial),
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
    );
  }
}
*/