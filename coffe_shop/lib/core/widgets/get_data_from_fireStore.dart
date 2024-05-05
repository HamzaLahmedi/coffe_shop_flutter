import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coffe_shop/core/widgets/get_update_profile_data.dart';
import 'package:coffe_shop/provider/dialog_provider.dart';
import 'package:coffe_shop/views/home/views/about_view.dart';
import 'package:coffe_shop/views/home/views/profile_info_section.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GetDataFromFireStore extends StatefulWidget {
  final String documentId;

  const GetDataFromFireStore({super.key, required this.documentId});

  @override
  State<GetDataFromFireStore> createState() => _GetDataFromFireStoreState();
}

class _GetDataFromFireStoreState extends State<GetDataFromFireStore> {
  @override
  Widget build(BuildContext context) {
    //CollectionReference users = FirebaseFirestore.instance.collection('users');
    final TextEditingController dialogController = TextEditingController();
    return FutureBuilder<DocumentSnapshot>(
      future: FirebaseFirestore.instance
          .collection('users')
          .doc(widget.documentId)
          .get(),
      builder:
          (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        if (snapshot.hasError) {
          return const Text("Something went wrong");
        }

        if (snapshot.hasData && !snapshot.data!.exists) {
          return const Text("Document does not exist");
        }

        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data =
              snapshot.data!.data() as Map<String, dynamic>;
          return PersonalInfo(
            data: data,
            textEditingController: dialogController,
          );
          /*GetAndUpdateData(
            data: data,
            textEditingController: dialogController,
          );*/
        }

        return const Text("loading");
      },
    );
  }
}

class PersonalInfo extends StatelessWidget {
  const PersonalInfo({
    super.key,
    required this.data,
    required this.textEditingController,
  });

  final Map<String, dynamic> data;
  final TextEditingController textEditingController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ProfileInfoSection(
          title: 'First Name',
          value: data['firstName'],
          onTap: () {
            Provider.of<DialogProvider>(context, listen: false)
                .mydialog(context, data, 'firstName', textEditingController);
          },
        ),
        const SizedBox(
          height: 18,
        ),
        ProfileInfoSection(
          title: 'Last Name',
          value: data['lastName'],
          onTap: () {
            Provider.of<DialogProvider>(context, listen: false)
                .mydialog(context, data, 'lastName', textEditingController);
          },
        ),
        const SizedBox(
          height: 18,
        ),
        ProfileInfoSection(
          title: 'Email',
          value: data['email'],
          onTap: () {
            Provider.of<DialogProvider>(context, listen: false)
                .mydialog(context, data, 'email', textEditingController);
          },
        ),
        const SizedBox(
          height: 18,
        ),
        ProfileInfoSection(
          title: 'Age',
          value: data['age'],
          onTap: () {
            Provider.of<DialogProvider>(context, listen: false)
                .mydialog(context, data, 'age', textEditingController);
          },
        ),
      ],
    );
  }
}

//it updates on hot reload but works in navigation



//final credential = FirebaseAuth.instance.currentUser;
// Method for dialog and update the data works without provider
/*mydialog(data,dynamic key) {
    return showDialog(
        context: context,
        builder: (builder) {
          return Dialog(
            backgroundColor: Colors.black,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(11)),
            child: Container(
              height: 200,
              //MediaQuery.sizeOf(context).height / 2.5,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Form(
                      child: TextField(
                        controller: dialogFirstNameController,
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
                            users.doc(credential!.uid).update(
                                {"$key": dialogFirstNameController.text});

                            setState(() {
                              Navigator.pop(context);
                            });
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
        });
  }*/