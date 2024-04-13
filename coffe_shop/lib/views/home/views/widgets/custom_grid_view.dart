import 'package:coffe_shop/views/home/controller/menu_list.dart';
import 'package:coffe_shop/views/home/views/widgets/custom_grid_view_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomGridView extends StatelessWidget {
  const CustomGridView({
    super.key,
  });

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
          return CustomGridViewItem(
            index: index,
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
