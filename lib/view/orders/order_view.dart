import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pharma/const.dart';
import 'package:remixicon/remixicon.dart';

class OrderView extends StatelessWidget {
  OrderView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
        ),
        leading: BackButton(
          color: Colors.white,
        ),
        title: Text(
          "Order View",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: primaryColor,
      ),
      body: ListView(
        children: [
          Container(
            color: primaryColor,
            child: ListTile(
              leading: SizedBox(
                height: 50,
                width: 50,
                child: Center(
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    child: Icon(
                      Remix.shopping_bag_2_line,
                      size: 19,
                      color: primaryColor,
                    ),
                    radius: 18,
                  ),
                ),
              ),
              title: Text(
                "OD200054579 | 501 | COD",
                style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w500,
                    color: Colors.white),
              ),
              subtitle: Text(
                "Confirmed order",
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: Colors.white),
              ),
            ),
          ),
          Card(
            margin: EdgeInsets.all(15),
            elevation: 0.1,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                children: [
                  Row(
                    children: [
                      Image.network(
                        'https://pic.vsixhub.com/7d/04/1be06a78-ee88-4acf-a10c-5187b3c184b0-logo.png',
                        width: 50,
                        height: 50,
                      ),
                      SizedBox(
                        width: 12,
                      ),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'ESLO 2.5MG TABLET',
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black),
                            ),
                            Text(
                              'Placed on 12/11/20',
                              style: TextStyle(
                                  fontSize: 11,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.grey),
                            ),
                            Text(
                              '₹4062 | MRP ₹91',
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: primaryColor),
                            ),
                            Text(
                              '7% disount',
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: greenColor),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Column(
                    children: [
                      for (var element in UserDetail)
                        Row(
                          children: [
                            Expanded(child: Text(element['key']!)),
                            Expanded(
                                child: Text(
                              element['value']!,
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: primaryColor),
                            )),
                          ],
                        ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Arriving on 12/07/21',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: blackColor),
                  ),
                ),
              ],
            ),
          ),
          ListView.builder(
            shrinkWrap: true,
            physics: ClampingScrollPhysics(),
            itemBuilder: (BuildContext context, int index) {
              var ds = transList[index];
              return new Stack(
                children: <Widget>[
                  new Padding(
                    padding: const EdgeInsets.only(left: 50.0),
                    child: new Card(
                      shadowColor: primaryColor.withOpacity(0.1),
                      elevation: 0.1,
                      margin: new EdgeInsets.all(20.0),
                      child: new Container(
                        padding: EdgeInsets.all(10),
                        // width: double.infinity,
                        child: Row(
                          children: [
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(ds['title']!),
                                  Text(
                                    ds['sub_title']!,
                                    style: TextStyle(
                                        fontSize: 11, color: greyColor),
                                  ),
                                ],
                              ),
                            ),
                            Text(
                              ds['Date']!,
                              style: TextStyle(fontSize: 11, color: greyColor),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  new Positioned(
                    top: 0.0,
                    bottom: 0.0,
                    left: 35.0,
                    child: new Container(
                      height: double.infinity,
                      width: 1.0,
                      color: primaryColor,
                    ),
                  ),
                  new Positioned(
                    top: 50.0,
                    left: 25.0,
                    child: new Container(
                      height: 20.0,
                      width: 20.0,
                      decoration: new BoxDecoration(
                        shape: BoxShape.circle,
                        color: primaryColor.withOpacity(0.1),
                      ),
                      child: new Container(
                        margin: new EdgeInsets.all(5.0),
                        height: 20,
                        width: 20,
                        decoration: new BoxDecoration(
                            shape: BoxShape.circle, color: primaryColor),
                      ),
                    ),
                  )
                ],
              );
            },
            itemCount: transList.length,
          )
        ],
      ),
      bottomNavigationBar: Container(
        height: 70,
        padding: EdgeInsets.all(10),
        child: Container(
          decoration: BoxDecoration(
            color: primaryColor,
            borderRadius: BorderRadius.circular(7),
          ),
          child: Center(
            child: Text(
              'Download Invoice',
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }

  var UserDetail = [
    {
      "key": "Order placed by:",
      "value": "Bhagabati Enterprise",
    },
    {
      "key": "Packing",
      "value": "Tablet",
    },
    {
      "key": "GSTIN(or PAN):",
      "value": "6ACQPB1111K2ZX",
    },
    {
      "key": "GST:",
      "value": "12%",
    },
    {
      "key": "Quantity:",
      "value": "60",
    },
  ];

  var transList = [
    {
      "title": "In transit",
      "sub_title": "Manifested uploaded(Kolkata_Entally_C (West Bengal))",
      "Date": "12 Jun, 2021"
    },
    {
      "title": "In transit",
      "sub_title": "Manifested uploaded(Kolkata_Entally_C (West Bengal))",
      "Date": "12 Jun, 2021"
    },
    {
      "title": "In transit",
      "sub_title": "Manifested uploaded(Kolkata_Entally_C (West Bengal))",
      "Date": "12 Jun, 2021"
    },
    {
      "title": "In transit",
      "sub_title": "Manifested uploaded(Kolkata_Entally_C (West Bengal))",
      "Date": "12 Jun, 2021"
    }
  ];
}
