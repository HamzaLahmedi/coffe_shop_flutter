import 'package:coffe_shop/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class HomeCard extends StatelessWidget {
  const HomeCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.sizeOf(context).height / 5,
      width: MediaQuery.sizeOf(context).width / 1.1,
      decoration: BoxDecoration(
        color: const Color(0xffCE9760).withOpacity(0.5),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 40,
                ),
                Text(
                  'Get 20% Discount \nOn your First Order!',
                  style: AppStyles.styleSemiBold24.copyWith(
                    fontSize: 16,
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 22),
                  child: Text(
                    'Lorem ipsum dolor sit amet consectetur.\nVestibulum eget blandit mattis ',
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Image.asset('assets/images/image.png'),
        ],
      ),
    );
  }
}
