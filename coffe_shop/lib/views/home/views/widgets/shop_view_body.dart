import 'package:coffe_shop/core/utils/app_styles.dart';
import 'package:coffe_shop/core/utils/colors.dart';
import 'package:coffe_shop/provider/shopping_cart.dart';
import 'package:coffe_shop/views/home/views/widgets/shop_list_view.dart';
import 'package:coffe_shop/views/home/views/widgets/shop_view_header.dart';
import 'package:coffe_shop/views/onBoarding_view/views/widgets/custom_transparant_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ShopViewBody extends StatelessWidget {
  const ShopViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const ShopViewHeader(),
            const SizedBox(
              height: 10,
            ),
            const ShopListView(),
            const SizedBox(
              height: 10,
            ),
           const ShopFooter(),
            const SizedBox(
              height: 15,
            ),
            CustomTransparentButton(
              title: 'Finalize Order',
              height: MediaQuery.sizeOf(context).height * 0.07,
              width: MediaQuery.sizeOf(context).width * 1,
            ),
          ],
        ),
      ),
    );
  }
}

class ShopFooter extends StatelessWidget {
  const ShopFooter({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<ShoppingCart>(builder: (context, cart, child) {
      return Container(
        height: MediaQuery.sizeOf(context).height / 5,
        width: MediaQuery.sizeOf(context).width / 0.5,
        decoration: BoxDecoration(
          color: AppColors.kPrimaryColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              'Total',
              style: AppStyles.styleSemiBold24.copyWith(),
            ),
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 6),
              child: Row(
                children: [
                  Text(
                    'subtotal ...........................................................................',
                    style: AppStyles.styleRegular14.copyWith(
                      color: AppColors.kDescriptionColor,
                    ),
                  ),
                  Text(
                    '\$ ${cart.price.toString()}',
                    style: AppStyles.styleSemiBold24.copyWith(
                      fontSize: 13,
                      color: AppColors.kBackgroundColor,
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 6),
              child: Row(
                children: [
                  Text(
                    'Shipping ...........................................................................',
                    style: AppStyles.styleRegular14.copyWith(
                      color: AppColors.kDescriptionColor,
                    ),
                  ),
                  Text(
                    r'$6',
                    style: AppStyles.styleSemiBold24.copyWith(
                      fontSize: 13,
                      color: AppColors.kBackgroundColor,
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 6),
              child: Row(
                children: [
                  Text(
                    'Total ....................................................................................',
                    style: AppStyles.styleRegular14.copyWith(
                      color: AppColors.kDescriptionColor,
                    ),
                  ),
                  Text(
                    cart.price > 0 ? '\$ ${cart.price + 6}' : '\$ 0',
                    style: AppStyles.styleSemiBold24.copyWith(
                      fontSize: 13,
                      color: AppColors.kBackgroundColor,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      );
    });
  }
}
