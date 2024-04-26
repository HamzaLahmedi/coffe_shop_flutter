import 'package:coffe_shop/core/utils/colors.dart';
import 'package:coffe_shop/views/home/views/widgets/shop_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ShopListView extends StatelessWidget {
  const ShopListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 13,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 4),
            child: Slidable(
              endActionPane: ActionPane(
                motion: const ScrollMotion(),
                children: [
                  SlidableAction(
                    onPressed: (context) {},
                    backgroundColor: AppColors.kBackgroundColor,
                    icon: FontAwesomeIcons.trashCan,
                  )
                ],
              ),
              child: const ShopItem(),
            ),
          );
        });
  }
}
