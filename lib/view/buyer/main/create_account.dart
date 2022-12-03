import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pharma/callback_provider/seller_login.dart';
import 'package:pharma/components/outlined_textfield.dart';
import 'package:pharma/const.dart';
import 'package:pharma/query/buyer/global.dart';
import 'package:pharma/query/buyer/main/create_account.dart';
import 'package:pharma/query/gst_pan.dart';
import 'package:pharma/query/seller/global.dart';
import 'package:pharma/query/upload.dart';

class BuyerCreateAccount extends StatefulWidget {
  final String phoneNumber;
  final GstPanResoponse gstPanResponse;
  const BuyerCreateAccount({
    Key? key,
    required this.gstPanResponse,
    required this.phoneNumber,
  }) : super(key: key);

  @override
  State<BuyerCreateAccount> createState() => _BuyerCreateAccountState();
}

class _BuyerCreateAccountState extends State<BuyerCreateAccount> {
  TextEditingController legalNameController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController address1Controller = TextEditingController();
  TextEditingController address2Controller = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  TextEditingController pincodeController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController gstPanNumber = TextEditingController();
  TextEditingController lic20 = TextEditingController();
  TextEditingController lic21 = TextEditingController();
  TextEditingController bankName = TextEditingController();
  TextEditingController accountNumber = TextEditingController();
  TextEditingController ifscCode = TextEditingController();
  TextEditingController inviteCode = TextEditingController();
  TextEditingController uploaddl20B = TextEditingController();
  TextEditingController uploaddl21B = TextEditingController();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool iAgree = false;
  @override
  void initState() {
    getLoad();
    super.initState();
  }

  getLoad() {
    print(widget.gstPanResponse.gstNumber!);
    legalNameController.text = widget.gstPanResponse.legalName!;
    nameController.text = widget.gstPanResponse.legalName!;
    gstPanNumber.text = widget.gstPanResponse.gstNumber!;
    phoneController.text = widget.phoneNumber;
    if (widget.gstPanResponse.address != null) {
      address1Controller.text = widget.gstPanResponse.address!.doorNumber!;
      stateController.text = widget.gstPanResponse.address!.stateName!;
      cityController.text = widget.gstPanResponse.address!.dst!;
      pincodeController.text = widget.gstPanResponse.address!.pincode!;
      address2Controller.text = widget.gstPanResponse.address!.street! +
          " " +
          widget.gstPanResponse.address!.location!;
    }
  }

