import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:pharma/callback_provider/seller_login.dart';
import 'package:pharma/provider/add_stock.dart';
import 'package:pharma/provider/buyer.dart';
import 'package:pharma/provider/cart.dart';
import 'package:pharma/provider/home.dart';
import 'package:pharma/provider/product_search.dart';
import 'package:pharma/provider/seller.dart';
import 'package:pharma/provider/stock.dart';
import 'package:pharma/view/new_buyer/home.dart';
import 'package:provider/provider.dart';

import 'view/onboarding/welcome.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.white, // status bar color
    statusBarIconBrightness: Brightness.dark,
  ));
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GlobalLoaderOverlay(
      overlayWidget: Center(
        child: CircularProgressIndicator(),
      ),
      overlayColor: Colors.white,
      overlayOpacity: 1,
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) {
            return HomeProvider();
          }),
          ChangeNotifierProvider(create: (context) {
            return AddStockProvider();
          }),
          ChangeNotifierProvider(create: (context) {
            return StockProvider();
          }),
          ChangeNotifierProvider(create: (context) {
            return BuyerProductProvider();
          }),
          ChangeNotifierProvider(create: (context) {
            return CartProvider();
          }),
          ChangeNotifierProvider(create: (context) {
            return SellerProvider();
          }),
          ChangeNotifierProvider(create: (context) {
            return BuyerProvider();
          })
        ],
        child: MaterialApp(
            theme: ThemeData(
              fontFamily: GoogleFonts.poppins().fontFamily,
            ),
            debugShowCheckedModeBanner: false,
            home: const WelcomePage()),
      ),
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 3)).then((value) async {
      await SellerLoginCallBack.onChechkingAccount(context);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
          "assets/logo.png",
          height: 200,
        ),
      ),
    );
  }
}
