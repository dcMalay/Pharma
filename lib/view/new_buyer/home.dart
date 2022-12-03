import 'package:flutter/material.dart';
import 'package:pharma/const.dart';
import 'account/account_screen.dart';
import 'allcategory/allcategory_screen.dart';
import 'cart/cart_screen.dart';
import 'home/home_screen.dart';

class BuyerHome extends StatefulWidget {
  const BuyerHome({Key? key}) : super(key: key);

  @override
  State<BuyerHome> createState() => _BuyerHomeState();
}

class _BuyerHomeState extends State<BuyerHome> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey,
                blurRadius: 6,
                spreadRadius: 4,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: TabBar(
              indicatorColor: primaryColor,
              labelColor: primaryColor,
              unselectedLabelColor: greyColor,
              tabs: [
                Tab(
                  icon: Icon(
                    Icons.home,
                  ),
                  text: "Home",
                ),
                Tab(
                  icon: Icon(
                    Icons.category_rounded,
                  ),
                  text: "Category",
                ),
                Tab(
                  icon: Icon(
                    Icons.person,
                  ),
                  text: "Account",
                ),
                Tab(
                  icon: Icon(
                    Icons.shopping_bag,
                  ),
                  text: "Bag",
                ),
              ]),
        ),
        body: const TabBarView(children: [
          HomeScreen(),
          Allcategory(),
          AccountScreen(),
          CartScreen()
        ]),
      ),
    );
  }
}
