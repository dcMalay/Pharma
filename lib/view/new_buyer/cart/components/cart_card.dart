import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../const.dart';
import '../../../../data/repository/get_cart_peoducts_repo.dart';
import '../../theme/custom_theme.dart';

List<Map<String, String>> productDate = [
  {
    "imageUrl":
        "https://newassets.apollo247.com/pub/media/catalog/product/t/o/ton0012.jpg",
    "title": "Tonact 5g tablets",
    "subtitle": "Sold by SLS farm",
    "MRP": "₹ 49.99",
    "PTR": "₹ 27.18"
  },
  {
    "imageUrl":
        "https://newassets.apollo247.com/pub/media/catalog/product/t/o/ton0012.jpg",
    "title": "Tonact 5g tablets",
    "subtitle": "Sold by SLS farm",
    "MRP": "₹ 49.99",
    "PTR": "₹ 27.18"
  },
  {
    "imageUrl":
        "https://newassets.apollo247.com/pub/media/catalog/product/t/o/ton0012.jpg",
    "title": "Tonact 5g tablets",
    "subtitle": "Sold by SLS farm",
    "MRP": "₹ 49.99",
    "PTR": "₹ 27.18"
  },
  {
    "imageUrl":
        "https://newassets.apollo247.com/pub/media/catalog/product/t/o/ton0012.jpg",
    "title": "Tonact 5g tablets",
    "subtitle": "Sold by SLS farm",
    "MRP": "₹ 49.99",
    "PTR": "₹ 27.18"
  },
  {
    "imageUrl":
        "https://newassets.apollo247.com/pub/media/catalog/product/t/o/ton0012.jpg",
    "title": "Tonact 5g tablets",
    "subtitle": "Sold by SLS farm",
    "MRP": "₹ 49.99",
    "PTR": "₹ 27.18"
  },
];

class CartCard extends StatefulWidget {
  const CartCard({Key? key}) : super(key: key);

  @override
  State<CartCard> createState() => _CartCardState();
}

class _CartCardState extends State<CartCard> {
  late Future<List<dynamic>> bagproducts;

