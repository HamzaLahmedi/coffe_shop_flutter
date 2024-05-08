import 'package:coffe_shop/views/home/views/widgets/custom_grid_view.dart';
import 'package:coffe_shop/views/home/views/widgets/home_card.dart';
import 'package:coffe_shop/views/home/views/widgets/home_header.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({
    super.key,
    required this.openDrawer,
  });
  final VoidCallback openDrawer;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(
            height: 40,
          ),
          HomeHeader(
            openDrawer: openDrawer,
            subtitle: 'Good Morning!',
          ),
          const SizedBox(
            height: 20,
          ),
          const HomeCard(),
          const SizedBox(
            height: 20,
          ),
          CustomGridView()
        ],
      ),
    );
  }
}
