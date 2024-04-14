import 'package:coffe_shop/views/home/controller/profile_list.dart';
import 'package:coffe_shop/views/home/views/widgets/custom_profile_list_view_item.dart';
import 'package:flutter/material.dart';

class CustomProfileListView extends StatelessWidget {
  const CustomProfileListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        padding: EdgeInsets.zero,
        itemCount: ProfileList.profileList.length,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 10,
            ),
            child: CustomListViewItem(
              title: ProfileList.profileList[index].title,
              iconPath: ProfileList.profileList[index].iconPath,
            ),
          );
        });
  }
}
