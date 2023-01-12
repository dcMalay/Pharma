import 'package:flutter/material.dart';
import 'package:pharma/data/repository/seller_product_repo.dart';
import '../../const.dart';
import '../../data/model/seller_product_model.dart';
import '../../query/seller/global.dart';
import '../new_buyer/filter_products/filter_products_screen.dart';

import '../new_buyer/theme/custom_theme.dart';

class NewStockScreen extends StatefulWidget {
  const NewStockScreen({super.key, required this.authToken});
  final String authToken;
  @override
  State<NewStockScreen> createState() => _NewStockScreenState();
}

class _NewStockScreenState extends State<NewStockScreen> {
  late Future<List<dynamic>> sellerProducts;

  @override
  void initState() {
    sellerProducts = getsellerProducts(widget.authToken);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
      body: FutureBuilder<List<dynamic>>(
          future: sellerProducts,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              var data = snapshot.data;
              print(data);
              return SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 4.2 / 5,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: GridView.builder(
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            mainAxisSpacing: 2,
                            crossAxisCount: 2,
                          ),
                          itemCount: data!.length,
                          scrollDirection: Axis.vertical,
                          itemBuilder: (context, index) {
                            var currentData = data[index];
                            print(currentData);
                            return InkWell(
                              onTap: () {
                                // Navigator.push(context,
                                //     MaterialPageRoute(builder: (context) {
                                //   return const ProductDetails();
                                // }));
                              },
                              child: Container(
                                height: 130,
                                width: 130,
                                margin: const EdgeInsets.all(10),
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    boxShadow: CustomTheme.cardShadow,
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.white),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    currentData["image_list"].isEmpty
                                        ? Center(
                                            child: Container(
                                              height: 60,
                                              color: Colors.grey,
                                            ),
                                          )
                                        : Center(
                                            child: Image.network(
                                              currentData["image_list"][0],
                                              height: 60,
                                            ),
                                          ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Text(
                                      currentData['product_name'],
                                    ),
                                    const SizedBox(
                                      height: 30,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'MRP:Rs ${currentData["product_price"]}',
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
              );
            } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            } else {
              return Center(
                child: CircularProgressIndicator(
                  color: primaryColor,
                ),
              );
            }
          }),
    );
  }
}
