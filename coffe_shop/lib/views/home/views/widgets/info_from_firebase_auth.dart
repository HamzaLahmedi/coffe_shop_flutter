
import 'package:coffe_shop/core/utils/colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class InfoFromFirebaseAuth extends StatelessWidget {
  const InfoFromFirebaseAuth({
    super.key,
    required this.credintial,
  });

  final User? credintial;

  @override
  Widget build(BuildContext context) {
    return Column(
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
    );
  }
}