import 'package:flutter/material.dart';

import '../../../../const.dart';
import '../../home/components/allproducts.dart';
import 'category_data.dart';

class Subcategory extends StatefulWidget {
  const Subcategory({super.key, required this.category});
  final String category;
  @override
  State<Subcategory> createState() => _SubcategoryState();
}

class _SubcategoryState extends State<Subcategory> {
  List<Map<String, dynamic>> data = [];

  @override
  void initState() {
    filter(widget.category);
    super.initState();
  }

  void filter(String categoryName) {
    List<Map<String, dynamic>> result = [];
    result = categoryData
        .where((data) => data['categoryName'].contains(categoryName))
        .toList();
    setState(() {
      data = result;
    });
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
          backgroundColor: Colors.white,
          title: Text(
            widget.category,
            style: const TextStyle(color: Colors.black),
          )),
      body: ListView.builder(
          itemCount: data.length,
          itemBuilder: (context, index) {
            var item = data[index]['subcategoryName'];
            return SizedBox(
              height: 750,
              child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                  ),
                  scrollDirection: Axis.vertical,
                  itemCount: item.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return const AllProducts();
                        }));
                      },
                      child: Container(
                        height: 60,
                        width: 50,
                        margin: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 227, 227, 255),
                            borderRadius: BorderRadius.circular(20)),
                        child: Center(
                          child: Text(
                            item[index],
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    );
                  }),
            );
          }),
    );
  }
}
