import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:pharma/const.dart';
import 'package:pharma/main/my_profile.dart';
import 'package:pharma/query/seller/global.dart';
import 'package:pharma/view/my_account/components/help_page.dart';
import 'package:pharma/view/my_account/components/list_card.dart';
import 'package:remixicon/remixicon.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../new_buyer/home.dart';

class MyAccountPage extends StatefulWidget {
  const MyAccountPage({Key? key}) : super(key: key);

  @override
  State<MyAccountPage> createState() => _MyAccountPageState();
}

class _MyAccountPageState extends State<MyAccountPage> {
  bool isswitchClicked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: BackButton(
          color: blackColor,
        ),
        title: Text('My Account', style: TextStyle(color: blackColor)),
        centerTitle: true,
        backgroundColor: Colors.white,
        // elevation: 0.0,
        shadowColor: primaryColor.withOpacity(0.1),
      ),
      body: ListView(
        padding: EdgeInsets.all(20),
        children: [
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
                      // borderRadius: BorderRadius.circular(10),
                      // border: Border.all(color: primaryColor, width: 0.5),
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
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => BuyerHome(
                              isLoggedIn: true,
                            )));
              },
              image: 'assets/step4.png',
              title: 'Login As a Buyer',
              subtitle: 'Amet minim mollit non\n deserunt ullamco,'),
          const Divider(),
          ListTileCard(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HelpPage(),
                  ),
                );
              },
              image: 'assets/step1.png',
              title: 'Help',
              subtitle: 'Click to contact admin'),
          const Divider(),
          ListTileCard(
              onTap: () {
                SellerGlobalHandler.logout();
              },
              image: 'assets/step3.png',
              title: 'Logout',
              subtitle: 'Logout from your account'),
          const Divider(),
          Padding(
            padding: const EdgeInsets.only(left: 20, top: 20),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('Vacation Mode'),
                SizedBox(width: 40),
                FlutterSwitch(
                    borderRadius: 30.0,
                    padding: 2.0,
                    value: isswitchClicked,
                    activeColor: primaryColor,
                    inactiveColor: Colors.white,
                    inactiveToggleColor: primaryColor,
                    width: 51.0,
                    height: 26.0,
                    toggleSize: 23.0,
                    switchBorder: Border.all(
                      color: primaryColor,
                      width: 2.0,
                    ),
                    onToggle: (val) async {
                      setState(() {
                        isswitchClicked = val;
                      });
                      SharedPreferences prefs =
                          await SharedPreferences.getInstance();
                      prefs.setBool("notificationStatus", val);
                    }),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
