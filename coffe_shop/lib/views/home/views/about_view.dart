
import 'package:coffe_shop/views/home/views/widgets/about_view_body.dart';
import 'package:flutter/material.dart';

class AboutView extends StatefulWidget {
  const AboutView({super.key});

  @override
  State<AboutView> createState() => _AboutViewState();
}

class _AboutViewState extends State<AboutView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: const [
            Icon(
              Icons.notifications,
              color: Colors.white,
            ),
          ],
          // backgroundColor: appbarGreen,
          title: const Text("Profile "),
        ),
        body:const AboutViewBody());
  }
}

