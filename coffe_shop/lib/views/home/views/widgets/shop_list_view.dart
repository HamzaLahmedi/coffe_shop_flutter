import 'package:coffe_shop/core/utils/colors.dart';
import 'package:coffe_shop/provider/shopping_cart.dart';
import 'package:coffe_shop/views/home/views/widgets/shop_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class ShopListView extends StatelessWidget {
  const ShopListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final length = Provider.of<ShoppingCart>(context).selectedProduct.length;
    final selectedProduct = Provider.of<ShoppingCart>(context).selectedProduct;
    return Consumer<ShoppingCart>(builder: (context, cart, child) {
      return ListView.builder(
        itemCount: length,
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
                    onPressed: (context) {
                      cart.delete(selectedProduct[index]);
                    },
                    backgroundColor: AppColors.kBackgroundColor,
                    icon: FontAwesomeIcons.trashCan,
                  )
                ],
              ),
              child: ShopItem(
                menuModel: selectedProduct[index],
              ),
            ),
          );
        });
    });
  }
}
