import 'package:coffe_shop/core/utils/app_images.dart';
import 'package:coffe_shop/views/home/models/drawer_model.dart';

class DrawerList {
  static List<DrawerModel> drawerList = [
    const DrawerModel(
        title: 'Home', iconPath: Assets.imagesHome, route: '/home'),
     const DrawerModel(title: 'Details', iconPath: Assets.imagesShop,route:'/shop'),
    const DrawerModel(
        title: 'Favorites', iconPath: Assets.imagesLiked1, route: '/liked'),
    const DrawerModel(
        title: 'Profile',
        iconPath: 'assets/images/user.svg',
        route: '/profile'),
  ];
}
