import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coffe_shop/views/home/views/about_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class DialogProvider extends ChangeNotifier {
  final formKey = GlobalKey<FormState>();
  Future<void> mydialog(BuildContext context, dynamic data, dynamic key,
      TextEditingController textEditingController) async {
    final credential = FirebaseAuth.instance.currentUser;
    CollectionReference users = FirebaseFirestore.instance.collection('users');

    return showDialog(
      context: context,
      builder: (builder) {
        return Dialog(
          backgroundColor: Colors.black,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(11)),
          child: SizedBox(
            height: 200,
            //MediaQuery.sizeOf(context).height / 2.5,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Form(
                    key: formKey,
                    child: TextFormField(
                      controller: textEditingController,
                      decoration: InputDecoration(
                        hintText: '${data['$key']}',
                        fillColor: Colors.black,
                        filled: true,
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                        onPressed: () {
                          users
                              .doc(credential!.uid)
                              .update({"$key": textEditingController.text});

                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => AboutView(),
                              ));

                          notifyListeners();
                        },
                        child: const Text(
                          'Edit',
                          style: TextStyle(
                            fontSize: 22,
                            //  color: AppColors.kPrimaryColor,
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text(
                          'Cancel',
                          style: TextStyle(
                            fontSize: 22,
                            // color: AppColors.kDescriptionColor,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
