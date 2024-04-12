import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomIcon extends StatelessWidget {
  const CustomIcon({
    super.key,
    required this.image,
  });
  final String image;
  @override
  Widget build(BuildContext context) {
    return Container(
      // Dynamically set the height based on a percentage of the screen height
      height: MediaQuery.of(context).size.height * 0.1,
      width: MediaQuery.of(context).size.width *
          0.3, // Adjust the percentage as needed
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: const Color(0xff101215).withOpacity(0.7),
      ),
      child: Center(
        child: SvgPicture.asset(image),
      ),
    );
  }
}
