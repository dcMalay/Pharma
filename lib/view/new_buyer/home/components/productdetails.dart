import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pharma/const.dart';
import 'package:pharma/data/model/products_details_model.dart';
import 'package:pharma/data/repository/get_products_details_repo.dart';
import 'package:quickalert/quickalert.dart';
import '../../my_order/my_order_screen.dart';
import '../../theme/custom_theme.dart';
import 'custom_order.dart';

class ProductDetails extends StatefulWidget {
  const ProductDetails({super.key, required this.productId});
  final String productId;
  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  late Future<ProductsDetailsModel> productsDetails;

  @override
  void initState() {
    productsDetails = getProductDetails(widget.productId);
    super.initState();
  }

  var productcount = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
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
            'PharmaBag',
            style: TextStyle(color: Colors.black, fontSize: 20),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CircleAvatar(
                backgroundColor: const Color.fromARGB(255, 227, 227, 255),
                child: IconButton(
                  icon: const Icon(
                    Icons.shopping_bag,
                    color: Colors.black,
                  ),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return const MyOrderScreen();
                    }));
                  },
                ),
              ),
            )
          ],
        ),
        body: FutureBuilder<ProductsDetailsModel>(
            future: productsDetails,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                var data = snapshot.data;
                return ListView(
                  children: [
                    SizedBox(
                      height: 350,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount:
                              snapshot.data!.resultProducts!.imageList!.length,
                          itemBuilder: (context, index) {
                            return Container(
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 30),
                              child: Center(
                                child: Image.network(
                                  snapshot
                                      .data!.resultProducts!.imageList![index],
                                  height: 350,
                                ),
                              ),
                            );
                          }),
                    ),
                    const Divider(
                      color: Colors.grey,
                    ),
                    SizedBox(
                      height: 80,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount:
                              snapshot.data!.resultProducts!.imageList!.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.only(right: 8.0),
                              child: Image.network(
                                snapshot
                                    .data!.resultProducts!.imageList![index],
                                height: 80,
                              ),
                            );
                          }),
                    ),
                    const Divider(
                      color: Colors.grey,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 30,
                            width: 100,
                            margin: const EdgeInsets.symmetric(vertical: 5),
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.yellow),
                            child: Center(
                                child: Text(
                                    data!.resultProducts!.extraFields![4])),
                          ),
                          Text(
                            data.resultProducts!.productName!,
                            style: TextStyle(fontSize: 25),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(left: 8.0),
                                    child: Text(
                                        "MRP- Rs.${data.resultProducts!.productPrice}"),
                                  ),
                                  Container(
                                    height: 30,
                                    width: 100,
                                    margin:
                                        const EdgeInsets.symmetric(vertical: 5),
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 5),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: Colors.red),
                                    child: const Center(
                                        child: Text(
                                      'Near to Expiry',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 10),
                                    )),
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        'Rs.${data.resultProducts!.discountDetails!.perPtr}',
                                        style: TextStyle(
                                            color: Colors.green, fontSize: 25),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        'Rs.${data.resultProducts!.productPrice}',
                                        style: TextStyle(
                                            color: Colors.black,
                                            decoration:
                                                TextDecoration.lineThrough,
                                            fontSize: 10),
                                      ),
                                    ],
                                  ),
                                  const Text(
                                    'Exclusive of GST',
                                    style: TextStyle(
                                        color: Colors.red, fontSize: 18),
                                  ),
                                ],
                              )
                            ],
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: ListTile(
                                  title: Text(
                                    'Expair Date',
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                  subtitle: Text(
                                    data.resultProducts!.expireDate.toString(),
                                    style: TextStyle(color: Colors.black),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: ListTile(
                                  title: Text(
                                    'Medicine Type',
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                  subtitle: Text(
                                    data.resultProducts!.extraFields![4],
                                    style: TextStyle(color: Colors.black),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: ListTile(
                                  title: Text(
                                    'Chemical Combination',
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                  subtitle: Text(
                                    data.resultProducts!.chemicalCombination!,
                                    style: TextStyle(color: Colors.black),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: ListTile(
                                  title: Text(
                                    'Country of Origin',
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                  subtitle: Text(
                                    data.resultProducts!.extraFields![0],
                                    style: TextStyle(color: Colors.black),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: ListTile(
                                  title: Text(
                                    'Min Order Qty',
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                  subtitle: Text(
                                    data.resultProducts!.minOrderQty.toString(),
                                    style: TextStyle(color: Colors.black),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: ListTile(
                                  title: Text(
                                    'Max Order Qty',
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                  subtitle: Text(
                                    data.resultProducts!.maxOrderQty.toString(),
                                    style: TextStyle(color: Colors.black),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: ListTile(
                                  title: Text(
                                    'Discount Type',
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                  subtitle: Text(
                                    data.resultProducts!.discountDetails!.type!,
                                    style: TextStyle(color: Colors.black),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: ListTile(
                                  title: Text(
                                    'GST',
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                  subtitle: Text(
                                    '${data.resultProducts!.discountFormDetails!.gstPercentage}%',
                                    style: TextStyle(color: Colors.black),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: const [
                              Expanded(
                                child: ListTile(
                                  title: Text(
                                    'BUY',
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                  subtitle: Text(
                                    '100',
                                    style: TextStyle(color: Colors.black),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: ListTile(
                                  title: Text(
                                    'GET',
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                  subtitle: Text(
                                    '1',
                                    style: TextStyle(color: Colors.black),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                );
              } else if (snapshot.hasData) {
                throw Exception('getting error');
              } else {
                return Center(child: CircularProgressIndicator());
              }
            }),
        bottomNavigationBar: Container(
          decoration: const BoxDecoration(
              boxShadow: CustomTheme.cardShadow, color: Colors.white),
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Row(
            children: [
              Container(
                width: 130,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                        onPressed: () {
                          setState(() {
                            productcount = productcount + 1;
                          });
                        },
                        icon: const Icon(Icons.add_circle)),
                    Text(
                      productcount.toString(),
                      style: TextStyle(fontSize: 20),
                    ),
                    IconButton(
                        onPressed: () {
                          productcount > 0
                              ? setState(() {
                                  productcount = productcount - 1;
                                })
                              : null;
                        },
                        icon: const Icon(Icons.remove_circle)),
                  ],
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              CupertinoButton(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                color: const Color.fromARGB(255, 93, 90, 241),
                child: const Text('Order Now'),
                onPressed: () {
                  QuickAlert.show(
                    context: context,
                    type: QuickAlertType.success,
                    text: 'You successfully placed the order',
                  );
                },
              ),
              const SizedBox(
                width: 10,
              ),
              CupertinoButton(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  color: const Color.fromARGB(255, 93, 90, 241),
                  child: const Text('Custom Order'),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return const CustomOrderScreen();
                    }));
                  })
            ],
          ),
        ));
  }
}
