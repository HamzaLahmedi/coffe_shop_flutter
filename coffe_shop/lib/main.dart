import 'package:coffe_shop/views/auth/views/resgister_view.dart';
import 'package:coffe_shop/views/auth/views/sign_in_view.dart';
import 'package:coffe_shop/views/home/views/home_view.dart';
import 'package:coffe_shop/views/home/views/liked_view.dart';
import 'package:coffe_shop/views/home/views/profile_view.dart';
import 'package:coffe_shop/views/home/views/shop_view.dart';
import 'package:coffe_shop/views/onBoarding_view/views/onBoarding_view.dart';
import 'package:coffe_shop/views/splash_view/splash_view.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(DevicePreview(enabled: false, builder: (context) => const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      //locale: DevicePreview.locale(context),
      //builder: DevicePreview.appBuilder,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routes: {
        '/': (context) => const SplashView(),
        '/onBoarding': (context) => const OnBoardingView(),
        '/register': (context) => const RegisterView(),
        '/signin': (context) => const SignInView(),
        '/home': (context) => HomeView(),
        '/liked': (context) => const LikedView(),
        '/profile': (context) => const ProfileView(),
        '/shop': (context) => const ShopView(),
      },
      initialRoute: '/home',
    );
  }
}
