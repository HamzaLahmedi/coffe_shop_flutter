/*import 'package:coffe_shop/core/utils/colors.dart';
import 'package:coffe_shop/provider/dialog_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter/foundation.dart';

Expanded getData(Map<String, dynamic> data, BuildContext context,
      TextEditingController dialogController) {
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
                      "First Name: ${data['firstName']}",
                      style: const TextStyle(
                        fontSize: 17,
                      ),
                    ),
                    IconButton(
                        onPressed: () async {
                          await Provider.of<DialogProvider>(context,
                                  listen: false)
                              .mydialog(
                                  context, data, 'firstName', dialogController);
                          
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
                      "Last Name: ${data['lastName']}",
                      style: const TextStyle(
                        fontSize: 17,
                      ),
                    ),
                    IconButton(
                        onPressed: () async {
                          await Provider.of<DialogProvider>(context,
                                  listen: false)
                              .mydialog(
                                  context, data, 'lastName', dialogController);
                          
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
                      "Email: ${data['email']}",
                      style: const TextStyle(
                        fontSize: 17,
                      ),
                    ),
                    IconButton(
                        onPressed: () async {
                          await Provider.of<DialogProvider>(context,
                                  listen: false)
                              .mydialog(
                                  context, data, 'email', dialogController);
                          
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
                      "Age: ${data['age']}",
                      style: const TextStyle(
                        fontSize: 17,
                      ),
                    ),
                    IconButton(
                        onPressed: () async {
                          await Provider.of<DialogProvider>(context,
                                  listen: false)
                              .mydialog(context, data, 'age', dialogController);
                          
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

*/