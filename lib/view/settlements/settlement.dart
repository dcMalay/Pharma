import 'package:flutter/material.dart';
import 'package:pharma/const.dart';
import 'package:pharma/view/settlements/compenents/settlement_view.dart';
import 'package:remixicon/remixicon.dart';

class SettlementTab extends StatelessWidget {
  const SettlementTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settlement', style: TextStyle(color: Colors.grey[400])),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0.0,
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          ListView.builder(
            itemCount: 5,
            shrinkWrap: true,
            physics: const ClampingScrollPhysics(),
            itemBuilder: (context, index) {
              return const SettlementView();
            },
          )
        ],
      ),
    );
  }
}
