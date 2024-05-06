import 'dart:io';

import 'package:coffe_shop/core/utils/app_images.dart';
import 'package:coffe_shop/core/utils/app_styles.dart';
import 'package:coffe_shop/core/utils/snackbar.dart';
import 'package:coffe_shop/core/utils/upload_img.dart';
import 'package:coffe_shop/core/widgets/custom_button.dart';
import 'package:coffe_shop/views/auth/controllers/auth.dart';
import 'package:coffe_shop/views/auth/views/sign_in_view.dart';
import 'package:coffe_shop/views/auth/views/widgets/bottom_text.dart';
import 'package:coffe_shop/views/auth/views/widgets/register_fields_section.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' show basename;

class RegisterBody extends StatefulWidget {
  const RegisterBody({
    super.key,
  });

  @override
  State<RegisterBody> createState() => _RegisterBodyState();
}

class _RegisterBodyState extends State<RegisterBody> {
  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  final TextEditingController firstNameController = TextEditingController();

  final TextEditingController lastNameController = TextEditingController();

  final TextEditingController ageController = TextEditingController();

  final AuthController registerController = AuthController();

  final formKey = GlobalKey<FormState>();
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
                      Navigator.pop(context);
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
                      Navigator.pop(context);
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

  /*uploadImage(ImageSource source) async {
    final pickedImg = await ImagePicker().pickImage(source: source);
    try {
      if (pickedImg != null) {
        setState(() {
          imgPath = File(pickedImg.path);
        });
      } else {
        print("NO img selected");
      }
    } catch (e) {
      print("Error => $e");
    }
  }*/

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const AlwaysScrollableScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: SizedBox(
          height: MediaQuery.sizeOf(context).height,
          width: MediaQuery.sizeOf(context).width,
          child: Column(
            children: [
              const SizedBox(
                height: 60,
              ),
              const Text(
                'Register your Account',
                style: AppStyles.styleSemiBold24,
              ),
              const SizedBox(
                height: 20,
              ),
              Stack(
                children: [
                  imgPath == null
                      ? const CircleAvatar(
                          radius: 60,
                          // Set the background to the SVG image
                          backgroundColor: Colors.black,
                          backgroundImage:
                              AssetImage('assets/images/avatar.png'),
                        )
                      : ClipOval(
                          child: imgPath == null
                              ? Image.asset(Assets.imagesProfile1)
                              : Image.file(
                                  imgPath!,
                                  width: 145,
                                  height: 145,
                                  fit: BoxFit.cover,
                                ),
                        ),
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
              /*const SignInHeader(
                title: 'Register your Account',
              ),*/
              const SizedBox(
                height: 20,
              ),
              Form(
                key: formKey,
                child: RegisterFieldsSection(
                  emailController: emailController,
                  passwordController: passwordController,
                  firstNameController: firstNameController,
                  lastNameController: lastNameController,
                  ageController: ageController,
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              CustomButton(
                title: 'Register',
                height: MediaQuery.sizeOf(context).height * 0.085,
                width: MediaQuery.sizeOf(context).width,
                onPressed: () async {
                  if (formKey.currentState!.validate()) {
                    await registerController.userRegister(
                      emailController.text,
                      passwordController.text,
                      firstNameController.text,
                      lastNameController.text,
                      ageController.text,
                      imgPath!,
                      imgName!,
                      context,
                    );
                    // Now, the registration is complete, you can upload the image
                    
                  } else {
                    showSnackBar(context, 'Respect Authentication Rules');
                  }
                },
              ),
              const SizedBox(
                height: 25,
              ),
              /*const DividerSection(
                text: 'Or Register with',
              ),
              const SizedBox(
                height: 25,
              ),*/
              //const CustomSocialicons(),
              const SizedBox(
                height: 20,
              ),
              BottomText(
                text: 'Login',
                onPressed: () {
                  // Navigator.pushNamed(context, '/register');
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SignInView()));
                },
              ),
              const Expanded(
                child: SizedBox(
                  height: 50,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
