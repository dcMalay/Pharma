import 'dart:math';

import 'package:flutter/material.dart';
import 'package:pharma/const.dart';
import 'package:pharma/query/buyer/products/get_category_products.dart';
import 'package:pharma/query/seller/product/get_user_products.dart';
import 'package:pharma/view/buyer/cart/cart.dart';
import 'package:pharma/view/buyer/home/components/card_view.dart';
import 'package:pharma/view/buyer/home/components/cart_button.dart';
import 'package:pharma/view/buyer/home/search_products.dart';

class BuyerProductList extends StatefulWidget {
  final String? categoryName;
  final String? subCategoryName;
  const BuyerProductList({
    Key? key,
    this.categoryName,
    this.subCategoryName,
  }) : super(key: key);

  @override
  State<BuyerProductList> createState() => _BuyerProductListState();
}

class _BuyerProductListState extends State<BuyerProductList> {
  GetProductsModel? dsValue;
  @override
  void initState() {
    buyerGetCategoryProductMethod(context,
            params: ParamsCategoryProducts(
                category: widget.categoryName,
                subCategory: widget.subCategoryName))
        .then((value) {
      setState(() {
        dsValue = value;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          shadowColor: primaryColor.withOpacity(0.1),
          backgroundColor: Colors.white,
          centerTitle: true,
          leading: const BackButton(
            color: Colors.black,
          ),
          title: Text(
            widget.subCategoryName!,
            style: const TextStyle(color: Colors.black),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
              child: InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return SearchProduct(
                        isCategorySearch: true,
                        category: widget.categoryName,
                        subCategory: widget.subCategoryName,
                      );
                    },
                  ));
                },
                child: Container(
                  width: 40,
                  height: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: primaryColor.withOpacity(0.1)),
                  child: Center(
                    child: Icon(
                      Icons.search,
                      color: primaryColor,
                    ),
                  ),
                ),
              ),
            ),
            CartButton()
          ],
        ),
        body: dsValue == null
            ? Center(
                child: CircularProgressIndicator(),
              )
            : dsValue!.resultProducts!.isEmpty
                ? Center(child: Text("No Products"))
                : GridView.builder(
                    itemCount: dsValue!.resultProducts!.length,
                    padding: const EdgeInsets.all(5),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2),
                    itemBuilder: (context, index) {
                      var ds = dsValue!.resultProducts![index];
                      return CardView(
                        ds: ds,
                      );
                    }));
  }
}
