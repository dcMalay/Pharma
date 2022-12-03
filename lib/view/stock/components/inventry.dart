import 'package:flutter/material.dart';
import 'package:pharma/const.dart';
import 'package:pharma/query/seller/product/get_user_products.dart';

class InventoryCard extends StatelessWidget {
  final ResultProducts ds;
  InventoryCard({Key? key, required this.ds}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    final expirationDate = DateTime.parse(ds.expireDate!);
    final bool isExpired = expirationDate.isBefore(now);
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
                  isExpired
                      ? Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 11, vertical: 4),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: red, width: 0.5),
                          ),
                          child: Text(
                            "Expired",
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                color: red),
                          ),
                        )
                      : Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 11, vertical: 4),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: greenColor, width: 0.5),
                          ),
                          child: Text(
                            "Usable",
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                color: greenColor),
                          ),
                        ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Row(
                          children: [
                            ds.imageList!.isEmpty
                                ? Container(
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            width: 1,
                                            color: Colors.grey.shade100)),
                                    height: 60,
                                    width: 60,
                                    child: Center(
                                        child: Text(
                                      "No Image",
                                      style: TextStyle(fontSize: 10),
                                    )),
                                  )
                                : Image.network(
                                    ds.imageList![0],
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
                                    ds.productName!,
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                        color: primaryColor),
                                  ),
                                  Text(
                                    "Manufactured by ${ds.companyName}",
                                    style: TextStyle(
                                      color: Colors.grey[400],
                                      fontSize: 10,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ]),
                          ],
                        ),
                      ),
                      // IconButton(
                      //   onPressed: () {},
                      //   icon:
                      //       Icon(Remix.eye_line, color: primaryColor, size: 20),
                      // ),
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
                          const SizedBox(height: 8),
                          Text("₹${ds.productPrice!.toStringAsFixed(2)}",
                              style: TextStyle(
                                  fontSize: 12,
                                  color: Color(0xFF393B3D),
                                  fontWeight: FontWeight.w600)),
                        ],
                      ),
                      Column(children: [
                        Text("PTR",
                            style: TextStyle(
                                fontSize: 10,
                                color: primaryColor,
                                fontWeight: FontWeight.w400)),
                        const SizedBox(height: 8),
                        Text(
                            "₹${(ds.discountDetails!.finalPtr! - ds.discountDetails!.gstValue!).toStringAsFixed(2)}",
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
                        Text("${ds.stock}",
                            style: TextStyle(
                                fontSize: 14,
                                color: Color(0xFF393B3D),
                                fontWeight: FontWeight.w600)),
                      ]),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 22, vertical: 8),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(3),
                          color: primaryColor,
                        ),
                        child: const Text("Edit",
                            style: TextStyle(
                                fontSize: 14,
                                color: Colors.white,
                                fontWeight: FontWeight.w600)),
                      ),
                    ],
                  ),
                ])));
  }
}
