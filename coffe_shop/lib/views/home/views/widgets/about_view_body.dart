import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coffe_shop/core/utils/app_styles.dart';
import 'package:coffe_shop/core/utils/colors.dart';
import 'package:coffe_shop/core/utils/upload_img.dart';
import 'package:coffe_shop/core/widgets/get_data_from_fire_store.dart';
import 'package:coffe_shop/core/widgets/get_img_from_fire_store.dart';
import 'package:coffe_shop/views/auth/controllers/auth.dart';
import 'package:coffe_shop/views/auth/views/sign_in_view.dart';
import 'package:coffe_shop/views/home/views/about_view.dart';
import 'package:coffe_shop/views/home/views/profile_info_section.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:path/path.dart' show basename;

class AboutViewBody extends StatefulWidget {
  const AboutViewBody({super.key});

  @override
  State<AboutViewBody> createState() => _AboutViewBodyState();
}

class _AboutViewBodyState extends State<AboutViewBody> {
  final CollectionReference users =
      FirebaseFirestore.instance.collection('users');

  final AuthController authController = AuthController();

  final credintial = FirebaseAuth.instance.currentUser;

  File? imgPath;

  String? imgName;

  final UploadImg uploadImg = UploadImg();

  showModal() {
    return showBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Container(
            height: 100,
            color: Colors.black,
            child: Column(
              children: [
                GestureDetector(
                  onTap: () async {
                    final newImgPath =
                        await uploadImg.uploadImage(ImageSource.camera);

                    if (newImgPath != null) {
                      setState(() {
                        imgPath = newImgPath;

                        imgName = basename(newImgPath.path);
                      });
                      final storageRef =
                          FirebaseStorage.instance.ref('users-imgs/$imgName');

                      await storageRef.putFile(imgPath!);
                      // Get img url
                      String url = await storageRef.getDownloadURL();

                      users.doc(credintial!.uid).update({
                        "imgUrl": url,
                      });
                      if (!context.mounted) return;
                      Navigator.pop(context);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const AboutView()));
                    }
                  },
                  child: const Row(
                    children: [
                      Icon(
                        Icons.camera_alt,
                      ),
                      Text(
                        'From Camera',
                        style: TextStyle(
                          fontSize: 22,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                GestureDetector(
                  onTap: () async {
                    final newImgPath =
                        await uploadImg.uploadImage(ImageSource.gallery);
                    if (newImgPath != null) {
                      setState(() {
                        imgPath = newImgPath;

                        imgName = basename(newImgPath.path);
                      });
                      final storageRef =
                          FirebaseStorage.instance.ref('users-imgs/$imgName');

                      await storageRef.putFile(imgPath!);
                      // Get img url
                      String url = await storageRef.getDownloadURL();

                      users.doc(credintial!.uid).update({
                        "imgUrl": url,
                      });
                      if (!context.mounted) return;
                      Navigator.pop(context);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const AboutView()));
                    }
                  },
                  child: const Row(
                    children: [
                      Icon(
                        Icons.photo_outlined,
                      ),
                      Text(
                        'From Gallery',
                        style: TextStyle(
                          fontSize: 22,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            Stack(
              children: [
                const GetImgFromFireStore(),
                Positioned(
                  bottom: -10,
                  left: 80,
                  child: IconButton(
                    onPressed: () {
                      showModal();
                    },
                    icon: const Icon(Icons.add_a_photo),
                  ),
                ),
              ],
            ),
            /*Image.asset(
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
              ),*/
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
              value:
                  DateFormat.yMMMd().format(credintial!.metadata.creationTime!),
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
              onPressed: () {
                users.doc(credintial!.uid).delete();
                credintial!.delete();
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) {
                  return const SignInView();
                }));
              },
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
    );
  }
}
