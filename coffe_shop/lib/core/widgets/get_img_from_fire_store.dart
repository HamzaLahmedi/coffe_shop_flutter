
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class GetImgFromFireStore extends StatefulWidget {
  

  const GetImgFromFireStore({super.key, });

  @override
  State<GetImgFromFireStore> createState() => _GetImgFromFireStoreState();
}

class _GetImgFromFireStoreState extends State<GetImgFromFireStore> {
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
          return const CircleAvatar(
            radius: 60,
            // Set the background to the SVG image
            //backgroundColor: AppColors.kBackgroundColor
            backgroundImage: AssetImage('assets/images/avatar.png'),
          );
        }

        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data =
              snapshot.data!.data() as Map<String, dynamic>;
          return CircleAvatar(
            radius: 60,
            // Set the background to the SVG image
            //backgroundColor: AppColors.kBackgroundColor
            backgroundImage: NetworkImage(data['imgUrl']),
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
