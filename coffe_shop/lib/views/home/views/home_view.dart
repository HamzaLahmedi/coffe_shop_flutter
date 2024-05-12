import 'package:coffe_shop/core/utils/colors.dart';
import 'package:coffe_shop/views/home/views/widgets/custom_drawer.dart';
import 'package:coffe_shop/views/home/views/widgets/home_view_body.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  HomeView({
    super.key,
  });
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  openDrawer() {
    scaffoldKey.currentState?.openDrawer();
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kBackgroundColor,
      key: scaffoldKey,
      body: HomeViewBody(
        openDrawer: openDrawer,
      ),
      drawer:  CustomDrawer(),
    );
  }
}
