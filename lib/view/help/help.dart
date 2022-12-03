import 'package:flutter/material.dart';
import 'package:pharma/const.dart';
import 'package:pharma/main/my_profile.dart';
import 'package:pharma/query/seller/global.dart';
import 'package:pharma/view/buyer/home/home.dart';
import 'package:pharma/view/help/components/list_card.dart';
import 'package:remixicon/remixicon.dart';

class HelpPage extends StatelessWidget {
  const HelpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: BackButton(
          color: blackColor,
        ),
        title: Text('Help', style: TextStyle(color: blackColor)),
        centerTitle: true,
        backgroundColor: Colors.white,
        // elevation: 0.0,
        shadowColor: primaryColor.withOpacity(0.1),
      ),
      body: ListView(
        padding: EdgeInsets.all(20),
        children: [
          Text("Welcome to help center",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: primaryColor)),
          const Text("How can we help you today?",
              style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w400,
                  color: blackColor)),
          const SizedBox(
            height: 23,
          ),
          Row(children: [
            Expanded(
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MyProfile(),
                    ),
                  );
                },
                child: Container(
                  padding: const EdgeInsets.all(14),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: primaryColor, width: 0.5),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Remix.user_2_fill,
                        color: primaryColor,
                        size: 20,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'My Profile',
                        style: TextStyle(
                            color: primaryColor,
                            fontSize: 18,
                            fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ]),
          const SizedBox(
            height: 23,
          ),
          Text(
            'Or select a category you are interested in',
            style: TextStyle(
                color: greyColor, fontSize: 16, fontWeight: FontWeight.w400),
          ),
          const ListTileCard(
              image: 'assets/step1.png',
              title: 'Shipping & Tracking',
              subtitle: 'Amet minim mollit non\n deserunt ullamco,'),
          const Divider(),
          const ListTileCard(
              image: 'assets/step2.png',
              title: 'Returns and Refunds',
              subtitle: 'Amet minim mollit non\ndeserunt ullamco,'),
          const Divider(),
          ListTileCard(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => BuyerHomePage()));
              },
              image: 'assets/step4.png',
              title: 'Login As a Buyer',
              subtitle: 'Amet minim mollit non\n deserunt ullamco,'),
          const Divider(),
          ListTileCard(
              onTap: () {
                SellerGlobalHandler.logout();
              },
              image: 'assets/step3.png',
              title: 'Logout',
              subtitle: 'Logout from your account'),
          const Divider(),
        ],
      ),
    );
  }
}
