import 'package:flutter/material.dart';
import 'widgets/order_card.dart';

class MyOrderScreen extends StatelessWidget {
  const MyOrderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 1,
        backgroundColor: Colors.white,
        title: const Text(
          "My Order",
          style: TextStyle(
            color: Color.fromARGB(255, 93, 90, 241),
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: ListView(
        scrollDirection: Axis.vertical,
        children: [
          Container(
              height: MediaQuery.of(context).size.height,
              width: 200,
              padding: const EdgeInsets.only(top: 18.0),
              child: const OrderCard()),
          // const Padding(
          //   padding: EdgeInsets.symmetric(horizontal: 20),
          //   child: ListTile(
          //     title: Text('Total'),
          //     trailing: Text(
          //       '\$50.98',
          //       style: TextStyle(
          //         fontSize: 20,
          //       ),
          //     ),
          //   ),
          // ),
          // Container(
          //   margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 0),
          //   width: 150,
          //   height: 50,
          //   child: CupertinoButton(
          //     padding: const EdgeInsets.all(0),
          //     color: const Color.fromARGB(255, 93, 90, 241),
          //     child: Text(
          //       'Proceed to Check Out',
          //       style: TextStyle(color: Colors.white),
          //     ),
          //     onPressed: () {},
          //   ),
          // ),
        ],
      ),
    );
  }
}
