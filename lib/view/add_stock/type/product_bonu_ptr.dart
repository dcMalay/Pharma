import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pharma/provider/add_stock.dart';
import 'package:pharma/view/add_stock/modules/ptr_discount_and_same_product_bonus.dart';
import 'package:provider/provider.dart';
import 'dart:math' as math;
import '../components/textfiled.dart';

class ProductBonusWithPtr extends StatefulWidget {
  final int minOrderQty;
  final int maxOrderQty;
  final num mrp;
  const ProductBonusWithPtr(
      {Key? key,
      required this.minOrderQty,
      required this.maxOrderQty,
      required this.mrp})
      : super(key: key);

  @override
  State<ProductBonusWithPtr> createState() => _ProductBonusWithPtrState();
}

class _ProductBonusWithPtrState extends State<ProductBonusWithPtr> {
  TextEditingController buy = TextEditingController();
  TextEditingController get = TextEditingController();
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
          "Same Product Bonus Plus Discount",
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
                    controller: buy,
                    label: 'Buy',
                    keyboardType: TextInputType.number)),
            const SizedBox(
              width: 10,
            ),
            Expanded(
                child: textfiled(
                    controller: get,
                    onChanged: (v) {
                      setState(() {});
                    },
                    label: 'Get',
                    keyboardType: TextInputType.number)),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          children: [
            Expanded(
                child: textfiled(
              inputFormatters: [DecimalTextInputFormatter(decimalRange: 2)],
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              controller: ptr,
              onChanged: (v) {
                setState(() {});
              },
              label: 'Discount on PTR(%)',
            )),
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
    var data = SameBonusPtrOnlyModel(
        get: get.text.isEmpty ? 0 : int.parse(get.text),
        buy: buy.text.isEmpty ? 0 : int.parse(buy.text),
        gstPercentage: gst == "0" ? 0 : num.parse(gst),
        mrp: widget.mrp,
        minQtySale: widget.minOrderQty,
        maxQtySale: widget.maxOrderQty,
        userBuy: widget.maxOrderQty,
        discountOnPtrOnlyPercenatge:
            ptr.text.isEmpty ? 0 : num.parse(ptr.text));
    var ds = ptrDicountProductsBonus(data);
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
                text: ptrDicountProductsBonus(SameBonusPtrOnlyModel(
                        get: get.text.isEmpty ? 0 : int.parse(get.text),
                        buy: buy.text.isEmpty ? 0 : int.parse(buy.text),
                        gstPercentage: gst == "0" ? 0 : num.parse(gst),
                        mrp: widget.mrp,
                        minQtySale: widget.minOrderQty,
                        maxQtySale: widget.maxOrderQty,
                        userBuy: widget.maxOrderQty,
                        discountOnPtrOnlyPercenatge: ptr.text.isEmpty
                            ? 0
                            : num.parse(ptr.text)))['per_ptr']
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
              ptrDicountProductsBonus(SameBonusPtrOnlyModel(
                  get: get.text.isEmpty ? 0 : int.parse(get.text),
                  buy: buy.text.isEmpty ? 0 : int.parse(buy.text),
                  gstPercentage: gst == "0" ? 0 : num.parse(gst),
                  mrp: widget.mrp,
                  minQtySale: widget.minOrderQty,
                  maxQtySale: widget.maxOrderQty,
                  userBuy: widget.maxOrderQty,
                  discountOnPtrOnlyPercenatge:
                      ptr.text.isEmpty ? 0 : num.parse(ptr.text)))['message'],
              style: TextStyle(color: Colors.red),
            ),
          );
  }
}

class DecimalTextInputFormatter extends TextInputFormatter {
  DecimalTextInputFormatter({this.decimalRange})
      : assert(decimalRange == null || decimalRange > 0);

  final int? decimalRange;

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue, // unused.
    TextEditingValue newValue,
  ) {
    TextSelection newSelection = newValue.selection;
    String truncated = newValue.text;

    if (decimalRange != null) {
      String value = newValue.text;

      if (value.contains(".") &&
          value.substring(value.indexOf(".") + 1).length > decimalRange!) {
        truncated = oldValue.text;
        newSelection = oldValue.selection;
      } else if (value == ".") {
        truncated = "0.";

        newSelection = newValue.selection.copyWith(
          baseOffset: math.min(truncated.length, truncated.length + 1),
          extentOffset: math.min(truncated.length, truncated.length + 1),
        );
      }

      return TextEditingValue(
        text: truncated,
        selection: newSelection,
        composing: TextRange.empty,
      );
    }
    return newValue;
  }
}
