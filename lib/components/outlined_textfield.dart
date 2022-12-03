import 'package:flutter/material.dart';
import 'package:pharma/const.dart';

class OutlinedTextFiled extends StatelessWidget {
  final String hintText;
  final String placeholderText;
  final TextInputType? keyboardType;
  final TextEditingController? controller;
  final bool? isValidate;
  final bool? readOnly;
  final void Function()? onTap;
  const OutlinedTextFiled(
      {Key? key,
      required this.hintText,
      required this.placeholderText,
      this.keyboardType,
      this.onTap,
      this.controller,
      this.readOnly = false,
      this.isValidate = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(hintText),
        ),
        TextFormField(
          onTap: onTap,
          readOnly: readOnly!,
          validator: isValidate!
              ? (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter $hintText';
                  }
                  return null;
                }
              : null,
          controller: controller,
          keyboardType: keyboardType,
          decoration: InputDecoration(
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
            hintText: placeholderText,
            border:
                OutlineInputBorder(borderSide: BorderSide(color: blackColor)),
          ),
        ),
      ],
    );
  }
}
