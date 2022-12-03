import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:pharma/const.dart';
import 'package:pharma/provider/cart.dart';
import 'package:pharma/query/buyer/cart/get_cart.dart';
import 'package:intl/intl.dart';
import 'package:pharma/query/buyer/global.dart';

class CartCard extends StatefulWidget {
  final ResultCart ds;
  const CartCard({Key? key, required this.ds}) : super(key: key);

  @override
  State<CartCard> createState() => _CartCardState();
}

class _CartCardState extends State<CartCard> {
  int quantity = 0;
  TextEditingController _controller = TextEditingController();
  @override
  void initState() {
    setState(() {
      _controller.text = widget.ds.quantity.toString();
      quantity = widget.ds.quantity!;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final DateTime date = DateTime.parse(widget.ds.expireDate!);
    final DateFormat formatter = DateFormat('dd MMMM yyyy');
    final String formatted = formatter.format(date);
    final now = DateTime.now();
    final expirationDate = DateTime.parse(widget.ds.expireDate!);
    final bool isExpired = expirationDate.isBefore(now);
    return Card(
      elevation: 5,
      shadowColor: primaryColor.withOpacity(0.1),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ListTile(
              leading: widget.ds.productImage == null
                  ? Container(
                      height: 50,
                      width: 50,
                      child: Center(
                        child: Text(
                          "No Image",
                          style: TextStyle(fontSize: 10),
                        ),
                      ),
                    )
                  : Image.network(
                      widget.ds.productImage!,
                      width: 50,
                      height: 50,
                    ),
              title: Text(widget.ds.productName!,
                  style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold)),
              subtitle: Text(
                formatted,
              ),
              dense: true,
              trailing: Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                  decoration: BoxDecoration(
                      // border: Border.all(color: primaryColor, width: 2),
                      borderRadius: BorderRadius.circular(5),
                      color: isExpired
                          ? red.withOpacity(0.1)
                          : greenColor.withOpacity(0.1)),
                  child: Text(
                    isExpired ? "Expired" : "Usable",
                    style: TextStyle(
                        fontSize: 12,
                        color: isExpired ? red : greenColor,
                        fontWeight: FontWeight.bold),
                  )),
            ),
            Divider(
              height: 1,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  for (var i = 0; i < widget.ds.details!.length; i++)
                    Row(
                      children: [
                        Expanded(
                          child: Row(
                            children: [
                              Text(
                                widget.ds.details![i].key! + " :",
                                style:
                                    TextStyle(color: blackColor, fontSize: 11),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: Text(
                              (widget.ds.details![i].key! == "Discount Type"
                                      ? ""
                                      : "₹ ") +
                                  widget.ds.details![i].value!,
                              style: TextStyle(
                                  fontSize: 12, fontWeight: FontWeight.w400),
                            ),
                          ),
                        ),
                      ],
                    ),
                ],
              ),
            ),
            // Divider(
            //   height: 1,
            // ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      // CircleAvatar(
                      //     backgroundColor: Colors.white,
                      //     radius: 10,
                      //     child: InkWell(
                      //       onTap: () {
                      //         if (quantity > 0) {
                      //           if (widget.ds.minOrderQty! < quantity) {
                      //             setState(() {
                      //               quantity--;
                      //             });
                      //           }
                      //         }
                      //       },
                      //       child: Icon(
                      //         Icons.remove,
                      //         color: Colors.black,
                      //         size: 17,
                      //       ),
                      //     )),
                      Container(
                          width: 100,
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              color: greyColor.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(5)),
                          child: Row(
                            children: [
                              Expanded(
                                child: TextField(
                                  controller: _controller,
                                  keyboardType: TextInputType.number,
                                  inputFormatters: [
                                    // WhitelistingTextInputFormatter.digitsOnly
                                  ],
                                  decoration: InputDecoration(
                                      isDense: true,
                                      border: InputBorder.none,
                                      contentPadding: EdgeInsets.symmetric(
                                          horizontal: 10, vertical: 5)),
                                  onChanged: (value) {
                                    var cartValue = 0;
                                    if (value.isNotEmpty) {
                                      cartValue = int.parse(value);
                                      quantity = cartValue;
                                    }

                                    if (cartValue > 0) {
                                      if (widget.ds.minOrderQty! > cartValue) {
                                        BuyerGlobalHandler.snackBar(
                                            context: context,
                                            isError: true,
                                            message:
                                                "Minimum Order Quantity is ${widget.ds.minOrderQty}");
                                      }
                                    }

                                    if (widget.ds.maxOrderQty! < cartValue) {
                                      BuyerGlobalHandler.snackBar(
                                          context: context,
                                          isError: true,
                                          message:
                                              "Maximum Order Quantity is ${widget.ds.maxOrderQty}");
                                    }
                                    setState(() {});
                                  },
                                ),
                              ),
                              InkWell(
                                onTap: !onSubmit()
                                    ? null
                                    : () async {
                                        print("erun");
                                        await CartProviderCallBack(context)
                                            .updateCart(widget.ds.cartId!,
                                                quantity.toString());
                                        CartProviderCallBack(context)
                                            .notListener
                                            .getCartMethodProvider(context);
                                      },
                                child: Icon(
                                  Icons.done,
                                  color: getColor(),
                                  size: 17,
                                ),
                              ),
                            ],
                          ))
                      // CircleAvatar(
                      //     backgroundColor: Colors.white,
                      //     radius: 10,
                      //     child: InkWell(
                      //       onTap: () {
                      //         if (widget.ds.maxOrderQty! > quantity) {
                      //           setState(() {
                      //             quantity++;
                      //           });
                      //         }
                      //       },
                      //       child: Icon(
                      //         Icons.add,
                      //         color: Colors.black,
                      //         size: 17,
                      //       ),
                      //     )),
                    ],
                  ),
                  InkWell(
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: Text("Are you sure?"),
                              content: Text("Delete this item from cart?"),
                              actions: [
                                TextButton(
                                  child: Text("Cancel"),
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                ),
                                TextButton(
                                  child: Text("Delete"),
                                  onPressed: () async {
                                    // print(widget.ds.cartId!);
                                    await CartProviderCallBack(context)
                                        .delCart(widget.ds.cartId!);
                                    CartProviderCallBack(context)
                                        .notListener
                                        .getCartMethodProvider(context);

                                    Navigator.pop(context);

                                    // deleteCart(widget.ds.id!);
                                  },
                                ),
                              ],
                            );
                          });
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 5, vertical: 3),
                      decoration: BoxDecoration(
                          border:
                              Border.all(color: greyColor.withOpacity(0.2))),
                      child: Text(
                        "Remove",
                        style: TextStyle(
                            fontSize: 11, fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                ],
              ),
            )
            // SizedBox(
            //   height: 10,
            // )
          ],
        ),
      ),
    );
  }

  Color getColor() {
    if (quantity > 0) {
      if (widget.ds.minOrderQty! > quantity) {
        return Colors.grey;
        // setState(() {
        //   quantity = int.parse(value);
        // });
      }
    }

    if (widget.ds.maxOrderQty! < quantity) {
      return Colors.grey;
    }
    return primaryColor;
  }

  bool onSubmit() {
    if (quantity > 0) {
      if (widget.ds.minOrderQty! > quantity) {
        return false;
        // setState(() {
        //   quantity = int.parse(value);
        // });
      }
    }

    if (widget.ds.maxOrderQty! < quantity) {
      return false;
    }
    return true;
  }
}
