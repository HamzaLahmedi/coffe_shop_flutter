import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coffe_shop/core/utils/colors.dart';
import 'package:coffe_shop/provider/dialog_provider.dart';
import 'package:coffe_shop/views/auth/views/widgets/text_form_field.dart';
import 'package:coffe_shop/views/home/views/about_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
          return GetAndUpdateData(
            data: data,
            textEditingController: dialogController,
          );
        }

        return const Text("loading");
      },
    );
  }
}

//it updates on hot reload but works in navigation
class GetAndUpdateData extends StatefulWidget {
  const GetAndUpdateData({
    super.key,
    required this.data,
    required this.textEditingController,
  });

  final Map<String, dynamic> data;
  final TextEditingController textEditingController;

  @override
  State<GetAndUpdateData> createState() => _GetAndUpdateDataState();
}

class _GetAndUpdateDataState extends State<GetAndUpdateData> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              height: 11,
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(3),
                color: AppColors.kPrimaryColor,
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "First Name: ${widget.data['firstName']}",
                      style: const TextStyle(
                        fontSize: 17,
                      ),
                    ),
                    IconButton(
                        onPressed: () async {
                          await Provider.of<DialogProvider>(context,
                                  listen: false)
                              .mydialog(context, widget.data, 'firstName',
                                  widget.textEditingController);
                          //not best practice but good for now
                          /*Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AboutView()));*/
                        },
                        icon: const Icon(Icons.edit)),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 11,
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(3),
                color: AppColors.kPrimaryColor,
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Last Name: ${widget.data['lastName']}",
                      style: const TextStyle(
                        fontSize: 17,
                      ),
                    ),
                    IconButton(
                        onPressed: () async {
                          /* await Provider.of<DialogProvider>(context,
                                  listen: false)
                              .mydialog(context, data, 'lastName',
                                  dialogController);
                          setState(() {});*/
                        },
                        icon: const Icon(Icons.edit)),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 11,
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(3),
                color: AppColors.kPrimaryColor,
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Email: ${widget.data['email']}",
                      style: const TextStyle(
                        fontSize: 17,
                      ),
                    ),
                    IconButton(
                        onPressed: () async {
                          /* await Provider.of<DialogProvider>(context,
                                  listen: false)
                              .mydialog(context, data, 'email',
                                  dialogController);
                          setState(() {});*/
                        },
                        icon: const Icon(Icons.edit)),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 11,
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(3),
                color: AppColors.kPrimaryColor,
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Age: ${widget.data['age']}",
                      style: const TextStyle(
                        fontSize: 17,
                      ),
                    ),
                    IconButton(
                        onPressed: () async {
                          /* await Provider.of<DialogProvider>(context,
                                  listen: false)
                              .mydialog(context, data, 'age',
                                  dialogController);
                          setState(() {});*/
                        },
                        icon: const Icon(Icons.edit)),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 11,
            ),
          ],
        ),
      ),
    );
  }
}
