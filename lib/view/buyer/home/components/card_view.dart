import 'package:flutter/material.dart';
import 'package:pharma/const.dart';
import 'package:pharma/view/buyer/home/product_view.dart';
import 'package:pharma/query/seller/product/get_user_products.dart';

class CardView extends StatelessWidget {
  final ResultProducts ds;
  const CardView({Key? key, required this.ds}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shadowColor: primaryColor.withOpacity(0.1),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
      child: InkWell(
        borderRadius: BorderRadius.circular(10),
        onTap: () {
          Navigator.push(context, MaterialPageRoute(
            builder: (context) {
              return BuyerProductView(
                productId: ds.sId!,
              );
            },
          ));
        },
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: ds.imageList!.isEmpty
                    ? Container(
                        width: 100,
                        height: 100,
                        child: Center(
                          child: Text("No Image"),
                        ),
                      )
                    : Image.network(
                        ds.imageList![0],
                        height: 100,
                      ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      ds.productName!,
                      maxLines: 2,
                      style: TextStyle(fontSize: 11),
                    ),
                    const SizedBox(
                      height: 3,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "PTR: ${(ds.discountDetails!.ptrPer!)}",
                          style: TextStyle(color: greyColor, fontSize: 11),
                        ),
                        Text(
                          "MRP ${ds.productPrice}",
                          style: TextStyle(color: greyColor, fontSize: 11),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
