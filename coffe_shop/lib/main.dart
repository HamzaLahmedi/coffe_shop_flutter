import 'package:coffe_shop/core/utils/snackbar.dart';
import 'package:coffe_shop/firebase_options.dart';
import 'package:coffe_shop/provider/dialog_provider.dart';
import 'package:coffe_shop/provider/google_signin.dart';
import 'package:coffe_shop/provider/liked_items.dart';
import 'package:coffe_shop/provider/shopping_cart.dart';
import 'package:coffe_shop/views/auth/views/sign_in_view.dart';
import 'package:coffe_shop/views/home/views/home_view.dart';
import 'package:coffe_shop/views/splash_view/splash_view.dart';
import 'package:device_preview/device_preview.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(DevicePreview(enabled: false, builder: (context) => const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ShoppingCart(),
        ),
        ChangeNotifierProvider(
          create: (context) => LikedItems(),
        ),
        ChangeNotifierProvider(
          create: (context) => GoogleSignInProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => DialogProvider(),
          
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        //locale: DevicePreview.locale(context),
        //builder: DevicePreview.appBuilder,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
              brightness: Brightness.dark, seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                  child: CircularProgressIndicator(
                color: Colors.white,
              ));
            } else if (snapshot.hasError) {
              return showSnackBar(context, "Something went wrong");
            } else if (snapshot.hasData) {
              return HomeView();
            } else {
              return const SignInView();
            }
          },
        ),
        /*routes: {
          '/': (context) => const SplashView(),
          '/onBoarding': (context) => const OnBoardingView(),
          '/register': (context) => const RegisterView(),
          '/signin': (context) => const SignInView(),
          '/home': (context) => HomeView(),
          '/liked': (context) => const LikedView(),
          '/profile': (context) => const ProfileView(),
          '/shop': (context) => const ShopView(),
        },
        initialRoute: '/home',*/
      ),
    );
  }
}
