import 'package:coffe_shop/core/utils/app_styles.dart';
import 'package:coffe_shop/core/utils/colors.dart';
import 'package:coffe_shop/views/home/controller/menu_list.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomGridViewItem extends StatefulWidget {
  const CustomGridViewItem({
    super.key,
    required this.index,
    required this.onLike,// required this.onToggleLike,
  });
  final int index;
  final Function(int,bool) onLike;
  //final Function(bool) onToggleLike;
  @override
  State<CustomGridViewItem> createState() => _CustomGridViewItemState();
}

class _CustomGridViewItemState extends State<CustomGridViewItem> {
  bool isLiked = false;
  void toggleLike() {
    setState(() {
      isLiked = !isLiked;
      widget.onLike(widget.index,isLiked);
      //widget.onLike(widget.index);
      print('liked $isLiked');
    });
  }

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
            decoration: BoxDecoration(
              color: const Color(0xffCE9760),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: GestureDetector(
                      onTap: toggleLike,
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
