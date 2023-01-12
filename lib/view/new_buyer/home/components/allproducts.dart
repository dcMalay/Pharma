import 'package:flutter/material.dart';

import '../../../../const.dart';
import '../../../../data/model/products_model.dart';
import '../../../../data/repository/get_products_repo.dart';
import '../../filter_products/filter_products_screen.dart';
import '../../theme/custom_theme.dart';
import 'productdetails.dart';

class AllProducts extends StatefulWidget {
  const AllProducts({super.key});

  @override
  State<AllProducts> createState() => _AllProductsState();
}

class _AllProductsState extends State<AllProducts> {
  late Future<List<dynamic>> product;

  @override
  void initState() {
    super.initState();
    product = getProducts();
  }

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
                    isSeller: false,
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
          future: product,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<dynamic>? productsData = snapshot.data;

              return SingleChildScrollView(
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
                              DropdownMenuItem<String>(
                                  value: '12', child: Text('12')),
                              DropdownMenuItem<String>(
                                  value: '24', child: Text('24')),
                              DropdownMenuItem<String>(
                                  value: '36', child: Text('36')),
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
                                  value: 'Best Price',
                                  child: Text('Best Price')),
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
                          itemCount: productsData!.length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            mainAxisSpacing: 2,
                            crossAxisCount: 2,
                          ),
                          scrollDirection: Axis.vertical,
                          itemBuilder: (context, index) {
                            var currentData = productsData[index];
                            return InkWell(
                              onTap: () {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                  return ProductDetails(
                                    productId: currentData['_id'],
                                  );
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
                                      child: currentData["image_list"] != null
                                          ? Image.network(
                                              currentData["image_list"][0],
                                              height: 60,
                                            )
                                          : Container(
                                              height: 60,
                                              color: greyColor,
                                              padding: EdgeInsets.all(10),
                                              child: Center(
                                                  child: Text('no image')),
                                            ),
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Text(currentData['product_name']),
                                    const SizedBox(
                                      height: 30,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        SizedBox(
                                          width: 60,
                                          child: Text(
                                            'PTR:${currentData['discount_details']['per_ptr']}',
                                            style: TextStyle(
                                              fontSize: 12,
                                              color: Colors.grey,
                                            ),
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            softWrap: false,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 70,
                                          child: Text(
                                            'MRP:${currentData['product_price']}',
                                            style: TextStyle(
                                              fontSize: 12,
                                              color: Colors.grey,
                                            ),
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            softWrap: false,
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
            } else if (snapshot.hasData) {
              throw Exception('getting error');
            } else {
              return Center(child: CircularProgressIndicator());
            }
          }),
    );
  }
}
