/*import 'package:coffe_shop/core/utils/colors.dart';
import 'package:coffe_shop/provider/dialog_provider.dart';
import 'package:coffe_shop/views/home/views/about_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AboutView()));
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
}*/
