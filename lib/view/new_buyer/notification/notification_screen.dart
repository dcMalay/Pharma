import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../theme/custom_theme.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'Notifications',
          style: TextStyle(color: Colors.black, fontSize: 20),
        ),
      ),
      body: ListView(children: [
        InkWell(
          onTap: () {
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: const Text("You will get your order by this way "),
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Mile stone",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      Row(
                        children: const [
                          Expanded(
                            child: ListTile(
                              title: Text("Product Qty"),
                              subtitle: Text('50'),
                            ),
                          ),
                          Expanded(
                            child: ListTile(
                              title: Text("Date"),
                              subtitle: Text('2022-10-23'),
                            ),
                          ),
                        ],
                      ),
                      const Divider(
                        color: Colors.grey,
                      ),
                      const Text(
                        "Mile stone",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      Row(
                        children: const [
                          Expanded(
                            child: ListTile(
                              title: Text("Product Qty"),
                              subtitle: Text('50'),
                            ),
                          ),
                          Expanded(
                            child: ListTile(
                              title: Text("Date"),
                              subtitle: Text('2022-10-30'),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  actions: [
                    CupertinoButton(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        color: Colors.red,
                        child: const Text("Decline"),
                        onPressed: () {
                          Navigator.pop(context);
                        }),
                    const SizedBox(
                      width: 80,
                    ),
                    CupertinoButton(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        color: Colors.green,
                        child: const Text("Accept"),
                        onPressed: () {
                          Navigator.pop(context);
                        }),
                    const SizedBox(
                      width: 20,
                    ),
                  ],
                );
              },
            );
          },
          child: Container(
            height: 50,
            width: 50,
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            decoration: BoxDecoration(
                boxShadow: CustomTheme.cardShadow,
                color: Colors.white,
                borderRadius: BorderRadius.circular(10)),
            child: const Center(
                child: Text(
              'You Get a notification From the seller',
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            )),
          ),
        )
      ]),
    );
  }
}
