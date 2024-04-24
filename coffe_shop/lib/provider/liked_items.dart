import 'package:flutter/material.dart';

class LikedItems with ChangeNotifier {
  final Set<int> likedItems = {};
  void addLikedItem(int index) {
    likedItems.add(index);
    notifyListeners();
  }
  void removeLikedItem(int index) {
    likedItems.remove(index);
    notifyListeners();
  }
}