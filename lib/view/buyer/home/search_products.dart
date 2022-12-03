import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:pharma/const.dart';
import 'package:pharma/provider/product_search.dart';
import 'package:pharma/query/buyer/products/get_user_products_by_search.dart';
import 'package:pharma/view/buyer/home/components/card_view.dart';
import 'package:pharma/view/buyer/home/product_view.dart';
import 'package:provider/provider.dart';

class SearchProduct extends StatefulWidget {
  final String? category;
  final String? subCategory;
  final bool isCategorySearch;

  const SearchProduct(
      {Key? key,
      this.category,
      this.subCategory,
      required this.isCategorySearch})
      : super(key: key);

  @override
  State<SearchProduct> createState() => _SearchProductState();
}

class _SearchProductState extends State<SearchProduct> {
  @override
  void initState() {
    Provider.of<BuyerProductProvider>(context, listen: false)
        .searchStock(context, "/all/data");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<BuyerProductProvider>(builder: (context, value, snapshot) {
      return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          shadowColor: primaryColor.withOpacity(0.1),
          iconTheme: IconThemeData(color: Colors.black),
          backgroundColor: Colors.white,
          title: TextField(
            onChanged: (v) {
              if (v.isEmpty) {
                value.searchStock(context, "/all/data");
              } else if (widget.isCategorySearch) {
                value.searchStockWithcategory(
                    context,
                    v,
                    ParamsCategoryProducts(
                      category: widget.category,
                      subCategory: widget.subCategory,
                    ));
              } else {
                value.searchStock(context, v);
              }
            },
            decoration: InputDecoration(
                hintText: "Search product by name",
                isDense: true,
                border: InputBorder.none,
                enabledBorder: InputBorder.none),
          ),
        ),
        body: value.dsValue == null
            ? Center(
                child: CircularProgressIndicator(),
              )
            : value.dsValue!.resultProducts!.length == 0
                ? Center(
                    child: Text("No products found"),
                  )
                : ListView.builder(
                    itemCount: value.dsValue!.resultProducts!.length,
                    itemBuilder: (context, index) {
                      return Card(
                        shadowColor: primaryColor.withOpacity(0.1),
                        child: ListTile(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => BuyerProductView(
                                  productId: value
                                      .dsValue!.resultProducts![index].sId!,
                                ),
                              ),
                            );
                          },
                          leading: value.dsValue!.resultProducts![index]
                                      .imageList !=
                                  null
                              ? value.dsValue!.resultProducts![index].imageList!
                                      .isEmpty
                                  ? Container(
                                      height: 55,
                                      width: 55,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          color: Colors.grey.withOpacity(0.1)),
                                      child: Center(
                                        child: Text(
                                          "No Image",
                                          style: TextStyle(
                                            fontSize: 10,
                                          ),
                                        ),
                                      ),
                                    )
                                  : Image.network(
                                      value.dsValue!.resultProducts![index]
                                          .imageList![0],
                                      height: 55,
                                      width: 55,
                                    )
                              : Container(
                                  height: 50,
                                  width: 50,
                                  child: Center(
                                    child: Text(
                                      "No Image",
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                          title: Text(value
                              .dsValue!.resultProducts![index].productName!),
                          subtitle: Text(value
                              .dsValue!.resultProducts![index].companyName!),
                        ),
                      );
                    },
                  ),
      );
    });
  }
}
