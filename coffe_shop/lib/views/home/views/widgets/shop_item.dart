import 'package:coffe_shop/core/utils/app_images.dart';
import 'package:coffe_shop/core/utils/app_styles.dart';
import 'package:coffe_shop/core/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ShopItem extends StatelessWidget {
  const ShopItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
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
            Assets.imagesRobustaa,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Robusta',
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
                r'$20',
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
                onPressed: () {},
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
            '0',
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
                onPressed: () {},
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
  }
}
