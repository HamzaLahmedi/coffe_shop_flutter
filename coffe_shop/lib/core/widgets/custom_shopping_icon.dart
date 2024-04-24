import 'package:coffe_shop/core/utils/colors.dart';
import 'package:flutter/material.dart';

class CustomShoppingIcon extends StatelessWidget {
  const CustomShoppingIcon({
    super.key, required this.totalSelectedProducts,
  });
final int totalSelectedProducts ;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding: const EdgeInsets.all(5),
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.kPrimaryColor,
          ),
          child: Text(
            '$totalSelectedProducts',
            style: const TextStyle(
              fontSize: 12,
            ),
          ),
        ),
        IconButton(
            onPressed: () {
              Navigator.popAndPushNamed(context, '/shop');
            },
            icon: const Icon(
              Icons.shopping_cart_outlined,
              color: Colors.white,
            )),
      ],
    );
  }
}
