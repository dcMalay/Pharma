import 'package:flutter/material.dart';
import 'package:pharma/const.dart';
import 'package:remixicon/remixicon.dart';

class HomeInventoryCard extends StatelessWidget {
  const HomeInventoryCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        elevation: 10,
        shadowColor: const Color(0xFFA7BAFF).withOpacity(0.2),
        child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Image.network(
                        "https://upload.wikimedia.org/wikipedia/commons/thumb/1/11/Test-Logo.svg/783px-Test-Logo.svg.png",
                        width: 64,
                        height: 54,
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Tonact 5mg tablet",
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: primaryColor),
                            ),
                            Text(
                              "Manufactured by Sun Pharma",
                              style: TextStyle(
                                color: Colors.grey[400],
                                fontSize: 10,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ]),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        children: [
                          Text("MRP",
                              style: TextStyle(
                                  fontSize: 10,
                                  color: primaryColor,
                                  fontWeight: FontWeight.w400)),
                          const SizedBox(height: 5),
                          const Text("₹67.18",
                              style: TextStyle(
                                  fontSize: 12,
                                  color: Color(0xFF393B3D),
                                  fontWeight: FontWeight.w600)),
                        ],
                      ),
                      Column(children: [
                        Text("PRC",
                            style: TextStyle(
                                fontSize: 10,
                                color: primaryColor,
                                fontWeight: FontWeight.w400)),
                        const SizedBox(height: 8),
                        const Text("₹27.18",
                            style: TextStyle(
                                fontSize: 14,
                                color: Color(0xFF393B3D),
                                fontWeight: FontWeight.w600)),
                      ]),
                      Column(children: [
                        Text("Units remaining",
                            style: TextStyle(
                                fontSize: 10,
                                color: primaryColor,
                                fontWeight: FontWeight.w400)),
                        const SizedBox(height: 8),
                        const Text("2000",
                            style: TextStyle(
                                fontSize: 14,
                                color: Color(0xFF393B3D),
                                fontWeight: FontWeight.w600)),
                      ]),
                      Column(children: [
                        Text("Total sale value",
                            style: TextStyle(
                                fontSize: 10,
                                color: primaryColor,
                                fontWeight: FontWeight.w400)),
                        const SizedBox(height: 8),
                        const Text("15000",
                            style: TextStyle(
                                fontSize: 14,
                                color: Color(0xFF393B3D),
                                fontWeight: FontWeight.w400)),
                      ]),
                    ],
                  ),
                ])));
  }
}
