import 'package:coffe_shop/provider/liked_items.dart';
import 'package:coffe_shop/views/home/views/widgets/custom_liked_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomLikedGridView extends StatelessWidget {
  const CustomLikedGridView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    /*final List<int> likedItems =
        ModalRoute.of(context)?.settings.arguments as List<int>? ?? [];
    print(likedItems);
    void removeItem(int index) {
      likedItems.remove(index);
    }*/
    final likedItemsProvider = Provider.of<LikedItems>(context);
    final List<int> likedItems = likedItemsProvider.likedItems.toList();
    return GridView.builder(
        itemCount: likedItems.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          //childAspectRatio: 0.8,
          crossAxisSpacing: 10,
          mainAxisExtent: 210,
          mainAxisSpacing: 10,
        ),
        itemBuilder: (context, index) {
          return CustomLikedItem(
            index: likedItems[index],
            onLike: (index) {
              likedItemsProvider.removeLikedItem(index);
            },
          );
        });
  }
}
