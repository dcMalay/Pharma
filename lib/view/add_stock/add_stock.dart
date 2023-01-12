import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:easy_autocomplete/easy_autocomplete.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:month_picker_dialog_2/month_picker_dialog.dart';
import 'package:pharma/const.dart';
import 'package:pharma/provider/add_stock.dart';
import 'package:pharma/query/seller/global.dart';
import 'package:pharma/query/seller/product/add_stock.dart';
import 'package:pharma/query/upload.dart';
import 'package:pharma/view/add_stock/components/textfiled.dart';
import 'package:pharma/view/add_stock/type/different_product_bonu_ptr.dart';
import 'package:pharma/view/add_stock/type/different_product_bonus.dart';
import 'package:pharma/view/add_stock/type/only_ptrt.dart';
import 'package:pharma/view/add_stock/type/product_bonu_ptr.dart';
import 'package:pharma/view/add_stock/type/product_bonus.dart';
import 'package:pharma/view/buyer/home/model.dart';
import 'package:provider/provider.dart';

var _formKey = GlobalKey<FormState>();
final ImagePicker _picker = ImagePicker();

class AddStock extends StatefulWidget {
  AddStock({Key? key}) : super(key: key);

  @override
  State<AddStock> createState() => _AddStockState();
}

class _AddStockState extends State<AddStock> {
  gettoken() async {
    var token = await getToken();
    print(token);
  }

