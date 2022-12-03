import 'package:flutter/material.dart';
import '../../../const.dart';
import 'widgets/order_card.dart';

class MyOrderScreen extends StatelessWidget {
  const MyOrderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 1,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back,
              color: blackColor,
            )),
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
        ],
      ),
    );
  }
}
