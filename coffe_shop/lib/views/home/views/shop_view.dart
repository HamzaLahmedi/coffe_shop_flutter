import 'package:coffe_shop/core/utils/app_styles.dart';
import 'package:coffe_shop/core/utils/colors.dart';
import 'package:coffe_shop/core/widgets/custom_shopping_icon.dart';
import 'package:coffe_shop/provider/shopping_cart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ShopView extends StatelessWidget {
  const ShopView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Shop',
          style: AppStyles.styleBold20.copyWith(
            fontSize: 22,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: AppColors.kBackgroundColor,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: AppColors.kPrimaryColor,
          ),
          onPressed: () {
            Navigator.pushNamed(context, '/home');
          },
        ),
        actions: [
          Consumer<ShoppingCart>(
            builder: (context, cart, child) {
              return Row(
                children: [
                  CustomShoppingIcon(
                    totalSelectedProducts: cart.selectedProduct.length,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: Text(
                      '\$ ${cart.price}',
                      style: const TextStyle(
                        color: AppColors.kTextColor,
                        fontSize: 22,
                      ),
                    ),
                  )
                ],
              );
            },
          )
        ],
      ),
    );
  }
}
