import 'package:coffe_shop/core/utils/app_styles.dart';
import 'package:coffe_shop/core/utils/colors.dart';
import 'package:coffe_shop/core/widgets/custom_app_bar.dart';
import 'package:coffe_shop/views/home/controller/menu_list.dart';
import 'package:coffe_shop/views/home/views/widgets/custom_grid_view_item.dart';
import 'package:coffe_shop/views/home/views/widgets/custom_liked_item.dart';
import 'package:flutter/material.dart';

class LikedView extends StatelessWidget {
  const LikedView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Retrieve the list of liked indices from the arguments
    final List<int>? likedIndices =
        ModalRoute.of(context)?.settings.arguments as List<int>?;

    if (likedIndices == null || likedIndices.isEmpty) {
      // No items liked
      return Scaffold(
        backgroundColor: AppColors.kBackgroundColor,
        appBar: customAppBar(
          title: 'Favorite',
          onPressed: () => Navigator.pop(context),
        ),
        body: Center(
          child: Text(
            'No items liked',
            style: AppStyles.styleSemiBold24.copyWith(fontSize: 18),
          ),
        ),
      );
    }
    void removeLikedItem(int index) {
      likedIndices.remove(index);
      // Refresh the view if necessary, you can use a state management solution for this
      // For example, using a stateful widget or state management library
      Navigator.popAndPushNamed(context, '/liked', arguments: likedIndices);
    }

    // Display the liked items in a grid view
    return Scaffold(
      backgroundColor: AppColors.kBackgroundColor,
      appBar: customAppBar(
        title: 'Favorite',
        onPressed: () => Navigator.pop(context),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            mainAxisExtent: 210,
          ),
          itemCount: likedIndices.length,
          itemBuilder: (context, index) {
            // Get the index of the liked item from the likedIndices list
            final int likedIndex = likedIndices[index];

            return CustomLikedGridViewItem(
              isLiked: true,
              onLike: removeLikedItem,
              index: likedIndex,
              // You can define any additional parameters for CustomGridViewItem if needed
            );
          },
          padding: EdgeInsets.zero,
          shrinkWrap: true,
        ),
      ),
    );
  }
}
