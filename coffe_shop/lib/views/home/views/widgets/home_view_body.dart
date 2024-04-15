import 'package:coffe_shop/views/home/views/widgets/custom_grid_view.dart';
import 'package:coffe_shop/views/home/views/widgets/home_card.dart';
import 'package:coffe_shop/views/home/views/widgets/home_header.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key, });

  @override
  Widget build(BuildContext context) {
    return   SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: 40,
          ),
          HomeHeader(),
          SizedBox(
            height: 20,
          ),
          HomeCard(),
          SizedBox(
            height: 20,
          ),
          CustomGridView(
          
          )
        ],
      ),
    );
  }
}
