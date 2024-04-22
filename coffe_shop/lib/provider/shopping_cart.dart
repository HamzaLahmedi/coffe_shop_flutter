import 'package:coffe_shop/views/home/models/menu_model.dart';
import 'package:flutter/material.dart';

class ShoppingCart with ChangeNotifier {
  List selectedProduct = [];
  double price = 0;
  add(MenuModel product) {
    selectedProduct.add(product);
    price = price + double.parse(product.price);
    notifyListeners();
  }
}