  @override
  void initState() {
    gettoken();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
//     List<XFile>? imageFileList = [];
//     List imageNames = [];
// //function to select image and add the images to the imageFileList array
//     void selectImages() async {
//       final List<XFile>? selectedImages = await _picker.pickMultiImage();
//       if (selectedImages!.isNotEmpty) {
//         imageFileList.addAll(selectedImages);
//       }
//       //using set state to refresh the page to show the image to the grid
//       setState(() {});
//       print("Image List Length:  ${imageFileList.length.toString()}");
//       print("Image List:  $imageFileList");
//     }

//     late FormData data;
//     //function to upload the image to php server
//     void _upload(File file) async {
//       String fileName = file.path.split('/').last;
//       data = FormData.fromMap({
//         "file": await MultipartFile.fromFile(
//           file.path,
//           filename: fileName,
//         ),
//       });
//     }

    return Consumer<AddStockProvider>(builder: (context, data, snapshot) {
      data.setCategoryLoad();
      return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          leading: const BackButton(
            color: Colors.black,
          ),
          elevation: 1,
          centerTitle: true,
          backgroundColor: Colors.white,
          title: const Text(
            'Add Stock',
            style: TextStyle(color: blackColor),
          ),
        ),
        body: Form(
          key: _formKey,
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            child: Column(
              children: [
                Row(
                  children: [
                    Container(
                      height: 80,
                      width: 80,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(
                          color: Colors.grey.shade100,
                          width: 1,
                        ),
                      ),
                      child: InkWell(
                        onTap: () async {
                          // Pick an image
                          final XFile? image = await _picker.pickImage(
                              source: ImageSource.gallery);
                          if (image != null) {
                            String fileName = image.path.split('/').last;
                            FormData dataImg = FormData.fromMap({
                              "file": await MultipartFile.fromFile(image.path,
                                  filename: fileName),
                            });
                            postImage(dataImg).then(
                              (value) {
                                print("---->$value");
                                // var imageUrl =
                                //     "https://" + value.toStirng().split("https://")[1];
                                // print('image url -->$imageUrl');
                                data.addImage(value.toString());
                              },
                            );
                            // imageUpload(context, File(image.path))
                            //     .then((value) {
                            //   data.addImage(value!.resultImage!.location!);
                            // });
                          }
                        },
                        child: Icon(
                          Icons.camera_alt_outlined,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                        child: SizedBox(
                      height: 80,
                      width: 80,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: data.imageList.length,
                        itemBuilder: (context, index) {
                          var ds = data.imageList[index];
                          print('ds ------>>$ds');
                          return Container(
                            margin: EdgeInsets.symmetric(horizontal: 10),
                            height: 80,
                            width: 80,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    fit: BoxFit.cover, image: NetworkImage(ds)),
                                borderRadius: BorderRadius.circular(5),
                                border: Border.all(
                                    color: Colors.grey.shade100, width: 1)),
                            child: InkWell(
                              child: CircleAvatar(
                                backgroundColor: blackColor.withOpacity(0.1),
                                child: Icon(
                                  Icons.close,
                                  color: Colors.white,
                                ),
                              ),
                              onTap: () async {
                                data.removeImage(index);
                              },
                            ),
                          );
                        },
                      ),
                    ))
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                EasyAutocomplete(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        isDense: true,
                        contentPadding: EdgeInsets.all(13),
                        hintText: 'Product Name',
                        hintStyle: TextStyle(fontSize: 12)),
                    controller: data.productNameController,
                    suggestions: productName,
                    onChanged: (value) {},
                    onSubmitted: (value) {}),
                // ),
                const SizedBox(
                  height: 15,
                ),
                textfiled(
                  onChanged: (p0) {},
                  controller: data.productCompanyController,
                  label: "Company Name",
                ),
                const SizedBox(
                  height: 15,
                ),
                dropdown(
                  onChanged: (v) {
                    data.setMedicineType(v.toString());
                  },
                  items: [
                    "Strip",
                    "Bottle",
                    "Tube",
                    "Vial",
                    "PFS",
                  ],
                  label: "Medicine Type",
                ),
                const SizedBox(
                  height: 15,
                ),
                MyDropDown(),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    Expanded(
                      child: textfiled(
                        isValidate: false,
                        controller: data.productChemimalController,
                        label: "Chemical Combination",
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: textfiled(
                        isValidate: false,
                        controller: data.countryOfOriginController,
                        label: "Country of Origin",
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    Expanded(
                      child: textfiled(
                        onChanged: (p0) {
                          data.refresh();
                        },
                        controller: data.productMinOrderQtyController,
                        keyboardType: TextInputType.number,
                        label: "Min order Qty",
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: textfiled(
                        onChanged: (p0) {
                          data.refresh();
                        },
                        controller: data.productMaxOrderQtyController,
                        keyboardType: TextInputType.number,
                        label: "Max order Qty",
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: textfiled(
                        controller: data.productExpireController,
                        onTap: () {
                          showMonthPicker(
                            yearFirst: true,
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(2019, 1),
                            lastDate: DateTime(2050, 12),
                          ).then((selectedDate) {
                            if (selectedDate != null) {
                              final DateFormat formatter =
                                  DateFormat('yyyy-MM');
                              final String formatted =
                                  formatter.format(selectedDate);
                              data.productExpireController.text =
                                  formatted.toString();
                            }
                          });
                        },
                        keyboardType: TextInputType.datetime,
                        label: "Expire date",
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    Expanded(
                      child: dropdown(
                        onChanged: (v) {
                          data.setSelectedDiscountType(v.toString());
                        },
                        items: [
                          "Discount PTR only",
                          "Same Product Bonus",
                          "Same Product Bonus Plus Discount",
                          "Different Product Bonus",
                          "Different Product Bonus Plus Discount",
                        ],
                        label: "Discount",
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    Expanded(
                      child: textfiled(
                        onChanged: (p0) {
                          data.refresh();
                        },
                        controller: data.productPriceController,
                        keyboardType: TextInputType.number,
                        label: "MRP",
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: textfiled(
                        onChanged: (p0) {
                          data.refresh();
                        },
                        controller: data.productStockController,
                        keyboardType: TextInputType.number,
                        label: "In Stock",
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                data.selectedDiscountType == "Discount PTR only"
                    ? PtrOnly(
                        maxOrderQty: data
                                .productMaxOrderQtyController.text.isEmpty
                            ? 0
                            : int.parse(data.productMaxOrderQtyController.text),
                        minOrderQty: data
                                .productMinOrderQtyController.text.isEmpty
                            ? 0
                            : int.parse(data.productMinOrderQtyController.text),
                        mrp: data.productPriceController.text.isEmpty
                            ? 0
                            : num.parse(data.productPriceController.text),
                      )
                    : data.selectedDiscountType == "Same Product Bonus"
                        ? ProductBonus(
                            maxOrderQty:
                                data.productMaxOrderQtyController.text.isEmpty
                                    ? 0
                                    : int.parse(
                                        data.productMaxOrderQtyController.text),
                            minOrderQty:
                                data.productMinOrderQtyController.text.isEmpty
                                    ? 0
                                    : int.parse(
                                        data.productMinOrderQtyController.text),
                            mrp: data.productPriceController.text.isEmpty
                                ? 0
                                : num.parse(data.productPriceController.text),
                          )
                        : data.selectedDiscountType ==
                                "Same Product Bonus Plus Discount"
                            ? ProductBonusWithPtr(
                                maxOrderQty: data.productMaxOrderQtyController
                                        .text.isEmpty
                                    ? 0
                                    : int.parse(
                                        data.productMaxOrderQtyController.text),
                                minOrderQty: data.productMinOrderQtyController
                                        .text.isEmpty
                                    ? 0
                                    : int.parse(
                                        data.productMinOrderQtyController.text),
                                mrp: data.productPriceController.text.isEmpty
                                    ? 0
                                    : num.parse(
                                        data.productPriceController.text),
                              )
                            : data.selectedDiscountType ==
                                    "Different Product Bonus"
                                ? DifferentProductBonus(
                                    maxOrderQty: data
                                            .productMaxOrderQtyController
                                            .text
                                            .isEmpty
                                        ? 0
                                        : int.parse(data
                                            .productMaxOrderQtyController.text),
                                    minOrderQty: data
                                            .productMinOrderQtyController
                                            .text
                                            .isEmpty
                                        ? 0
                                        : int.parse(data
                                            .productMinOrderQtyController.text),
                                    mrp: data
                                            .productPriceController.text.isEmpty
                                        ? 0
                                        : num.parse(
                                            data.productPriceController.text),
                                  )
                                : data.selectedDiscountType ==
                                        "Different Product Bonus Plus Discount"
                                    ? DifferentProductBonusWithPtr(
                                        maxOrderQty: data
                                                .productMaxOrderQtyController
                                                .text
                                                .isEmpty
                                            ? 0
                                            : int.parse(data
                                                .productMaxOrderQtyController
                                                .text),
                                        minOrderQty: data
                                                .productMinOrderQtyController
                                                .text
                                                .isEmpty
                                            ? 0
                                            : int.parse(data
                                                .productMinOrderQtyController
                                                .text),
                                        mrp: data.productPriceController.text
                                                .isEmpty
                                            ? 0
                                            : num.parse(data
                                                .productPriceController.text),
                                      )
                                    : Container(),
                CheckboxListTile(
                    value: data.isBluk,
                    title: const Text("Bulk Sale?"),
                    // subtitle: Text(""),
                    onChanged: (value) {
                      data.setIsBluk(value!);
                    }),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: Container(
          height: 70,
          decoration: BoxDecoration(color: Colors.white, boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 3,
              blurRadius: 3,
              offset: const Offset(0, 3), // changes position of shadow
            ),
          ]),
          padding: const EdgeInsets.all(10),
          child: InkWell(
            onTap: () {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();
                List<ExtraFields> extraField = [];
                extraField.add(ExtraFields.fromJson({
                  "key": "Expire Date",
                  "value": data.productExpireController.text,
                }));
                extraField.add(ExtraFields.fromJson({
                  "key": "Medicine Type",
                  "value": data.medicineType,
                }));

                if (data.productChemimalController.text.isNotEmpty) {
                  extraField.add(ExtraFields.fromJson({
                    "key": "Chemical Combination",
                    "value": data.productChemimalController.text,
                  }));
                }

                if (data.countryOfOriginController.text.isNotEmpty) {
                  extraField.add(ExtraFields.fromJson({
                    "key": "Country of Origin",
                    "value": data.countryOfOriginController.text,
                  }));
                }

                extraField.add(ExtraFields.fromJson({
                  "key": "Min Order Qty",
                  "value": data.productMinOrderQtyController.text,
                }));

                extraField.add(ExtraFields.fromJson({
                  "key": "Max Order Qty",
                  "value": data.productMaxOrderQtyController.text,
                }));
                extraField.add(ExtraFields.fromJson({
                  "key": "Expire Date",
                  "value": data.productExpireController.text,
                }));
                extraField.add(ExtraFields.fromJson({
                  "key": "Discount Type",
                  "value": data.selectedDiscountType,
                }));

                for (var element
                    in Provider.of<AddStockProvider>(context, listen: false)
                        .discountDetails
                        .entries) {
                  extraField.add(ExtraFields.fromJson({
                    "key": element.key
                        .toString()
                        .replaceAll("_", " ")
                        .toTitleCase(),
                    "value": element.value!.toString(),
                  }));
                }
                //     .map((element) {
                // });
                // Provider.of<AddStockProvider>(context,listen: false).discountDetails.entries.forEach((e) => print(e.key + " " + e.value.toString()));
                addProductMethod(context,
                        body: ProductModelRequest(
                            discountDetails: Provider.of<AddStockProvider>(
                                    context,
                                    listen: false)
                                .discountDetails,
                            extraFields: extraField.toList(),
                            discountFormDetails: Provider.of<AddStockProvider>(
                                    context,
                                    listen: false)
                                .discountFormDetails,
                            chemicalCombination:
                                data.productChemimalController.text.isEmpty
                                    ? ""
                                    : data.productChemimalController.text,
                            imageList: data.imageList,
                            bulk: data.isBluk.toString(),
                            stock: data.productStockController.text,
                            categories: Categories(
                                categoryName: data.category,
                                subCategoryName: data.subCategory),
                            productPrice: data.productPriceController.text,
                            companyName: data.productCompanyController.text,
                            productName: data.productNameController.text,
                            expireDate: data.productExpireController.text,
                            maxOrderQty: data.productMaxOrderQtyController.text,
                            minOrderQty:
                                data.productMinOrderQtyController.text))
                    .then((value) {
                  if (value != null) {
                    if (value.status == 200) {
                      SellerGlobalHandler.snackBar(
                          context: context,
                          isSuccess: true,
                          message: value.message.toString());
                      _formKey.currentState!.save();
                      data.reset();
                      Navigator.pop(context);
                    } else {
                      SellerGlobalHandler.snackBar(
                          context: context,
                          isError: true,
                          message: value.message.toString());
                      // showToast(value.message);
                    }
                  }
                });
              } else {
                SellerGlobalHandler.snackBar(
                    context: context,
                    isError: true,
                    message: "Please fill all details !!!");
              }
            },
            child: Container(
              child: const Center(
                  child: Text(
                "Save",
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              )),
              decoration: BoxDecoration(
                color: primaryColor,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ),
      );
    });
  }
}

class MyDropDown extends StatefulWidget {
  const MyDropDown({Key? key}) : super(key: key);

  @override
  State<MyDropDown> createState() => _MyDropDownState();
}

class _MyDropDownState extends State<MyDropDown> {
  AllCategoriesModel? tabList;
  List<String>? list = [];
  var subCategory;

  @override
  void initState() {
    tabList = AllCategoriesModel.fromJson(js);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Select Categories"),
              SizedBox(
                height: 5,
              ),
              DropdownButtonFormField<Result>(
                value: null,
                validator: (value) {
                  if (value == null) {
                    return 'Please select Categories';
                  }
                  return null;
                },
                onChanged: (v) {
                  Provider.of<AddStockProvider>(context, listen: false)
                      .setCategory(v!.name!);

                  setState(() {
                    subCategory = null;
                    list = v.list!;
                  });
                },
                items: tabList!.result!
                    .map(
                      (item) => DropdownMenuItem<Result>(
                        child: Text(
                          item.name!,
                          style: TextStyle(fontSize: 12),
                        ),
                        value: item,
                      ),
                    )
                    .toList(),
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    isDense: true,
                    contentPadding: EdgeInsets.all(13),
                    hintText: 'Categories',
                    hintStyle: TextStyle(fontSize: 12)),
              ),
            ],
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Expanded(
          child: dropdown(
            value: subCategory,
            onChanged: (v) {
              Provider.of<AddStockProvider>(context, listen: false)
                  .setSubCategory(v.toString());
              setState(() {
                subCategory = v;
              });
            },
            items: list,
            label: "Sub Categories",
          ),
        ),
      ],
    );
  }
}

void prettyJson(dynamic json) {
  var spaces = ' ' * 4;
  var encoder = JsonEncoder.withIndent(spaces);
  print(encoder.convert(json));
}

extension CapExtension on String {
  String toCapitalized() =>
      length > 0 ? '${this[0].toUpperCase()}${substring(1).toLowerCase()}' : '';
  String toTitleCase() => replaceAll(RegExp(' +'), ' ')
      .split(' ')
      .map((str) => str.toCapitalized())
      .join(' ');
  // String get capitalizeFirstofEach => this.split(" ").map((str) => str.capitalize).join(" ");
}
