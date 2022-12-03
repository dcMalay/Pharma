import 'package:flutter/material.dart';
import 'package:pharma/const.dart';
import 'package:pharma/view/orders/order_view.dart';
import 'package:remixicon/remixicon.dart';

class PastOrderView extends StatelessWidget {
  const PastOrderView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(bottom: 10),
      elevation: 3,
      shadowColor: primaryColor.withOpacity(0.1),
      child: InkWell(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(
            builder: (context) {
              return OrderView();
            },
          ));
        },
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('1 item by Shree Ganesh ...',
                        style: TextStyle(
                            color: primaryColor,
                            fontSize: 14,
                            fontWeight: FontWeight.w700)),
                    Text('OD200053697 | 453 | Prepaid',
                        style: TextStyle(
                            color: greyColor,
                            fontSize: 11,
                            fontWeight: FontWeight.w400)),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        const Text('₹2345',
                            style: TextStyle(
                                color: blackColor,
                                fontSize: 16,
                                fontWeight: FontWeight.w600)),
                        const Spacer(),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 5),
                          decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: const Center(
                            child: Text('Confirmed',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600)),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 10),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.share,
                  color: orangeColor,
                  size: 20,
                ),
              ),
              IconButton(
                  onPressed: () {},
                  icon: Icon(Remix.download_2_line, color: greenColor)),
              IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.arrow_forward_ios, color: primaryColor)),
            ],
          ),
        ),
      ),
    );
  }
}
