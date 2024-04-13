import 'package:coffe_shop/views/home/models/navigation_item.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NavigationList {
  static List<NavigationItem> navigationItems = [
    NavigationItem(
      label: 'Home',
      svgIconPath: 'assets/images/home.svg',
    ),
    NavigationItem(
      label: 'Shop',
      svgIconPath: 'assets/images/shop.svg',
    ),
    NavigationItem(
      label: 'Liked',
      svgIconPath: 'assets/images/liked1.svg',
    ),
    NavigationItem(
      label: 'User',
      svgIconPath: 'assets/images/user.svg',
    ),
    // Add more items as needed
  ];

  // Method to map NavigationItem objects to TabItem<dynamic> objects
  /* static List<TabItem<dynamic>> toTabItems() {
    return navigationItems.map((item) {
      return TabItem(
        icon: SvgPicture.asset(item.svgIconPath),
        // title: item.label,
      );
    }).toList();
  }
}*/
  static List<TabItem<dynamic>> toTabItems({
    int activeIndex = 0,
    Color activeColor = Colors.white,
    Color inactiveColor = Colors.black,
    // Set a fixed size of 8 for the icons
  }) {
    return navigationItems.asMap().entries.map((entry) {
      final index = entry.key;
      final item = entry.value;

      // Determine the icon color based on whether the index is active
      final iconColor = (index == activeIndex) ? activeColor : inactiveColor;

      // Create a TabItem with the appropriate icon and title
      return TabItem<dynamic>(
        icon: SvgPicture.asset(
          item.svgIconPath,
          colorFilter: ColorFilter.mode(
            iconColor,
            BlendMode.srcIn,
          ),
          fit: BoxFit.none,
        ),
        //title: item.label,
      );
    }).toList(); // Ensure the list is of type List<TabItem<dynamic>>
  }
}
 /*  static List<TabItem<dynamic>> toTabItems(int activeIndex) {
    return navigationItems.asMap().entries.map((entry) {
      final index = entry.key;
      final item = entry.value;

      // Customize the SVG icon based on the active index
      final double iconSize = index == activeIndex ? 10.0 : 8.0;
      final Color iconColor =
          index == activeIndex ? Colors.white : Colors.black;

      return TabItem(
        icon: SvgPicture.asset(
          item.svgIconPath,
          height: iconSize,
          width: iconSize,
          colorFilter: ColorFilter.mode(
            iconColor,
            BlendMode.srcIn,
          ),
        ),
        title: item.label,
      );
    }).toList();
  }
}*/
