import 'package:coffe_shop/core/widgets/get_img_from_fire_store.dart';
import 'package:coffe_shop/core/widgets/get_name_from_fire_store.dart';
import 'package:coffe_shop/views/home/views/widgets/custom_profile_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ProfileBody extends StatelessWidget {
  const ProfileBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width,
      height: MediaQuery.sizeOf(context).height,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const GetImgFromFireStore(),
          const GetFirstNameFromFireStore(),
          CustomProfileListView()
        ],
      ),
    );
  }
}
