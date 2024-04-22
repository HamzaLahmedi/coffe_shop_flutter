import 'package:coffe_shop/views/home/controller/menu_list.dart';
import 'package:coffe_shop/views/home/views/home_view.dart';
import 'package:coffe_shop/views/home/views/liked_view.dart';
import 'package:coffe_shop/views/home/views/widgets/custom_grid_view_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomGridView extends StatelessWidget {
  final Set<int> likedIndices = {};
  CustomGridView({
    super.key,
  });
  void handleLikeChanged(int index, bool isLiked) {
    if (isLiked) {
      likedIndices.add(index); // Add the index of the liked item
      print('Liked item: ${MenuList.menulist[index]}');
      print('Total liked items count: ${likedIndices.length}');
    } else {
      likedIndices.remove(index); // Remove the index if unliked
      print('Unliked item: ${MenuList.menulist[index]}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          //childAspectRatio: 0.8,
          crossAxisSpacing: 10,
          mainAxisExtent: 210,
          mainAxisSpacing: 10,
        ),
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, '/liked',
                  arguments: likedIndices.toList());
            },
            child: CustomGridViewItem(
              index: index,
              onLike: handleLikeChanged,
            ),
          );
        },
        padding: EdgeInsets.zero,
        itemCount: MenuList.menulist.length,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
      ),
    );
  }
}
