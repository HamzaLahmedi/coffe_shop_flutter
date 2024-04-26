import 'package:flutter/material.dart';

class MenuModel {
  final String image, coffeName, price, description;
  final IconData addIcon;
  int quantity;
   MenuModel(
    
      {
        required this.quantity,
        
        required this.addIcon,
      required this.image,
      required this.coffeName,
      required this.price,
      required this.description});
}
