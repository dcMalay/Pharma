import 'package:flutter/material.dart';
import 'package:pharma/const.dart';
import 'package:pharma/view/help/help.dart';
import 'package:pharma/view/home/components/inventry.dart';
import 'package:pharma/view/home/components/overView_card.dart';
import 'package:remixicon/remixicon.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.all(20),
        children: [
          SizedBox(
            height: 20,
          ),
          Row(
            children: [
              IconButton(
                onPressed: () {},
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
