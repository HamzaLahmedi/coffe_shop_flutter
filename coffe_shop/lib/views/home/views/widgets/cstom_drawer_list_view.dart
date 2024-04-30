import 'package:coffe_shop/views/home/controller/drawer_list.dart';
import 'package:coffe_shop/views/home/views/home_view.dart';
import 'package:coffe_shop/views/home/views/liked_view.dart';
import 'package:coffe_shop/views/home/views/profile_view.dart';
import 'package:coffe_shop/views/home/views/shop_view.dart';
import 'package:coffe_shop/views/home/views/widgets/custom_drawer_item.dart';
import 'package:flutter/material.dart';

class CustomDrawerListView extends StatelessWidget {
  CustomDrawerListView({
    super.key,
  });
  final List<Widget> drawerWidget = [
    HomeView(),
    ShopView(),
    LikedView(),
    ProfileView(),
  ];
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
                /*Navigator.pushNamed(
                    context, DrawerList.drawerList[index].route);*/
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => drawerWidget[index]),
                );
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
