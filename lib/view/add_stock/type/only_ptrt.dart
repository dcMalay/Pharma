import 'package:flutter/material.dart';
import 'package:pharma/provider/add_stock.dart';
import 'package:pharma/view/add_stock/components/textfiled.dart';
import 'package:pharma/view/add_stock/modules/ptr_discount.dart';
import 'package:provider/provider.dart';

class PtrOnly extends StatefulWidget {
  final int minOrderQty;
  final int maxOrderQty;
  final num mrp;

  const PtrOnly(
      {Key? key,
      required this.minOrderQty,
      required this.maxOrderQty,
      required this.mrp})
      : super(key: key);

  @override
  State<PtrOnly> createState() => _PtrOnlyState();
}

class _PtrOnlyState extends State<PtrOnly> {
  TextEditingController discount = TextEditingController();
  TextEditingController ptr = TextEditingController();
  String gst = "0";
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Divider(),
        const Text(
          "PTR Only",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          children: [
            Expanded(
                child: textfiled(
                    onChanged: (p0) {
                      setState(() {});
                    },
                    controller: ptr,
                    label: 'Discount on PTR(%)',
                    keyboardType: TextInputType.number)),
            const SizedBox(
              width: 10,
            ),
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
    var data = PtrOnlyModel(
        discountOnPtrOnlyPercenatge: ptr.text.isEmpty ? 0 : num.parse(ptr.text),
        gstPercentage: gst == "0" ? 0 : num.parse(gst),
        mrp: widget.mrp,
        minQtySale: widget.minOrderQty,
        maxQtySale: widget.maxOrderQty,
        userBuy: widget.maxOrderQty);
    var ds = discountOnPtrOnly(data);
    Provider.of<AddStockProvider>(context, listen: true)
        .setDiscountFormDetails(data.toJson());

    Provider.of<AddStockProvider>(context, listen: true).setDiscountDetails(ds);
    return ds['status'] == true
        ? textfiled(
            readOnly: true,
            onTap: () {
              // print(widget.maxOrderQty);
            },
            label: "Final Ptr",
            controller: TextEditingController(
                text: discountOnPtrOnly(PtrOnlyModel(
                        discountOnPtrOnlyPercenatge:
                            ptr.text.isEmpty ? 0 : num.parse(ptr.text),
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
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.red.withOpacity(0.1),
              borderRadius: BorderRadius.circular(5),
            ),
            child: Text(
              discountOnPtrOnly(PtrOnlyModel(
                  discountOnPtrOnlyPercenatge:
                      ptr.text.isEmpty ? 0 : num.parse(ptr.text),
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
