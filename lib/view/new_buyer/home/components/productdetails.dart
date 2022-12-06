import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pharma/const.dart';
import 'package:quickalert/quickalert.dart';
import '../../my_order/my_order_screen.dart';
import '../../theme/custom_theme.dart';
import 'custom_order.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
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
          'PharmaBag',
          style: TextStyle(color: Colors.black, fontSize: 20),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
              backgroundColor: const Color.fromARGB(255, 227, 227, 255),
              child: IconButton(
                icon: const Icon(
                  Icons.shopping_bag,
                  color: Colors.black,
                ),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const MyOrderScreen();
                  }));
                },
              ),
            ),
          )
        ],
      ),
      body: ListView(
        children: [
          SizedBox(
            height: 350,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 30),
                  child: Center(
                    child: Image.network(
                      'https://cdn.shopify.com/s/files/1/0272/4714/9155/products/kofflet-syrup-100ml_1024x1024.jpg?v=1622100457',
                      height: 350,
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 30),
                  child: Center(
                    child: Image.network(
                      'https://cdn.shopify.com/s/files/1/0272/4714/9155/products/kofflet-syrup-100ml_1024x1024.jpg?v=1622100457',
                      height: 350,
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 30),
                  child: Center(
                    child: Image.network(
                      'https://cdn.shopify.com/s/files/1/0272/4714/9155/products/kofflet-syrup-100ml_1024x1024.jpg?v=1622100457',
                      height: 350,
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 30),
                  child: Center(
                    child: Image.network(
                      'https://cdn.shopify.com/s/files/1/0272/4714/9155/products/kofflet-syrup-100ml_1024x1024.jpg?v=1622100457',
                      height: 350,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Divider(
            color: Colors.grey,
          ),
          SizedBox(
            height: 80,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: Image.network(
                    'https://cdn.shopify.com/s/files/1/0272/4714/9155/products/kofflet-syrup-100ml_1024x1024.jpg?v=1622100457',
                    height: 80,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: Image.network(
                    'https://cdn.shopify.com/s/files/1/0272/4714/9155/products/kofflet-syrup-100ml_1024x1024.jpg?v=1622100457',
                    height: 80,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: Image.network(
                    'https://cdn.shopify.com/s/files/1/0272/4714/9155/products/kofflet-syrup-100ml_1024x1024.jpg?v=1622100457',
                    height: 80,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: Image.network(
                    'https://cdn.shopify.com/s/files/1/0272/4714/9155/products/kofflet-syrup-100ml_1024x1024.jpg?v=1622100457',
                    height: 80,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: Image.network(
                    'https://cdn.shopify.com/s/files/1/0272/4714/9155/products/kofflet-syrup-100ml_1024x1024.jpg?v=1622100457',
                    height: 80,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: Image.network(
                    'https://cdn.shopify.com/s/files/1/0272/4714/9155/products/kofflet-syrup-100ml_1024x1024.jpg?v=1622100457',
                    height: 80,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: Image.network(
                    'https://cdn.shopify.com/s/files/1/0272/4714/9155/products/kofflet-syrup-100ml_1024x1024.jpg?v=1622100457',
                    height: 80,
                  ),
                ),
              ],
            ),
          ),
          const Divider(
            color: Colors.grey,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 30,
                  width: 100,
                  margin: const EdgeInsets.symmetric(vertical: 5),
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.yellow),
                  child: const Center(child: Text('Syrup')),
                ),
                const Text(
                  "kofflet-syrup-100ml",
                  style: TextStyle(fontSize: 25),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(left: 8.0),
                          child: Text("MRP- Rs.100"),
                        ),
                        Container(
                          height: 30,
                          width: 100,
                          margin: const EdgeInsets.symmetric(vertical: 5),
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.red),
                          child: const Center(
                              child: Text(
                            'Near to Expiry',
                            style: TextStyle(color: Colors.white, fontSize: 10),
                          )),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: const [
                            Text(
                              'Rs. 75.94',
                              style:
                                  TextStyle(color: Colors.green, fontSize: 30),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              'Rs.100',
                              style: TextStyle(
                                  color: Colors.black,
                                  decoration: TextDecoration.lineThrough,
                                  fontSize: 15),
                            ),
                          ],
                        ),
                        const Text(
                          'Exclusive of GST',
                          style: TextStyle(color: Colors.red, fontSize: 18),
                        ),
                      ],
                    )
                  ],
                ),
                Row(
                  children: const [
                    Expanded(
                      child: ListTile(
                        title: Text(
                          'Expair Date',
                          style: TextStyle(color: Colors.grey),
                        ),
                        subtitle: Text(
                          '02-10-2023',
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ),
                    Expanded(
                      child: ListTile(
                        title: Text(
                          'Medicine Type',
                          style: TextStyle(color: Colors.grey),
                        ),
                        subtitle: Text(
                          'Tablets',
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: const [
                    Expanded(
                      child: ListTile(
                        title: Text(
                          'Chemical Combination',
                          style: TextStyle(color: Colors.grey),
                        ),
                        subtitle: Text(
                          'csusb',
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ),
                    Expanded(
                      child: ListTile(
                        title: Text(
                          'Country of Origin',
                          style: TextStyle(color: Colors.grey),
                        ),
                        subtitle: Text(
                          'India',
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: const [
                    Expanded(
                      child: ListTile(
                        title: Text(
                          'Min Order Qty',
                          style: TextStyle(color: Colors.grey),
                        ),
                        subtitle: Text(
                          '100',
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ),
                    Expanded(
                      child: ListTile(
                        title: Text(
                          'Max Order Qty',
                          style: TextStyle(color: Colors.grey),
                        ),
                        subtitle: Text(
                          '1000',
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: const [
                    Expanded(
                      child: ListTile(
                        title: Text(
                          'Discount Type',
                          style: TextStyle(color: Colors.grey),
                        ),
                        subtitle: Text(
                          'Same Prouct Bonus\n(100 +1)',
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ),
                    Expanded(
                      child: ListTile(
                        title: Text(
                          'GST',
                          style: TextStyle(color: Colors.grey),
                        ),
                        subtitle: Text(
                          '5%',
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: const [
                    Expanded(
                      child: ListTile(
                        title: Text(
                          'BUY',
                          style: TextStyle(color: Colors.grey),
                        ),
                        subtitle: Text(
                          '100',
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ),
                    Expanded(
                      child: ListTile(
                        title: Text(
                          'GET',
                          style: TextStyle(color: Colors.grey),
                        ),
                        subtitle: Text(
                          '1',
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
            boxShadow: CustomTheme.cardShadow, color: Colors.white),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Row(
          children: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.add_circle)),
            const Text(
              "100",
              style: TextStyle(fontSize: 20),
            ),
            IconButton(onPressed: () {}, icon: const Icon(Icons.remove_circle)),
            const SizedBox(
              width: 10,
            ),
            CupertinoButton(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              color: const Color.fromARGB(255, 93, 90, 241),
              child: const Text('Order Now'),
              onPressed: () {
                QuickAlert.show(
                  context: context,
                  type: QuickAlertType.success,
                  text: 'You successfully placed the order',
                );
              },
            ),
            const SizedBox(
              width: 10,
            ),
            CupertinoButton(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                color: const Color.fromARGB(255, 93, 90, 241),
                child: const Text('Custom Order'),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const CustomOrderScreen();
                  }));
                })
          ],
        ),
      ),
    );
  }
}
