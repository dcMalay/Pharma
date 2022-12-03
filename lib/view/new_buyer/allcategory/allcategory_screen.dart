import 'package:flutter/material.dart';

import 'components/category_data.dart';
import 'components/subcategory.dart';

class Allcategory extends StatefulWidget {
  const Allcategory({Key? key}) : super(key: key);

  @override
  State<Allcategory> createState() => _AllcategoryState();
}

class _AllcategoryState extends State<Allcategory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 1,
        backgroundColor: Colors.white,
        title: const Text(
          "All Category",
          style: TextStyle(
            color: Color.fromARGB(255, 93, 90, 241),
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: ListView.builder(
          itemCount: categoryData.length,
          itemBuilder: (context, index) {
            var item = categoryData[index];
            return InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return Subcategory(category: item["categoryName"]);
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
                    "${item["categoryName"]}",
                    style: const TextStyle(fontSize: 15),
                  ),
                ),
              ),
            );
          }),
    );
  }
}
