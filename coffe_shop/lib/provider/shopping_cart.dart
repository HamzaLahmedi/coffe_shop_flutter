import 'package:coffe_shop/views/home/models/menu_model.dart';
import 'package:flutter/material.dart';

class ShoppingCart with ChangeNotifier {
  List<MenuModel> selectedProduct = [];
  double price = 0;

  add(MenuModel product) {
    selectedProduct.add(product);
    price = price + double.parse(product.price);
    notifyListeners();
  }

  void incriment(MenuModel product) {
    product.quantity++;
    price = price + double.parse(product.price);
    notifyListeners();
  }

  void decriment(MenuModel product) {
    if (product.quantity > 1) {
      product.quantity--;
      price = price - double.parse(product.price);
      notifyListeners();
    }
  }
}
