import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pharma/data/model/products_model.dart';
import 'package:pharma/data/repository/get_products_repo.dart';
import 'package:pharma/view/new_buyer/home/components/productdetails.dart';
import 'package:quickalert/quickalert.dart';
import '../../../../const.dart';

List<Map<String, String>> productDate = [
  {
    "imageUrl":
        "https://newassets.apollo247.com/pub/media/catalog/product/t/o/ton0012.jpg",
    "title": "Tonact 5g tablets",
    "subtitle": "Sold by SLS farm",
    "MRP": "Rs.67.19",
    "PTR": "Rs.27.18"
  },
  {
    "imageUrl":
        "https://newassets.apollo247.com/pub/media/catalog/product/t/o/ton0012.jpg",
    "title": "Tonact 5g tablets",
    "subtitle": "Sold by SLS farm",
    "MRP": "Rs.67.19",
    "PTR": "Rs.27.18"
  },
  {
    "imageUrl":
        "https://newassets.apollo247.com/pub/media/catalog/product/t/o/ton0012.jpg",
    "title": "Tonact 5g tablets",
    "subtitle": "Sold by SLS farm",
    "MRP": "Rs.67.19",
    "PTR": "Rs.27.18"
  },
  {
    "imageUrl":
        "https://newassets.apollo247.com/pub/media/catalog/product/t/o/ton0012.jpg",
    "title": "Tonact 5g tablets",
    "subtitle": "Sold by SLS farm",
    "MRP": "Rs.67.19",
    "PTR": "Rs.27.18"
  },
  {
    "imageUrl":
        "https://newassets.apollo247.com/pub/media/catalog/product/t/o/ton0012.jpg",
    "title": "Tonact 5g tablets",
    "subtitle": "Sold by SLS farm",
    "MRP": "Rs.67.19",
    "PTR": "Rs.27.18"
  },
];

class ProductCard extends StatefulWidget {
  const ProductCard({super.key});

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  late Future<List<dynamic>> product;

  @override
  void initState() {
    super.initState();
    product = getProducts();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: FutureBuilder<List<dynamic>>(
          future: product,
          builder: (context, snapshot) {
            print(snapshot.data);
            if (snapshot.hasData) {
              print(snapshot.data);
              List<dynamic>? productsData = snapshot.data;
              return ListView.builder(
                  physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: productsData!.length,
                  itemBuilder: (context, index) {
                    // var currentItem = productDate[index];
                    var currentData = productsData[index];
                    print('dataFROM---->>${currentData["image_list"]}');
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
                        width: 310,
                        margin: const EdgeInsets.all(10),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: greyColor,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
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
                                SizedBox(
                                  height: 50,
                                  width: 180,
                                  child: ListTile(
                                      title: Text(
                                        currentData["product_name"],
                                        // "${currentItem['title']}",
                                        style: const TextStyle(
                                          color:
                                              Color.fromARGB(255, 93, 90, 241),
                                          fontWeight: FontWeight.bold,
                                          fontSize: 19,
                                        ),
                                      ),
                                      subtitle: SizedBox(
                                        width: 50,
                                        child: Text(
                                          currentData['categories']
                                              ['category_name'],
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          softWrap: false,
                                          // "${currentItem['subtitle']}",
                                        ),
                                      )),
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    const Text(
                                      "MRP",
                                      style: TextStyle(
                                        color:
                                            Color.fromARGB(255, 202, 202, 255),
                                      ),
                                    ),
                                    Text(
                                      currentData['product_price'].toString(),
                                    )
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    const Text(
                                      "PTR",
                                      style: TextStyle(
                                        color:
                                            Color.fromARGB(255, 202, 202, 255),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 50,
                                      child: Text(
                                        currentData['discount_details']
                                                ['final_ptr']
                                            .toString(),
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        softWrap: false,
                                      ),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  width: 150,
                                  height: 50,
                                  child: CupertinoButton(
                                    padding: const EdgeInsets.all(0),
                                    color:
                                        const Color.fromARGB(255, 93, 90, 241),
                                    child: Text(
                                      'Add to Bag',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    onPressed: () {
                                      QuickAlert.show(
                                        context: context,
                                        type: QuickAlertType.success,
                                        text:
                                            'Product successfully added to your bag',
                                      );
                                    },
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    );
                  });
            } else if (snapshot.hasData) {
              throw Exception('getting error');
            } else {
              return Center(child: CircularProgressIndicator());
            }
          }),
    );
  }
}
