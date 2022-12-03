import 'package:flutter/material.dart';

import '../../../const.dart';
import 'components/activeorder.dart';
import 'components/inactiveorder.dart';

class OrderandTracking extends StatelessWidget {
  const OrderandTracking({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.white,
            title: const Text(
              "Order And Tracking",
              style: TextStyle(color: Colors.black, fontSize: 24),
            )),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 30,
              ),
              child: Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 1,
                      spreadRadius: 2,
                      color: primaryColor.withOpacity(0.1),
                    ),
                  ],
                  color: const Color.fromARGB(255, 227, 227, 255),
                  borderRadius: BorderRadius.circular(50),
                ),
                child: TabBar(
                  labelColor: Colors.white,
                  unselectedLabelColor: const Color.fromARGB(255, 93, 90, 241),
                  indicator: BoxDecoration(
                    color: const Color.fromARGB(255, 93, 90, 241),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  tabs: const [
                    Tab(
                      text: "Active Order",
                    ),
                    Tab(
                      text: "Inactive Order",
                    ),
                  ],
                ),
              ),
            ),
            const Expanded(
              child: TabBarView(
                children: [
                  ActiveOrder(),
                  InactiveOrder(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
