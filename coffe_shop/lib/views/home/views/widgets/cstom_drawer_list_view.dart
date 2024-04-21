import 'package:coffe_shop/views/home/controller/drawer_list.dart';
import 'package:coffe_shop/views/home/views/widgets/custom_drawer_item.dart';
import 'package:flutter/material.dart';

class CustomDrawerListView extends StatelessWidget {
  const CustomDrawerListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        padding: EdgeInsets.zero,
        itemCount: DrawerList.drawerList.length,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 10,
            ),
            child: GestureDetector(
              onTap: () {
                Navigator.pushNamed(
                    context, DrawerList.drawerList[index].route);
              },
              child: CustomDrawerItem(
                title: DrawerList.drawerList[index].title,
                iconPath: DrawerList.drawerList[index].iconPath,
              ),
            ),
          );
        });
  }
}