  final ImagePicker _picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: BackButton(
          color: blackColor,
        ),
        title: Text('Buyer Account', style: TextStyle(color: blackColor)),
        centerTitle: true,
        backgroundColor: Colors.white,
        // elevation: 0.0,
        shadowColor: primaryColor.withOpacity(0.1),
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          padding: EdgeInsets.all(15),
          child: Column(
            children: [
              SizedBox(
                height: 10,
              ),
              Text("Basic Information",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                      fontSize: 20)),
              Text(
                  "We'll use this details to keep you updated about your order",
                  style: TextStyle(fontSize: 16, color: blackColor)),
              const SizedBox(
                height: 10,
              ),
              OutlinedTextFiled(
                readOnly: true,
                controller: legalNameController,
                hintText: 'Legal Name',
                placeholderText: "",
              ),
              OutlinedTextFiled(
                readOnly: true,
                controller: gstPanNumber,
                hintText: 'GSTIN or PAN Card',
                placeholderText: "",
              ),
              OutlinedTextFiled(
                controller: emailController,
                hintText: 'Email',
                placeholderText: "abc@xyz.com",
              ),
              OutlinedTextFiled(
                readOnly: true,
                controller: phoneController,
                keyboardType: TextInputType.phone,
                hintText: 'Phone Number',
                placeholderText: "2545965423",
              ),
              const SizedBox(
                height: 25,
              ),
              const Text(
                "1. Shipping Information",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              OutlinedTextFiled(
                controller: nameController,
                hintText: 'Full Name',
                placeholderText: "",
              ),
              OutlinedTextFiled(
                controller: address1Controller,
                keyboardType: TextInputType.streetAddress,
                hintText: 'Street Address',
                placeholderText: "",
              ),
              OutlinedTextFiled(
                isValidate: false,
                controller: address2Controller,
                keyboardType: TextInputType.streetAddress,
                hintText: 'Street Address 2',
                placeholderText: "",
              ),
              OutlinedTextFiled(
                controller: stateController,
                hintText: 'State',
                placeholderText: "",
              ),
              OutlinedTextFiled(
                controller: cityController,
                hintText: 'City',
                placeholderText: "",
              ),
              OutlinedTextFiled(
                isValidate: true,
                controller: pincodeController,
                keyboardType: TextInputType.number,
                hintText: 'Zip Code',
                placeholderText: "",
              ),
              const SizedBox(
                height: 25,
              ),
              const Text(
                "2. Licence Information",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              OutlinedTextFiled(
                controller: lic20,
                hintText: 'D.L. no 20B',
                placeholderText: "Enter licence number",
              ),
              OutlinedTextFiled(
                onTap: () async {
                  final XFile? image =
                      await _picker.pickImage(source: ImageSource.gallery);

                  var uploadFile =
                      await imageUpload(context, File(image!.path));
                  uploaddl20B.text = uploadFile!.resultImage!.location!;
                },
                readOnly: true,
                controller: uploaddl20B,
                // controller: lic20,
                hintText: 'Upload D.L. no 20B',
                placeholderText: "JPG or PNG max Size(1MB)",
              ),
              OutlinedTextFiled(
                controller: lic21,
                hintText: 'D.L. no 21B',
                placeholderText: "Enter licence number",
              ),
              OutlinedTextFiled(
                onTap: () async {
                  final XFile? image =
                      await _picker.pickImage(source: ImageSource.gallery);

                  var uploadFile =
                      await imageUpload(context, File(image!.path));
                  uploaddl21B.text = uploadFile!.resultImage!.location!;
                },
                readOnly: true,
                controller: uploaddl21B,
                hintText: 'Upload D.L. no 21B',
                placeholderText: "JPG or PNG max Size(1MB)",
              ),
              const SizedBox(
                height: 25,
              ),
              const Text(
                "3. Bank Information",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              OutlinedTextFiled(
                isValidate: false,
                controller: bankName,
                hintText: 'Bank Name',
                placeholderText: "Enter bank name",
              ),
              OutlinedTextFiled(
                isValidate: false,
                controller: accountNumber,
                keyboardType: TextInputType.number,
                hintText: 'Account Number',
                placeholderText: "Enter account number",
              ),
              OutlinedTextFiled(
                isValidate: false,
                controller: ifscCode,
                hintText: 'IFSC Code',
                placeholderText: "Enter IFSC Code",
              ),
              // const SizedBox(
              //   height: 25,
              // ),
              // const Text(
              //   "4. Invite Code",
              //   style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              // ),
              // OutlinedTextFiled(
              //   isValidate: false,
              //   controller: inviteCode,
              //   hintText: 'Invite Code ',
              //   placeholderText: "Invite Code (Optional)",
              // ),
              const SizedBox(
                height: 20,
              ),
              Column(
                children: [
                  Row(
                    children: [
                      Checkbox(
                          materialTapTargetSize:
                              MaterialTapTargetSize.shrinkWrap,
                          // activeColor: primaryColor,
                          // checkColor: primaryColor,
                          fillColor: MaterialStateProperty.resolveWith<Color>(
                              (states) {
                            if (states.contains(MaterialState.disabled)) {
                              return primaryColor.withOpacity(.32);
                            }
                            return primaryColor;
                          }),
                          value: iAgree,
                          onChanged: (v) {
                            setState(() {
                              iAgree = v!;
                            });
                          }),
                      Text(
                        "I agree to the terms and conditions",
                        style: TextStyle(
                            color: blackColor,
                            fontSize: 12,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                  InkWell(
                    onTap: () {
                      if (iAgree) {
                        if (_formKey.currentState!.validate()) {
                          buyerCreateAccountMethod(context, body: {
                            "gst_pan_response":
                                json.encode(widget.gstPanResponse.toJson()),
                            "name": nameController.text,
                            "legal_name": legalNameController.text,
                            "email": emailController.text,
                            "phone_no": phoneController.text,
                            "address": json.encode({
                              "name": nameController.text,
                              "address1": address1Controller.text,
                              "address2": address2Controller.text,
                              "state": stateController.text,
                              "city": cityController.text,
                              "pincode": pincodeController.text,
                            }),
                            "licence": json.encode({
                              "lic20": lic20.text,
                              "lic21": lic21.text,
                              "dl20B_imaage": uploaddl20B.text,
                              "dl21B_imaage": uploaddl21B.text,
                            }),
                            "band_account": json.encode({
                              "name": nameController.text,
                              "bank_name": bankName.text,
                              "account_number": accountNumber.text,
                              "ifsc_code": ifscCode.text,
                            }),
                            "invite_code": inviteCode.text,
                          }).then((value) {
                            if (value == null) {
                              BuyerGlobalHandler.snackBar(
                                  context: context,
                                  isError: true,
                                  message: "Something went wrong");
                            } else if (value.status == 200) {
                              Navigator.pop(context);
                              Navigator.pop(context);
                              // Navigator.pop(context);
                              BuyerGlobalHandler.snackBar(
                                  context: context,
                                  isSuccess: true,
                                  message: value.message.toString());

                              // Navigator.pop(context);
                              SellerLoginCallBack()
                                  .onCheckAccountBuyer(context);
                            } else {
                              BuyerGlobalHandler.snackBar(
                                  context: context,
                                  isError: true,
                                  message: value.message.toString());
                            }
                          });

                          // _formKey.currentState!.save();
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //     builder: (context) =>
                          //         CreateAccount2(

                          //         ),
                          //   ),
                          // );
                        } else {
                          SellerGlobalHandler.snackBar(
                              isError: true,
                              context: context,
                              message: "This field is required");
                        }
                      } else {
                        SellerGlobalHandler.snackBar(
                            isError: true,
                            context: context,
                            message:
                                "Please agree to the terms and conditions");
                      }
                    },
                    child: Container(
                      // margin: EdgeInsets.all(10),
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: primaryColor,
                      ),
                      child: Center(
                        child: Text("Continue",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w700)),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
