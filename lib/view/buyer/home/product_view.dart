import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:pharma/components/outlined_textfield.dart';
import 'package:pharma/const.dart';
import 'package:pharma/provider/cart.dart';
import 'package:pharma/query/buyer/cart/add_cart.dart';
import 'package:pharma/query/buyer/global.dart';
import 'package:pharma/query/buyer/products/get_product_id.dart';
import 'package:pharma/query/seller/product/get_user_products.dart';
import 'package:pharma/view/buyer/home/components/cart_button.dart';
import 'package:pharma/view/buyer/home/components/image_viewer.dart';

import '../cart/cart.dart';

class BuyerProductView extends StatefulWidget {
  final String productId;
  BuyerProductView({Key? key, required this.productId}) : super(key: key);

  @override
  State<BuyerProductView> createState() => _BuyerProductViewState();
}

class _BuyerProductViewState extends State<BuyerProductView> {
  PageController pageView = PageController();
  GetProductModel? dsValue;
  List<ExtraFields> extraFields = [];
  TextEditingController _controller = TextEditingController();
// cart details
  num cart = 1;
// --------------------------------------------------------
  int currentPage = 0;
  @override
  void initState() {
    buyerGetProductWithIdMethod(context, id: widget.productId).then((value) {
      setState(() {
        dsValue = value;
        cart = dsValue!.resultProducts!.minOrderQty!;
        _controller.text = cart.toString();
        for (var element in dsValue!.resultProducts!.extraFields!) {
          if (element.key == 'Expire Date' ||
              element.key == 'Medicine Type' ||
              element.key == 'Chemical Combination' ||
              element.key == 'Country of Origin' ||
              element.key == 'Min Order Qty' ||
              element.key == 'Max Order Qty' ||
              element.key == 'Gst' ||
              element.key == 'Discount Type') {
            if (extraFields.where((v) => v.key == element.key).isNotEmpty) {
            } else if (element.key == "Gst") {
              extraFields.add(ExtraFields(
                key: element.key,
                value: element.value.toString() + "%",
              ));
            } else if (element.key == "Discount Type") {
              print(element.key);
              if (element.value == "Same Product Bonus") {
                extraFields.add(ExtraFields(
                  key: element.key,
                  value: element.value.toString() +
                      " (" +
                      dsValue!.resultProducts!.discountFormDetails!.buy
                          .toString() +
                      " + " +
                      dsValue!.resultProducts!.discountFormDetails!.get
                          .toString() +
                      ")",
                ));
              } else {
                extraFields.add(ExtraFields(
                    key: element.key, value: element.value.toString()));
              }
            } else {
              if (element.value!.isNotEmpty) {
                extraFields.add(element);
              }
            }
          }
        }
        for (var element
            in dsValue!.resultProducts!.discountFormDetails!.toJson().entries) {
          if (element.key == 'get' ||
              element.key == 'buy' ||
              element.key == 'producName' ||
              element.key == 'discountOnPtrOnlyPercenatge') {
            if (extraFields.where((v) => v.key == element.key).isNotEmpty) {}
            if (element.key == "discountOnPtrOnlyPercenatge") {
              if (element.value != null) {
                extraFields.add(ExtraFields(
                  key: "Discount",
                  value: element.value.toString() + "%",
                ));
              }
            } else {
              if (element.value != null) {
                extraFields.add(ExtraFields(
                  key: element.key.toUpperCase(),
                  value: element.value.toString(),
                ));
              }
            }
          }
        }
      });
      // print();
      // print(DateTime.now().toLocal().microsecondsSinceEpoch -
      //     DateTime.parse(dsValue!.resultProducts!.expireDate!)
      //         .toLocal()
      //         .microsecondsSinceEpoch);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return dsValue == null
        ? Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          )
        : dsValue!.status != 200
            ? Scaffold(
                body: Center(
                  child: dsValue!.message != null
                      ? Text(dsValue!.message!)
                      : Text("No Products"),
                ),
              )
            : Scaffold(
                appBar: AppBar(
                  shadowColor: primaryColor.withOpacity(0.1),
                  backgroundColor: Colors.white,
                  centerTitle: true,
                  leading: const BackButton(
                    color: Colors.black,
                  ),
                  title: const Text(
                    "PharmaBag",
                    style: TextStyle(color: Colors.black),
                  ),
                  actions: [CartButton()],
                ),
                body: Column(
                  children: [
                    Expanded(
                      child: ListView(
                        children: [
                          SizedBox(
                            height: MediaQuery.of(context).size.height / 2.5,
                            child: PageView.builder(
                                onPageChanged: (value) {
                                  setState(() {
                                    currentPage = value;
                                  });
                                },
                                controller: pageView,
                                itemCount:
                                    dsValue!.resultProducts!.imageList!.length,
                                itemBuilder: (context, snapshot) {
                                  return InkWell(
                                    onTap: () {
                                      Navigator.push(context, MaterialPageRoute(
                                        builder: (context) {
                                          return ImageViewer(
                                              imageUrl: dsValue!.resultProducts!
                                                  .imageList![snapshot]);
                                        },
                                      ));
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                              image: NetworkImage(dsValue!
                                                  .resultProducts!
                                                  .imageList![snapshot]))),
                                    ),
                                  );
                                }),
                          ),
                          const Divider(),
                          SizedBox(
                            height: 85,
                            child: ListView.builder(
                              itemCount:
                                  dsValue!.resultProducts!.imageList!.length,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                var ds =
                                    dsValue!.resultProducts!.imageList![index];
                                return Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: InkWell(
                                    onTap: () {
                                      pageView.animateToPage(index,
                                          duration: const Duration(seconds: 1),
                                          curve: Curves.ease);
                                      setState(() {});
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                          border: currentPage == index
                                              ? Border.all(
                                                  color: blackColor
                                                      .withOpacity(0.5),
                                                  width: 2)
                                              : null),
                                      child: Image.network(
                                        ds,
                                        width: 60,
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                          const Divider(),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 5),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                            color: Colors.orange,
                                            borderRadius:
                                                BorderRadius.circular(12)),
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 8, vertical: 4),
                                        child: Text(
                                          dsValue!.resultProducts!.categories!
                                              .categoryName!,
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 12),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        dsValue!.resultProducts!.productName!,
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20),
                                      ),
                                      // SizedBox(
                                      //   height: 3,
                                      // ),
                                      // Container(
                                      //   decoration: BoxDecoration(
                                      //       color: Colors.grey,
                                      //       borderRadius: BorderRadius.circular(12)),
                                      //   padding:
                                      //       EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                      //   child: Text(
                                      //     "SLS Pharma",
                                      //     style: TextStyle(color: Colors.white, fontSize: 12),
                                      //   ),
                                      // ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 5),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              Text(
                                                "MRP",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 12,
                                                    color: Colors.red),
                                              ),
                                              Text(
                                                "-",
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 12,
                                                ),
                                              ),
                                              Text(
                                                "₹${dsValue!.resultProducts!.productPrice}",
                                                style: TextStyle(
                                                    color: greenColor,
                                                    fontSize: 12,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 2,
                                          ),
                                          DateTime.now()
                                                      .microsecondsSinceEpoch >
                                                  DateTime.parse(dsValue!
                                                          .resultProducts!
                                                          .expireDate!)
                                                      .toLocal()
                                                      .microsecondsSinceEpoch
                                              ? Container(
                                                  decoration: BoxDecoration(
                                                      color: Colors.green,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5)),
                                                  padding: const EdgeInsets
                                                          .symmetric(
                                                      horizontal: 5,
                                                      vertical: 2),
                                                  child: Text(
                                                    "Usable",
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 10),
                                                  ),
                                                )
                                              : Container(
                                                  decoration: BoxDecoration(
                                                      color: Colors.red,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5)),
                                                  padding: const EdgeInsets
                                                          .symmetric(
                                                      horizontal: 5,
                                                      vertical: 2),
                                                  child: Text(
                                                    "Expire",
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 10),
                                                  ),
                                                ),
                                        ],
                                      ),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          Row(
                                            children: [
                                              Text(
                                                "₹${dsValue!.resultProducts!.discountDetails!.ptrPer!}",
                                                style: TextStyle(
                                                    color: greenColor,
                                                    fontSize: 20,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              const SizedBox(
                                                width: 5,
                                              ),
                                              Text(
                                                "₹${dsValue!.resultProducts!.productPrice!}",
                                                style: TextStyle(
                                                    color: blackColor,
                                                    fontSize: 12,
                                                    decoration: TextDecoration
                                                        .lineThrough,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ],
                                          ),
                                          Text(
                                            "Exclusive of GST",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 12,
                                                color: Colors.red),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                Wrap(
                                  children: [
                                    for (var item in extraFields)
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width /
                                                    2 -
                                                20,
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                item.key!,
                                                style:
                                                    TextStyle(color: greyColor),
                                              ),
                                              Text(
                                                item.value!,
                                                style: const TextStyle(
                                                    color: blackColor,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              )
                                            ],
                                          ),
                                        ),
                                      )
                                  ],
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Card(
                      elevation: 10,
                      margin: EdgeInsets.all(0),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Container(
                          height: 50,
                          child: Row(
                            children: [
                              Expanded(
                                child: Row(
                                  children: [
                                    IconButton(
                                        onPressed: () {
                                          if (cart > 0) {
                                            if (dsValue!.resultProducts!
                                                    .minOrderQty! <
                                                cart) {
                                              setState(() {
                                                cart--;
                                                _controller.text =
                                                    cart.toString();
                                              });
                                            } else {
                                              BuyerGlobalHandler.snackBar(
                                                  context: context,
                                                  isError: true,
                                                  message:
                                                      "Minimum Order Quantity is ${dsValue!.resultProducts!.minOrderQty}");
                                            }
                                          }
                                          // setState(() {
                                          //   cart--;
                                          // });
                                        },
                                        icon: const Icon(Icons.remove)),
                                    Expanded(
                                      child: TextField(
                                        controller: _controller,
                                        keyboardType: TextInputType.number,
                                        onChanged: (value) {
                                          var cartValue = 0;
                                          if (value.isNotEmpty) {
                                            cartValue = int.parse(value);
                                            cart = cartValue;
                                          }

                                          if (cartValue > 0) {
                                            if (dsValue!.resultProducts!
                                                    .minOrderQty! >
                                                cartValue) {
                                              BuyerGlobalHandler.snackBar(
                                                  context: context,
                                                  isError: true,
                                                  message:
                                                      "Minimum Order Quantity is ${dsValue!.resultProducts!.minOrderQty}");
                                              // setState(() {
                                              //   cart = int.parse(value);
                                              // });
                                            }
                                          }

                                          if (dsValue!.resultProducts!
                                                  .maxOrderQty! <
                                              cartValue) {
                                            BuyerGlobalHandler.snackBar(
                                                context: context,
                                                isError: true,
                                                message:
                                                    "Maximum Order Quantity is ${dsValue!.resultProducts!.maxOrderQty}");
                                          }
                                          setState(() {});
                                        },
                                        decoration: InputDecoration(
                                          border: InputBorder.none,
                                          hintText: "Quantity",
                                          hintStyle: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                    // Container(
                                    //   padding: EdgeInsets.symmetric(
                                    //       horizontal: 20, vertical: 5),
                                    //   decoration: BoxDecoration(
                                    //       color: Colors.grey.shade100,
                                    //       borderRadius: BorderRadius.circular(10)),
                                    //   child: Center(child: Text(cart.toString())),
                                    // ),
                                    IconButton(
                                        onPressed: () {
                                          if (dsValue!.resultProducts!
                                                  .maxOrderQty! >
                                              cart) {
                                            setState(() {
                                              cart++;
                                              _controller.text =
                                                  cart.toString();
                                            });
                                          } else {
                                            BuyerGlobalHandler.snackBar(
                                                context: context,
                                                isError: true,
                                                message:
                                                    "Maximum Order Quantity is ${dsValue!.resultProducts!.maxOrderQty}");
                                          }
                                        },
                                        icon: const Icon(Icons.add)),
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                child: InkWell(
                                  onTap: !onSubmit()
                                      ? null
                                      : () {
                                          CartProviderCallBack.addCart(context,
                                              params: ParamsCart(
                                                  productId: widget.productId,
                                                  quantity: cart.toString(),
                                                  priceDetails: jsonEncode(
                                                    dsValue!.resultProducts!
                                                        .discountFormDetails,
                                                  )));
                                        },
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: getColor(),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: const Center(
                                      child: Text(
                                        "Add to Cart",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 17,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
  }

  Color getColor() {
    if (cart > 0) {
      if (dsValue!.resultProducts!.minOrderQty! > cart) {
        return Colors.grey;
        // setState(() {
        //   cart = int.parse(value);
        // });
      }
    }

    if (dsValue!.resultProducts!.maxOrderQty! < cart) {
      return Colors.grey;
    }
    return primaryColor;
  }

  bool onSubmit() {
    if (cart > 0) {
      if (dsValue!.resultProducts!.minOrderQty! > cart) {
        return false;
        // setState(() {
        //   cart = int.parse(value);
        // });
      }
    }

    if (dsValue!.resultProducts!.maxOrderQty! < cart) {
      return false;
    }
    return true;
  }
}
