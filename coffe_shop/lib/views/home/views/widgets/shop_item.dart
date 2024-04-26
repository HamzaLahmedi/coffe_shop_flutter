import 'package:coffe_shop/core/utils/app_images.dart';
import 'package:coffe_shop/core/utils/app_styles.dart';
import 'package:coffe_shop/core/utils/colors.dart';
import 'package:coffe_shop/provider/shopping_cart.dart';
import 'package:coffe_shop/views/home/models/menu_model.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class ShopItem extends StatelessWidget {
  const ShopItem({
    super.key,
    required this.menuModel,
  });
  final MenuModel menuModel;

  @override
  Widget build(BuildContext context) {
    return Consumer<ShoppingCart>(builder: (context, cart, child) {
      return Container(
        height: MediaQuery.sizeOf(context).height / 7,
        width: MediaQuery.sizeOf(context).width / 0.5,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppColors.kPrimaryColor,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          //mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              menuModel.image,
              height: 100,
              width: 100,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  menuModel.coffeName,
                  style: AppStyles.styleBold20.copyWith(
                    fontSize: 16,
                    color: AppColors.kTextColor,
                  ),
                ),
                const SizedBox(
                  height: 6,
                ),
                Text(
                  'With Milk',
                  style: AppStyles.styleSemiBold24.copyWith(
                    fontSize: 10,
                    color: AppColors.kBackgroundColor,
                  ),
                ),
                const SizedBox(
                  height: 6,
                ),
                Text(
                  '\$ ${menuModel.price}',
                  style: AppStyles.styleSemiBold24.copyWith(
                    fontSize: 14,
                    color: AppColors.kDescriptionColor,
                  ),
                ),
              ],
            ),
            const SizedBox(
              width: 100,
            ),
            Container(
              height: 31,
              width: 31,
              decoration: BoxDecoration(
                color: AppColors.kBackgroundColor,
                borderRadius: BorderRadius.circular(3),
              ),
              child: Center(
                child: IconButton(
                  onPressed: () {
                    cart.incriment(menuModel);
                  },
                  icon: const Icon(
                    FontAwesomeIcons.plus,
                    size: 16,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              menuModel.quantity.toString(),
              style: AppStyles.styleSemiBold24.copyWith(
                fontSize: 16,
                color: AppColors.kTextColor,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Container(
              height: 31,
              width: 31,
              decoration: BoxDecoration(
                color: AppColors.kBackgroundColor,
                borderRadius: BorderRadius.circular(3),
              ),
              child: Center(
                child: IconButton(
                  onPressed: () {
                    cart.decriment(menuModel);
                  },
                  icon: const Icon(
                    FontAwesomeIcons.minus,
                    size: 16,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    });
  }
}