  @override
  void initState() {
    super.initState();
    bagproducts = getbagProducts();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<dynamic>>(
        future: bagproducts,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<dynamic>? bagproductsData = snapshot.data;
            return ListView.builder(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.vertical,
              itemCount: bagproductsData!.length,
              itemBuilder: (context, index) {
                // var currentItem = productDate[index];
                var currentData = bagproductsData[index];
                return Container(
                  margin: const EdgeInsets.all(10),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: CustomTheme.cardShadow,
                      borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          currentData["image_list"][index] != null
                              ? Image.network(
                                  currentData["image_list"][0],
                                  height: 60,
                                )
                              : Container(
                                  height: 60,
                                  color: greyColor,
                                  padding: EdgeInsets.all(10),
                                  child: Center(child: Text('no image')),
                                ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 50,
                                width: 150,
                                child: ListTile(
                                    title: Text(
                                      currentData["product_name"],
                                      style: const TextStyle(
                                        color: Color.fromARGB(255, 93, 90, 241),
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15,
                                      ),
                                    ),
                                    subtitle: Text(
                                      currentData['categories']
                                          ['category_name'],
                                      style: const TextStyle(
                                        fontSize: 12,
                                      ),
                                    )),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 18, top: 10),
                                child: Text(
                                  currentData['product_price'].toString(),
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            width: 80,
                          ),
                          // Container(
                          //   padding: const EdgeInsets.only(left: 30),
                          //   width: 80,
                          //   height: 30,
                          //   child: CupertinoButton(
                          //     padding: const EdgeInsets.all(0),
                          //     color: Colors.green,
                          //     child: Text(
                          //       'Usable',
                          //       style: TextStyle(color: Colors.white, fontSize: 10),
                          //     ),
                          //     onPressed: () {},
                          //   ),
                          // ),
                          Container(
                            padding: const EdgeInsets.only(left: 10),
                            width: 80,
                            height: 30,
                            child: CupertinoButton(
                              padding: const EdgeInsets.all(0),
                              color: const Color.fromARGB(255, 93, 90, 241),
                              child: Text(
                                'Edit Bag',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 10),
                              ),
                              onPressed: () {},
                            ),
                          ),
                        ],
                      ),
                      const Divider(
                        color: Colors.black,
                      ),
                      // Padding(
                      //   padding: const EdgeInsets.symmetric(
                      //       horizontal: 20, vertical: 5),
                      //   child: Row(
                      //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //     children: [
                      //       Text(
                      //         'MRP :',
                      //         style: TextStyle(fontSize: 12),
                      //       ),
                      //       Text(
                      //         currentData['product_price'].toString(),
                      //         style: TextStyle(fontSize: 12),
                      //       ),
                      //     ],
                      //   ),
                      // ),
                      // Padding(
                      //   padding: const EdgeInsets.symmetric(
                      //       horizontal: 20, vertical: 5),
                      //   child: Row(
                      //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //     children: const [
                      //       Text(
                      //         'Discount type :',
                      //         style: TextStyle(fontSize: 12),
                      //       ),
                      //       Text(
                      //         'PTR discount',
                      //         style: TextStyle(fontSize: 12),
                      //       ),
                      //     ],
                      //   ),
                      // ),
                      // Padding(
                      //   padding: const EdgeInsets.symmetric(
                      //       horizontal: 20, vertical: 5),
                      //   child: Row(
                      //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //     children: const [
                      //       Text(
                      //         'Final PTR Excluding GST :',
                      //         style: TextStyle(fontSize: 12),
                      //       ),
                      //       Text(
                      //         '₹  70.72',
                      //         style: TextStyle(fontSize: 12),
                      //       ),
                      //     ],
                      //   ),
                      // ),
                      // Padding(
                      //   padding: const EdgeInsets.symmetric(
                      //       horizontal: 20, vertical: 5),
                      //   child: Row(
                      //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //     children: const [
                      //       Text(
                      //         'GST (12%) :',
                      //         style: TextStyle(fontSize: 12),
                      //       ),
                      //       Text(
                      //         '₹ 0.08',
                      //         style: TextStyle(fontSize: 12),
                      //       ),
                      //     ],
                      //   ),
                      // ),
                      // Padding(
                      //   padding: const EdgeInsets.symmetric(
                      //       horizontal: 20, vertical: 5),
                      //   child: Row(
                      //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //     children: const [
                      //       Text(
                      //         'Net Rate including Gst :',
                      //         style: TextStyle(fontSize: 12),
                      //       ),
                      //       Text(
                      //         '₹ 79.21',
                      //         style: TextStyle(fontSize: 12),
                      //       ),
                      //     ],
                      //   ),
                      // ),
                      // Padding(
                      //   padding: const EdgeInsets.symmetric(
                      //       horizontal: 20, vertical: 5),
                      //   child: Row(
                      //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //     children: const [
                      //       Text(
                      //         'Quentity :',
                      //         style: TextStyle(fontSize: 12),
                      //       ),
                      //       Text(
                      //         '₹ 100 Strip',
                      //         style: TextStyle(fontSize: 12),
                      //       ),
                      //     ],
                      //   ),
                      // ),
                      // Padding(
                      //   padding: const EdgeInsets.symmetric(
                      //       horizontal: 20, vertical: 5),
                      //   child: Row(
                      //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //     children: const [
                      //       Text(
                      //         'Final Payable Value :',
                      //         style: TextStyle(fontSize: 12),
                      //       ),
                      //       Text(
                      //         '₹ 7921.00',
                      //         style: TextStyle(fontSize: 12),
                      //       ),
                      //     ],
                      //   ),
                      // ),
                      Row(
                        children: [
                          // IconButton(
                          //   onPressed: () {},
                          //   icon: const Icon(
                          //     Icons.remove_circle,
                          //     color: Color.fromARGB(255, 93, 90, 241),
                          //   ),
                          // ),
                          // const Text(
                          //   "10",
                          //   style: TextStyle(
                          //       fontSize: 20, fontWeight: FontWeight.bold),
                          // ),
                          // IconButton(
                          //   onPressed: () {},
                          //   icon: const Icon(
                          //     Icons.add_circle,
                          //     color: Color.fromARGB(255, 93, 90, 241),
                          //   ),
                          // ),
                          const SizedBox(
                            width: 195,
                          ),
                          SizedBox(
                            width: 50,
                            height: 30,
                            child: CupertinoButton(
                              padding: const EdgeInsets.all(0),
                              color: const Color.fromARGB(255, 93, 90, 241),
                              child: Text(
                                'Remove',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 10),
                              ),
                              onPressed: () {},
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                );
              },
            );
          } else if (snapshot.hasData) {
            throw Exception('getting error');
          } else {
            return Center(child: CircularProgressIndicator());
          }
        });
  }
}

//  Column(
//                   children: [
//                     Row(
//                       children: [
//                         IconButton(
//                           onPressed: () {},
//                           icon: const Icon(
//                             Icons.remove_circle,
//                             color: Color.fromARGB(255, 93, 90, 241),
//                           ),
//                         ),
//                         const Text(
//                           "10",
//                           style: TextStyle(
//                               fontSize: 20, fontWeight: FontWeight.bold),
//                         ),
//                         IconButton(
//                           onPressed: () {},
//                           icon: const Icon(
//                             Icons.add_circle,
//                             color: Color.fromARGB(255, 93, 90, 241),
//                           ),
//                         ),
//                       ],
//                     ),
//                     SizedBox(
//                       width: 50,
//                       height: 30,
//                       child: CupertinoButton(
//                         padding: const EdgeInsets.all(0),
//                         color: const Color.fromARGB(255, 93, 90, 241),
//                         child: Text(
//                           'Remove',
//                           style: TextStyle(color: whiteColor, fontSize: 10),
//                         ),
//                         onPressed: () {},
//                       ),
//                     )
//                   ],
//                 ),
