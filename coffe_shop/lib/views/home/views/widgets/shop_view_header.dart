import 'package:coffe_shop/core/utils/app_styles.dart';
import 'package:coffe_shop/core/utils/colors.dart';
import 'package:coffe_shop/provider/shopping_cart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ShopViewHeader extends StatelessWidget {
  const ShopViewHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ShoppingCart>(builder: (context, cart, child) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'My Order',
            style: AppStyles.styleSemiBold24,
          ),
          RichText(
            text: TextSpan(
              text: 'You have ${cart.selectedProduct.length} ',
              style: AppStyles.styleSemiBold24.copyWith(
                fontSize: 11,
                // Set the default color for the text
              ),
              children: <TextSpan>[
                TextSpan(
                  text: 'items',
                  style: AppStyles.styleSemiBold24.copyWith(
                    fontSize: 11,
                    color: AppColors.kPrimaryColor,
                    // Set the default color for the text
                  ),
                ),
                TextSpan(
                  text: ' in your cart',
                  style: AppStyles.styleSemiBold24.copyWith(
                    fontSize: 11,

                    // Set the default color for the text
                  ),
                ),
              ],
            ),
          ),
        ],
      );
    });
  }
}
