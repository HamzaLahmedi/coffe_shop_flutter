import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coffe_shop/core/utils/app_styles.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class GetFirstNameFromFireStore extends StatefulWidget {
  const GetFirstNameFromFireStore({
    super.key,
  });

  @override
  State<GetFirstNameFromFireStore> createState() =>
      _GetFirstNameFromFireStoreState();
}

class _GetFirstNameFromFireStoreState extends State<GetFirstNameFromFireStore> {
  @override
  Widget build(BuildContext context) {
    //CollectionReference users = 
    FirebaseFirestore.instance.collection('users');
    final credential = FirebaseAuth.instance.currentUser;

    return FutureBuilder<DocumentSnapshot>(
      future: FirebaseFirestore.instance
          .collection('users')
          .doc(credential!.uid)
          .get(),
      builder:
          (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        if (snapshot.hasError) {
          return const Text("Something went wrong");
        }

        if (snapshot.hasData && !snapshot.data!.exists) {
          return Text(
              //user.displayName!,
              'Shahzaib',
              style: AppStyles.styleSemiBold24.copyWith(
                fontSize: 22,
              ));
        }

        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data =
              snapshot.data!.data() as Map<String, dynamic>;
          return Text(
              //user.displayName!,
              data['firstName'],
              style: AppStyles.styleSemiBold24.copyWith(
                fontSize: 22,
              ));
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
