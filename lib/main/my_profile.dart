import 'package:flutter/material.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:pharma/callback_provider/seller.dart';
import 'package:pharma/components/outlined_textfield.dart';

import '../const.dart';

class MyProfile extends StatefulWidget {
  const MyProfile({
    Key? key,
  }) : super(key: key);

  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
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

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool iAgree = true;
  @override
  void initState() {
    // getLoad();
    super.initState();
  }

  getLoad() async {
    context.loaderOverlay.show();

    await SellerCallBack(context).sellerProviderWithoutLisner.getUser(context);
    context.loaderOverlay.hide();

    if (SellerCallBack(context).getSellerDetails != null) {
      var ds = SellerCallBack(context).getSellerDetails!.sellerDetails;

      if (ds != null) {
        legalNameController.text = ds.legalName!;
        gstPanNumber.text = ds.gstPanResponse!.gstNumber!;
        phoneController.text = ds.phoneNo.toString();
        emailController.text = ds.email.toString();
        nameController.text = ds.name.toString();
        address1Controller.text = ds.address!.address1!;
        stateController.text = ds.address!.state!;
        cityController.text = ds.address!.city!;
        pincodeController.text = ds.address!.pincode!;
        address2Controller.text = ds.address!.address2!;
        lic20.text = ds.licence!.lic20!;
        lic21.text = ds.licence!.lic21!;
        bankName.text = ds.bankAccount!.bankName!;
        accountNumber.text = ds.bankAccount!.accountNumber!;
        ifscCode.text = ds.bankAccount!.ifscCode!;
        inviteCode.text = ds.inviteCode!;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: BackButton(
          color: blackColor,
        ),
        title: Text('Seller Account', style: TextStyle(color: blackColor)),
        centerTitle: true,
        backgroundColor: Colors.white,
        // elevation: 0.0,
        shadowColor: primaryColor.withOpacity(0.1),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: EdgeInsets.all(15),
          children: [
            SizedBox(
              height: 10,
            ),
            Text("Basic Information",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                    fontSize: 20)),
            Text("We'll use this details to keep you updated about your order",
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
              readOnly: true,
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
              readOnly: true,
              controller: nameController,
              hintText: 'Full Name',
              placeholderText: "",
            ),
            OutlinedTextFiled(
              readOnly: true,
              controller: address1Controller,
              keyboardType: TextInputType.streetAddress,
              hintText: 'Street Address',
              placeholderText: "",
            ),
            OutlinedTextFiled(
              readOnly: true,
              isValidate: false,
              controller: address2Controller,
              keyboardType: TextInputType.streetAddress,
              hintText: 'Street Address 2',
              placeholderText: "",
            ),
            OutlinedTextFiled(
              readOnly: true,
              controller: stateController,
              hintText: 'State',
              placeholderText: "",
            ),
            OutlinedTextFiled(
              readOnly: true,
              controller: cityController,
              hintText: 'City',
              placeholderText: "",
            ),
            OutlinedTextFiled(
              readOnly: true,
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
              readOnly: true,
              controller: lic20,
              hintText: 'LIC 20B',
              placeholderText: "Enter licence number",
            ),
            OutlinedTextFiled(
              readOnly: true,
              controller: lic21,
              hintText: 'LIC 21B',
              placeholderText: "Enter licence number",
            ),
            const SizedBox(
              height: 25,
            ),
            const Text(
              "3. Bank Information",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            OutlinedTextFiled(
              readOnly: true,
              controller: bankName,
              hintText: 'Bank Name',
              placeholderText: "Enter bank name",
            ),
            OutlinedTextFiled(
              readOnly: true,
              controller: accountNumber,
              keyboardType: TextInputType.number,
              hintText: 'Account Number',
              placeholderText: "Enter account number",
            ),
            OutlinedTextFiled(
              readOnly: true,
              controller: ifscCode,
              hintText: 'IFSC Code',
              placeholderText: "Enter IFSC Code",
            ),
            const SizedBox(
              height: 25,
            ),
            const Text(
              "4. Invite Code",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            OutlinedTextFiled(
              readOnly: true,
              isValidate: false,
              controller: inviteCode,
              hintText: 'Invite Code ',
              placeholderText: "Invite Code (Optional)",
            ),
            const SizedBox(
              height: 20,
            ),
            Column(
              children: [
                Row(
                  children: [
                    Checkbox(
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        // activeColor: primaryColor,
                        // checkColor: primaryColor,
                        fillColor:
                            MaterialStateProperty.resolveWith<Color>((states) {
                          if (states.contains(MaterialState.disabled)) {
                            return primaryColor.withOpacity(.32);
                          }
                          return primaryColor;
                        }),
                        value: iAgree,
                        onChanged: (v) {}),
                    Text(
                      "I agree to the terms and conditions",
                      style: TextStyle(
                          color: blackColor,
                          fontSize: 12,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                Container(
                  // margin: EdgeInsets.all(10),
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: primaryColor,
                  ),
                  child: Center(
                    child: Text("Can't Update",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w700)),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
