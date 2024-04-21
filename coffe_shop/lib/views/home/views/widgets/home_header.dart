import 'package:coffe_shop/core/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({
    super.key, required this.openDrawer,
  });
  final VoidCallback openDrawer;
  

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Row(
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
              Text(
                'Shahzaib',
                style: AppStyles.styleSemiBold24.copyWith(
                  fontSize: 22,
                ),
              ),
              const Text(
                'Good Morning!',
                style: TextStyle(
                  fontWeight: FontWeight.w300,
                  fontSize: 18,
                  color: Color(0xffE3E3E3),
                ),
              ),
            ],
          ),
          const Spacer(),
          SvgPicture.asset(
            'assets/images/search_logo.svg',
            //height: 30,
            //width: 30,
          ),
          const SizedBox(
            width: 15,
          ),
          SvgPicture.asset(
            'assets/images/notif_logo.svg',
            //height: 30,
            //width: 30,
          ),
        ],
      ),
    );
  }
}
