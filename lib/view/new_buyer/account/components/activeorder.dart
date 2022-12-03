import 'package:flutter/cupertino.dart';

import '../../cart/components/cart_card.dart';

class ActiveOrder extends StatelessWidget {
  const ActiveOrder({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Container(
          height: 670,
          width: 200,
          padding: const EdgeInsets.only(top: 18.0),
          child: const CartCard(),
        ),
      ],
    );
  }
}
