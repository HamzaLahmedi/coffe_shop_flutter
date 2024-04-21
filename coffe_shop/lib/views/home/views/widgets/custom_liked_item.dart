import 'package:coffe_shop/core/utils/app_styles.dart';
import 'package:coffe_shop/core/utils/colors.dart';
import 'package:coffe_shop/views/home/controller/menu_list.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomLikedItem extends StatefulWidget {
  const CustomLikedItem({
    super.key,
    required this.index,
    required this.onLike,
  });
  final int index;
  final Function(int) onLike;
  @override
  State<CustomLikedItem> createState() => _CustomLikedItemState();
}

class _CustomLikedItemState extends State<CustomLikedItem> {
  bool isLiked = true;

  /* void toggleLike() {
    setState(() {
      isLiked = !isLiked;
      widget.onLike(widget.index);
    });
  }*/

  @override
  Widget build(BuildContext context) {
    final menuItem = MenuList.menulist[widget.index];
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: Container(
            height: MediaQuery.sizeOf(context).height / 4,
            width: MediaQuery.sizeOf(context).height / 4.5,
            decoration: const BoxDecoration(
              color: Color(0xffCE9760),
              //borderRadius: BorderRadius.circular(20),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: GestureDetector(
                      onTap: () {},
                      child: isLiked
                          ? const Icon(
                              FontAwesomeIcons.solidHeart,
                              color: Colors.red,
                            )
                          : const Icon(
                              FontAwesomeIcons.heart,
                              color: Colors.white,
                            ),
                    ),
                  ),
                  Image.asset(
                    menuItem.image,
                    height: MediaQuery.sizeOf(context).height / 8,
                    width: MediaQuery.sizeOf(context).height / 8,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        menuItem.coffeName,
                        style: AppStyles.styleSemiBold24.copyWith(
                          fontSize: 18,
                        ),
                      ),
                      Text(
                        menuItem.price,
                        style: AppStyles.styleSemiBold24.copyWith(
                          fontSize: 16,
                          color: AppColors.kDescriptionColor,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    menuItem.description,
                    style: AppStyles.styleRegular14.copyWith(
                      fontSize: 9,
                      color: AppColors.kDescriptionColor,
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
