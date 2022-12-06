import 'package:flutter/material.dart';
import 'package:pharma/callback_provider/stock.dart';
import 'package:pharma/const.dart';
import 'package:pharma/provider/stock.dart';
import 'package:pharma/view/add_stock/components/textfiled.dart';
import 'package:pharma/view/stock/components/inventry.dart';
import 'package:provider/provider.dart';
import 'package:remixicon/remixicon.dart';

import '../new_buyer/filter_products/filter_products_screen.dart';
import '../new_buyer/home/components/productdetails.dart';
import '../new_buyer/theme/custom_theme.dart';

class StockTab extends StatefulWidget {
  const StockTab({Key? key}) : super(key: key);

  @override
  State<StockTab> createState() => _StockTabState();
}

class _StockTabState extends State<StockTab> {
  @override
  void initState() {
    // StockCallBack(context).withOutstockProvider.getStockProvider(context);
    super.initState();
  }

  // var selectedValue = "All";
  @override
  Widget build(BuildContext context) {
    var _dropDownValue;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back,
              color: blackColor,
            )),
        centerTitle: true,
        backgroundColor: Colors.white,
        title: const Text(
          'All Products',
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const FilterProductsScreen(
                    isSeller: true,
                  );
                }));
              },
              child: Icon(
                Icons.tune_outlined,
                color: primaryColor,
                size: 30,
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: 60,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  DropdownButton(
                    borderRadius: BorderRadius.circular(6),
                    value: _dropDownValue,
                    hint: const Text('12'),
                    items: [
                      DropdownMenuItem<String>(value: '12', child: Text('12')),
                      DropdownMenuItem<String>(value: '24', child: Text('24')),
                      DropdownMenuItem<String>(value: '36', child: Text('36')),
                    ],
                    onChanged: (items) {},
                  ),
                  DropdownButton(
                    value: _dropDownValue,
                    hint: const Text('Default'),
                    items: [
                      DropdownMenuItem<String>(
                          value: 'Default', child: Text('Default')),
                      DropdownMenuItem<String>(
                          value: 'Name', child: Text('Name')),
                      DropdownMenuItem<String>(
                          value: 'New Item', child: Text('New Item')),
                      DropdownMenuItem<String>(
                          value: 'Best Price', child: Text('Best Price')),
                      DropdownMenuItem<String>(
                          value: 'Discount (High-Low)',
                          child: Text('Discount (High-Low)')),
                      DropdownMenuItem<String>(
                          value: 'Discount (Low-High)',
                          child: Text('Discount (Low-High)')),
                      DropdownMenuItem<String>(
                          value: 'Price (High-Low)',
                          child: Text('Price (High-Low)')),
                      DropdownMenuItem<String>(
                          value: 'Price (Low-High)',
                          child: Text('Price (Low-High)')),
                    ],
                    onChanged: (v) {
                      print(v);
                      setState(() {
                        _dropDownValue = v.toString();
                      });
                      print(_dropDownValue);
                    },
                  ),
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height,
              child: Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisSpacing: 2,
                    crossAxisCount: 2,
                  ),
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return const ProductDetails();
                        }));
                      },
                      child: Container(
                        height: 130,
                        width: 130,
                        margin: const EdgeInsets.all(10),
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            boxShadow: CustomTheme.cardShadow,
                            borderRadius: BorderRadius.circular(20),
                            // color: const Color.fromARGB(255, 227, 227, 255),
                            color: Colors.white),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Center(
                              child: Image.network(
                                'https://cdn.shopify.com/s/files/1/0272/4714/9155/products/kofflet-syrup-100ml_1024x1024.jpg?v=1622100457',
                                height: 60,
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            const Text('kofflet-syrup-100ml'),
                            const SizedBox(
                              height: 30,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                Text(
                                  'PTR:Rs 70.12',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.grey,
                                  ),
                                ),
                                Text(
                                  'MRP:Rs 100',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.grey,
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
    // return Consumer<StockProvider>(builder: (context, data, child) {
    //   var ds = data.dsValue;
    //   return RefreshIndicator(
    //     onRefresh: () async {
    //       await data.getStockProvider(context);
    //     },
    //     child: Scaffold(
    //         backgroundColor: Colors.white,
    //         appBar: AppBar(
    //           title: Text('Stock', style: TextStyle(color: blackColor)),
    //           centerTitle: true,
    //           backgroundColor: Colors.white,
    //           elevation: 1,
    //         ),
    //         body: ListView(padding: EdgeInsets.all(20), children: [
    //           Row(
    //             children: [
    //               Expanded(
    //                 child: Container(
    //                   padding: const EdgeInsets.all(14),
    //                   decoration: BoxDecoration(
    //                     borderRadius: BorderRadius.circular(10),
    //                     border: Border.all(color: primaryColor, width: 0.5),
    //                   ),
    //                   child: Row(
    //                     children: [
    //                       Icon(
    //                         Remix.search_line,
    //                         color: primaryColor,
    //                         size: 20,
    //                       ),
    //                       SizedBox(
    //                         width: 10,
    //                       ),
    //                       Expanded(
    //                         child: TextField(
    //                           onChanged: ((value) {
    //                             if (value.isEmpty) {
    //                               data.getStockProvider(context);
    //                             } else {
    //                               data.searchStock(context, value);
    //                             }
    //                           }),
    //                           decoration: InputDecoration(
    //                               isDense: true,
    //                               contentPadding: EdgeInsets.all(0),
    //                               hintText: "Search by product name",
    //                               helperStyle: TextStyle(
    //                                   color: primaryColor,
    //                                   fontSize: 18,
    //                                   fontWeight: FontWeight.w400),
    //                               border: InputBorder.none,
    //                               enabledBorder: InputBorder.none),
    //                         ),
    //                       ),
    //                     ],
    //                   ),
    //                 ),
    //               ),
    // SizedBox(
    //   width: 10,
    // ),
    // Container(
    //   padding: const EdgeInsets.all(14),
    //   decoration: BoxDecoration(
    //     borderRadius: BorderRadius.circular(10),
    //     border: Border.all(color: primaryColor, width: 0.5),
    //   ),
    //   child: Icon(
    //     Remix.equalizer_line,
    //     color: primaryColor,
    //     size: 20,
    //   ),
    //     // ),
    //   ],
    // ),
    // // SizedBox(
    //   height: 20,
    // ),
    // Text("Complete uploading"),
    // SizedBox(
    //   height: 20,
    // ),
    // Card(
    //   shape: RoundedRectangleBorder(
    //     borderRadius: BorderRadius.circular(10),
    //   ),
    //   elevation: 10,
    //   shadowColor: Color(0xFFA7BAFF).withOpacity(0.2),
    //   child: Padding(
    //     padding: const EdgeInsets.all(15),
    //     child: Row(
    //       children: [
    //         Image.network(
    //           "https://upload.wikimedia.org/wikipedia/commons/thumb/1/11/Test-Logo.svg/783px-Test-Logo.svg.png",
    //           width: 64,
    //           height: 54,
    //         ),
    //         const SizedBox(
    //           width: 15,
    //         ),
    //         Column(
    //           children: [
    //             const Text(
    //               "ESLO 2.5MG TABLET",
    //               style: TextStyle(
    //                   fontSize: 14, fontWeight: FontWeight.w400),
    //             ),
    //             Text(
    //               "1200 units remaining",
    //               style: TextStyle(
    //                   fontSize: 14,
    //                   fontWeight: FontWeight.w400,
    //                   color: primaryColor),
    //             ),
    //           ],
    //         ),
    //       ],
    //     ),
    //   ),
    // ),
    //           const SizedBox(
    //             height: 20,
    //           ),
    //           Row(
    //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //             children: [
    //               const Text("Inventory"),
    //               Row(
    //                 children: [
    //                   Text("Filter: "),
    //                   SizedBox(
    //                     width: 5,
    //                   ),
    //                   Container(
    //                     padding:
    //                         EdgeInsets.symmetric(horizontal: 10, vertical: 5),
    //                     decoration: BoxDecoration(
    //                         borderRadius: BorderRadius.circular(5),
    //                         color: Colors.grey.shade100),
    //                     child: Center(
    //                       child: PopupMenuButton<String>(
    //                         child: Text(
    //                           selectedValue,
    //                           style: TextStyle(fontSize: 12),
    //                         ),
    //                         onSelected: (value) {
    //                           setState(() {
    //                             selectedValue = value;
    //                           });
    //                         },
    //                         itemBuilder: (BuildContext context) {
    //                           return {'All', 'Expired', 'Usable'}
    //                               .map((String choice) {
    //                             return PopupMenuItem<String>(
    //                               height: 13,
    //                               enabled:
    //                                   selectedValue == choice ? false : true,
    //                               value: choice,
    //                               child: Text(
    //                                 choice,
    //                                 style: TextStyle(fontSize: 11),
    //                               ),
    //                             );
    //                           }).toList();
    //                         },
    //                       ),
    //                     ),
    //                   ),
    //                 ],
    //               ),
    //             ],
    //           ),
    //           const SizedBox(
    //             height: 20,
    //           ),
    //           ds!.resultProducts!.isEmpty
    //               ? Container(
    //                   height: MediaQuery.of(context).size.height / 2,
    //                   child: Center(
    //                     child: Text("No data found"),
    //                   ),
    //                 )
    //               : ListView.builder(
    //                   shrinkWrap: true,
    //                   physics: ClampingScrollPhysics(),
    //                   itemCount: ds.resultProducts!.length,
    //                   itemBuilder: (context, index) {
    //                     final now = DateTime.now();
    //                     final expirationDate = DateTime.parse(
    //                         ds.resultProducts![index].expireDate!);
    //                     final bool isExpired = expirationDate.isBefore(now);
    //                     return selectedValue == "All"
    //                         ? InventoryCard(
    //                             ds: ds.resultProducts![index],
    //                           )
    //                         : (selectedValue == "Expired") == isExpired
    //                             ? InventoryCard(
    //                                 ds: ds.resultProducts![index],
    //                               )
    //                             : (selectedValue == "Usable") == !isExpired
    //                                 ? InventoryCard(
    //                                     ds: ds.resultProducts![index],
    //                                   )
    //                                 : Container();
    //                   },
    //                 )
    //         ])),
    //   );
    // });
  }
}
