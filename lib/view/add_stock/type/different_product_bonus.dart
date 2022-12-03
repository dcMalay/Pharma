import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:pharma/provider/add_stock.dart';
import 'package:pharma/view/add_stock/modules/different_product_bonus.dart';
import 'package:pharma/view/add_stock/modules/same_product_bonus.dart';
import 'package:provider/provider.dart';

import '../components/textfiled.dart';

class DifferentProductBonus extends StatefulWidget {
  final int minOrderQty;
  final int maxOrderQty;
  final num mrp;
  const DifferentProductBonus({
    Key? key,
    required this.minOrderQty,
    required this.maxOrderQty,
    required this.mrp,
  }) : super(key: key);

  @override
  State<DifferentProductBonus> createState() => _DifferentProductBonusState();
}

class _DifferentProductBonusState extends State<DifferentProductBonus> {
  TextEditingController buy = TextEditingController();
  TextEditingController get = TextEditingController();
  TextEditingController name = TextEditingController();
  String gst = "0";
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Divider(),
        const Text(
          "Different Product Bonus",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          children: [
            Expanded(
                child: textfiled(
                    onChanged: (v) {
                      setState(() {});
                    },
                    controller: buy,
                    label: 'Buy',
                    keyboardType: TextInputType.number)),
            const SizedBox(
              width: 10,
            ),
            Expanded(
                child: textfiled(
                    onChanged: (p0) {
                      setState(() {});
                    },
                    controller: get,
                    label: 'Get',
                    keyboardType: TextInputType.number)),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        textfiled(
          onChanged: (p0) {
            setState(() {});
          },
          controller: name,
          label: 'Product Name',
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          children: [
            Expanded(
                child: dropdown(
                    onChanged: (v) {
                      setState(() {
                        gst = v.toString();
                      });
                    },
                    label: 'GST',
                    items: [
                  "0",
                  "5",
                  "12",
                  "18",
                  "28",
                ]))
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        checkCalculation()
      ],
    );
  }

  Widget checkCalculation() {
    var data = DifferentBonusModel(
        producName: name.text,
        get: get.text.isEmpty ? 0 : int.parse(get.text),
        buy: buy.text.isEmpty ? 0 : int.parse(buy.text),
        gstPercentage: gst == "0" ? 0 : num.parse(gst),
        mrp: widget.mrp,
        minQtySale: widget.minOrderQty,
        maxQtySale: widget.maxOrderQty,
        userBuy: widget.maxOrderQty);
    var ds = differentbonus(data);

    Provider.of<AddStockProvider>(context, listen: false)
        .setDiscountDetails(ds);
    Provider.of<AddStockProvider>(context, listen: true)
        .setDiscountFormDetails(data.toJson());
    return ds['status'] == true
        ? textfiled(
            readOnly: true,
            onTap: () {
              // print(widget.maxOrderQty);
            },
            label: "Final Ptr",
            controller: TextEditingController(
                text: differentbonus(DifferentBonusModel(
                        producName: name.text,
                        get: get.text.isEmpty ? 0 : int.parse(get.text),
                        buy: buy.text.isEmpty ? 0 : int.parse(buy.text),
                        gstPercentage: gst == "0" ? 0 : num.parse(gst),
                        mrp: widget.mrp,
                        minQtySale: widget.minOrderQty,
                        maxQtySale: widget.maxOrderQty,
                        userBuy: widget.maxOrderQty))['per_ptr']
                    .toDouble()
                    .toStringAsFixed(2)
                    .toString()))
        : Container(
            width: double.infinity,
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.red.withOpacity(0.1),
              borderRadius: BorderRadius.circular(5),
            ),
            child: Text(
              differentbonus(DifferentBonusModel(
                  producName: name.text,
                  get: get.text.isEmpty ? 0 : int.parse(get.text),
                  buy: buy.text.isEmpty ? 0 : int.parse(buy.text),
                  gstPercentage: gst == "0" ? 0 : num.parse(gst),
                  mrp: widget.mrp,
                  minQtySale: widget.minOrderQty,
                  maxQtySale: widget.maxOrderQty,
                  userBuy: widget.maxOrderQty))['message'],
              style: TextStyle(color: Colors.red),
            ),
          );
  }
}
