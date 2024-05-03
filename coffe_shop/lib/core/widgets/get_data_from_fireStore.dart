import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coffe_shop/core/utils/colors.dart';
import 'package:flutter/material.dart';

class GetDataFromFireStore extends StatelessWidget {
  final String documentId;

  const GetDataFromFireStore({super.key, required this.documentId});

  @override
  Widget build(BuildContext context) {
    CollectionReference users = FirebaseFirestore.instance.collection('users');

    return FutureBuilder<DocumentSnapshot>(
      future: users.doc(documentId).get(),
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
          return InfoFromFirebaseStore(data: data);
        }

        return const Text("loading");
      },
    );
  }
}

class InfoFromFirebaseStore extends StatelessWidget {
  const InfoFromFirebaseStore({
    super.key,
    required this.data,
  });

  final Map<String, dynamic> data;

  @override
  Widget build(BuildContext context) {
    return Column(
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
                  "First Name: ${data['firstName']}",
                  style: const TextStyle(
                    fontSize: 17,
                  ),
                ),
                IconButton(
                    onPressed: () {}, icon: const Icon(Icons.edit)),
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
                  "Last Name: ${data['lastName']}",
                  style: const TextStyle(
                    fontSize: 17,
                  ),
                ),
                IconButton(
                    onPressed: () {}, icon: const Icon(Icons.edit)),
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
                  "Email: ${data['email']}",
                  style: const TextStyle(
                    fontSize: 17,
                  ),
                ),
                IconButton(
                    onPressed: () {}, icon: const Icon(Icons.edit)),
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
                  "Age: ${data['age']}",
                  style: const TextStyle(
                    fontSize: 17,
                  ),
                ),
                IconButton(
                    onPressed: () {}, icon: const Icon(Icons.edit)),
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 11,
        ),
      ],
    );
  }
}
