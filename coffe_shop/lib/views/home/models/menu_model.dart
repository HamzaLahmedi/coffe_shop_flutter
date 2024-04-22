import 'package:flutter/material.dart';

class MenuModel {
  final String image, coffeName, price, description;
  final IconData addIcon;

  const MenuModel(
      {required this.addIcon,
      required this.image,
      required this.coffeName,
      required this.price,
      required this.description});
}
