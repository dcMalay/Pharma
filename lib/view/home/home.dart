import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:pharma/const.dart';
import 'package:pharma/view/help/help.dart';
import 'package:pharma/view/home/components/inventry.dart';
import 'package:pharma/view/home/components/overView_card.dart';
import 'package:remixicon/remixicon.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../orders/order.dart';
import '../settlements/settlement.dart';
import '../stock/new_stock_screen.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({Key? key}) : super(key: key);

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  bool isswitchClicked = false;
  @override
  initState() {
    super.initState();
    fetchNotificationStatus();
  }

  fetchNotificationStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    isswitchClicked = prefs.getBool("notificationStatus") ?? true;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _key = GlobalKey();

    return Scaffold(
      key: _key,
      drawer: Drawer(
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            SizedBox(
              height: 40,
            ),
            Center(
              child: CircleAvatar(
                radius: 40.0,
                backgroundColor: Colors.grey,
                backgroundImage: NetworkImage(
                  'https://images.pexels.com/photos/6147118/pexels-photo-6147118.jpeg?auto=compress&cs=tinysrgb&w=1600',
                ),
              ),
            ),
            Center(
                child: Text(
              'Remesh',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 15),
            )),
            Divider(
              color: Colors.grey,
            ),
            ListTile(
              leading: Icon(
                Remix.hand_coin_line,
                color: primaryColor,
              ),
              title: const Text('Settlement'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return SettlementTab();
                }));
              },
            ),
            ListTile(
              leading: Icon(
                Remix.inbox_archive_line,
                color: primaryColor,
              ),
              title: const Text('Stocks'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return NewStockScreen();
                }));
              },
            ),
            ListTile(
              leading: Icon(
                Remix.shopping_bag_2_line,
                color: primaryColor,
              ),
              title: const Text('Orders'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return OrderTab();
                }));
              },
            ),
            // Checkbox(
            //     value: isswitchClicked,
            //     onChanged: (val) async {
            //       setState(() {
            //         isswitchClicked = val!;
            //       });
            //       SharedPreferences prefs =
            //           await SharedPreferences.getInstance();
            //       prefs.setBool("notificationStatus", val!);
            //     }),
            Padding(
              padding: const EdgeInsets.only(left: 20),
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
            )
            // FlutterSwitch(
            //   switchBorder: Border.all(
            //     color: primaryColor,
            //     width: 2.0.w,
            //   ),
            //   activeColor: primaryColor,
            //   inactiveColor: Colors.white,
            //   inactiveToggleColor: primaryColor,
            //   width: 51.0,
            //   height: 26.0,
            //   toggleSize: 23.0,
            //   value: isswitchClicked,
            //   borderRadius: 30.0,
            //   padding: 2.0,
            //   onToggle: (val) {
            //     setState(() {
            //       isswitchClicked = val;
            //     });
            //   },
            // ),
          ],
        ),
      ),
      body: ListView(
        padding: EdgeInsets.all(20),
        children: [
          SizedBox(
            height: 20,
          ),
          Row(
            children: [
              IconButton(
                onPressed: () {
                  _key.currentState!.openDrawer();
                },
                icon: Icon(
                  Remix.menu_2_line,
                  color: primaryColor,
                ),
              ),
              const Spacer(),
              InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return const HelpPage();
                      },
                    ));
                  },
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    child: Icon(
                      Remix.user_2_fill,
                      color: primaryColor,
                    ),
                  )),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Text("Total sales this month",
              style: TextStyle(
                  color: primaryColor,
                  fontSize: 12,
                  fontWeight: FontWeight.w400)),
          SizedBox(height: 10),
          Row(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "₹9,433",
                    style: TextStyle(
                        color: blackColor,
                        fontSize: 21,
                        fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  Text(
                    "Last updated 12min ago",
                    style: TextStyle(
                        color: greyColor,
                        fontSize: 12,
                        fontWeight: FontWeight.w400),
                  ),
                ],
              ),
              Spacer(),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    "-12.5%",
                    style: TextStyle(
                        color: red, fontSize: 21, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  Text(
                    "Since last month",
                    style: TextStyle(
                        color: greyColor,
                        fontSize: 12,
                        fontWeight: FontWeight.w400),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            alignment: WrapAlignment.spaceBetween,
            children: [
              OverViewCard(
                  icon: Remix.shopping_bag_2_line,
                  title: "Pending order",
                  color: greenColor,
                  value: "25",
                  width: MediaQuery.of(context).size.width / 2 - 30),
              OverViewCard(
                  icon: Remix.shopping_bag_2_line,
                  title: "Out of stock",
                  color: red,
                  value: "5",
                  width: MediaQuery.of(context).size.width / 2 - 30),
              SizedBox(
                height: 10,
                width: MediaQuery.of(context).size.width,
              ),
              OverViewCard(
                  icon: Remix.shopping_bag_2_line,
                  title: "Slow moving",
                  color: orangeColor,
                  value: "13",
                  width: MediaQuery.of(context).size.width / 2 - 30),
              OverViewCard(
                  icon: Remix.shopping_bag_2_line,
                  title: "Close to expiry",
                  color: primaryColor,
                  value: "7",
                  width: MediaQuery.of(context).size.width / 2 - 30),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Text("Top selling products",
              style: TextStyle(
                  color: blackColor,
                  fontSize: 15,
                  fontWeight: FontWeight.w500)),
          SizedBox(
            height: 10,
          ),
          HomeInventoryCard()
        ],
      ),
    );
  }
}
