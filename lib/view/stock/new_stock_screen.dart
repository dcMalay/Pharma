import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../const.dart';
import '../new_buyer/filter_products/filter_products_screen.dart';
import '../new_buyer/home/components/productdetails.dart';
import '../new_buyer/theme/custom_theme.dart';

class NewStockScreen extends StatefulWidget {
  const NewStockScreen({super.key});

  @override
  State<NewStockScreen> createState() => _NewStockScreenState();
}

class _NewStockScreenState extends State<NewStockScreen> {
  @override
  Widget build(BuildContext context) {
    var _dropDownValue;
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
        centerTitle: true,
        backgroundColor: Colors.white,
        title: const Text(
          'All Products',
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const FilterProductsScreen(
                    isSeller: true,
                  );
                }));
              },
              child: Icon(
                Icons.tune_outlined,
                color: primaryColor,
                size: 30,
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: 60,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  DropdownButton(
                    borderRadius: BorderRadius.circular(6),
                    value: _dropDownValue,
                    hint: const Text('12'),
                    items: [
                      DropdownMenuItem<String>(value: '12', child: Text('12')),
                      DropdownMenuItem<String>(value: '24', child: Text('24')),
                      DropdownMenuItem<String>(value: '36', child: Text('36')),
                    ],
                    onChanged: (items) {},
                  ),
                  DropdownButton(
                    value: _dropDownValue,
                    hint: const Text('Default'),
                    items: [
                      DropdownMenuItem<String>(
                          value: 'Default', child: Text('Default')),
                      DropdownMenuItem<String>(
                          value: 'Name', child: Text('Name')),
                      DropdownMenuItem<String>(
                          value: 'New Item', child: Text('New Item')),
                      DropdownMenuItem<String>(
                          value: 'Best Price', child: Text('Best Price')),
                      DropdownMenuItem<String>(
                          value: 'Discount (High-Low)',
                          child: Text('Discount (High-Low)')),
                      DropdownMenuItem<String>(
                          value: 'Discount (Low-High)',
                          child: Text('Discount (Low-High)')),
                      DropdownMenuItem<String>(
                          value: 'Price (High-Low)',
                          child: Text('Price (High-Low)')),
                      DropdownMenuItem<String>(
                          value: 'Price (Low-High)',
                          child: Text('Price (Low-High)')),
                    ],
                    onChanged: (v) {
                      print(v);
                      setState(() {
                        _dropDownValue = v.toString();
                      });
                      print(_dropDownValue);
                    },
                  ),
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height,
              child: Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisSpacing: 2,
                    crossAxisCount: 2,
                  ),
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return const ProductDetails();
                        }));
                      },
                      child: Container(
                        height: 130,
                        width: 130,
                        margin: const EdgeInsets.all(10),
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            boxShadow: CustomTheme.cardShadow,
                            borderRadius: BorderRadius.circular(20),
                            // color: const Color.fromARGB(255, 227, 227, 255),
                            color: Colors.white),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Center(
                              child: Image.network(
                                'https://cdn.shopify.com/s/files/1/0272/4714/9155/products/kofflet-syrup-100ml_1024x1024.jpg?v=1622100457',
                                height: 60,
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            const Text('kofflet-syrup-100ml'),
                            const SizedBox(
                              height: 30,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                Text(
                                  'PTR:Rs 70.12',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.grey,
                                  ),
                                ),
                                Text(
                                  'MRP:Rs 100',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.grey,
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
