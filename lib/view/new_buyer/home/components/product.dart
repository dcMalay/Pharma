import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pharma/view/new_buyer/home/components/productdetails.dart';
import 'package:quickalert/quickalert.dart';

import '../../../../const.dart';

List<Map<String, String>> productDate = [
  {
    "imageUrl":
        "https://newassets.apollo247.com/pub/media/catalog/product/t/o/ton0012.jpg",
    "title": "Tonact 5g tablets",
    "subtitle": "Sold by SLS farm",
    "MRP": "\$67.19",
    "PTR": "\$27.18"
  },
  {
    "imageUrl":
        "https://newassets.apollo247.com/pub/media/catalog/product/t/o/ton0012.jpg",
    "title": "Tonact 5g tablets",
    "subtitle": "Sold by SLS farm",
    "MRP": "\$67.19",
    "PTR": "\$27.18"
  },
  {
    "imageUrl":
        "https://newassets.apollo247.com/pub/media/catalog/product/t/o/ton0012.jpg",
    "title": "Tonact 5g tablets",
    "subtitle": "Sold by SLS farm",
    "MRP": "\$67.19",
    "PTR": "\$27.18"
  },
  {
    "imageUrl":
        "https://newassets.apollo247.com/pub/media/catalog/product/t/o/ton0012.jpg",
    "title": "Tonact 5g tablets",
    "subtitle": "Sold by SLS farm",
    "MRP": "\$67.19",
    "PTR": "\$27.18"
  },
  {
    "imageUrl":
        "https://newassets.apollo247.com/pub/media/catalog/product/t/o/ton0012.jpg",
    "title": "Tonact 5g tablets",
    "subtitle": "Sold by SLS farm",
    "MRP": "\$67.19",
    "PTR": "\$27.18"
  },
];

class ProductCard extends StatelessWidget {
  const ProductCard({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: ListView.builder(
          physics: BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemCount: productDate.length,
          itemBuilder: (context, index) {
            var currentItem = productDate[index];
            return InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const ProductDetails();
                }));
              },
              child: Container(
                width: 310,
                margin: const EdgeInsets.all(10),
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
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
                        Image.network(
                          "${currentItem['imageUrl']}",
                          height: 60,
                        ),
                        SizedBox(
                          height: 50,
                          width: 180,
                          child: ListTile(
                              title: Text(
                                "${currentItem['title']}",
                                style: const TextStyle(
                                  color: Color.fromARGB(255, 93, 90, 241),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 19,
                                ),
                              ),
                              subtitle: Text(
                                "${currentItem['subtitle']}",
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
                                color: Color.fromARGB(255, 202, 202, 255),
                              ),
                            ),
                            Text(
                              "${currentItem['MRP']}",
                            )
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Text(
                              "PTR",
                              style: TextStyle(
                                color: Color.fromARGB(255, 202, 202, 255),
                              ),
                            ),
                            Text(
                              "${currentItem['PTR']}",
                            )
                          ],
                        ),
                        SizedBox(
                          width: 150,
                          height: 50,
                          child: CupertinoButton(
                            padding: const EdgeInsets.all(0),
                            color: const Color.fromARGB(255, 93, 90, 241),
                            child: Text(
                              'Add to Bag',
                              style: TextStyle(color: Colors.white),
                            ),
                            onPressed: () {
                              QuickAlert.show(
                                context: context,
                                type: QuickAlertType.success,
                                text: 'Product successfully added to your bag',
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
          }),
    );
  }
}
