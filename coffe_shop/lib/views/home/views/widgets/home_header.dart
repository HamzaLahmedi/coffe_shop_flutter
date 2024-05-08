import 'package:coffe_shop/core/utils/app_styles.dart';
import 'package:coffe_shop/core/utils/colors.dart';
import 'package:coffe_shop/core/widgets/custom_shopping_icon.dart';
import 'package:coffe_shop/core/widgets/get_name_from_fire_store.dart';
import 'package:coffe_shop/provider/shopping_cart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({
    super.key,
    required this.openDrawer,
    
    this.subtitle,
  });
  final VoidCallback openDrawer;
  
  final String? subtitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Consumer<ShoppingCart>(
          builder: (context, shoppingCartInstance, child) {
            return Row(
              children: [
                IconButton(
                  icon: const Icon(
                    Icons.menu,
                    size: 30,
                    color: Colors.white,
                  ),
                  onPressed: openDrawer,
                ),
                /*CircleAvatar(
            radius: 30,
            // Set the background to the SVG image
            backgroundColor: AppColors.kBackgroundColor,
            child: Image.asset(
              'assets/images/profile1.png',
              //height: 30 * 2,
              // width: 30 * 2,
              //fit: BoxFit.contain,
            ),
          ),*/
                const SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                     const GetFirstNameFromFireStore(),
                    Text(
                      subtitle ?? '',
                      style: const TextStyle(
                        fontWeight: FontWeight.w300,
                        fontSize: 18,
                        color: Color(0xffE3E3E3),
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                CustomShoppingIcon(
                  totalSelectedProducts: shoppingCartInstance.selectedProduct.length
                ),
                Text(
                  '\$ ${shoppingCartInstance.price}',
                  style: const TextStyle(
                    color: AppColors.kTextColor,
                    fontSize: 22,
                  ),
                ),
                /*SvgPicture.asset(
                  'assets/images/search_logo.svg',
                  //height: 30,
                  //width: 30,
                ),*/
                const SizedBox(
                  width: 15,
                ),
                /*SvgPicture.asset(
            'assets/images/notif_logo.svg',
            //height: 30,
            //width: 30,
          ),*/
              ],
            );
          },
        ));
  }
}

