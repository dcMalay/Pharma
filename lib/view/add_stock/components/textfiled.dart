import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Widget textfiled(
    {String? label,
    TextInputType? keyboardType,
    bool readOnly = false,
    bool isValidate = true,
    void Function()? onTap,
    void Function(String)? onChanged,
    List<TextInputFormatter>? inputFormatters,
    TextEditingController? controller}) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        "$label",
        style: const TextStyle(fontSize: 12),
      ),
      const SizedBox(
        height: 5,
      ),
      TextFormField(
        onChanged: onChanged,
        onTap: onTap,
        validator: isValidate
            ? (value) {
                if (value!.isEmpty) {
                  return 'Please enter $label';
                }
                return null;
              }
            : null,
        readOnly: readOnly,
        controller: controller,
        keyboardType: keyboardType,
        inputFormatters: inputFormatters,
        decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            isDense: true,
            contentPadding: EdgeInsets.all(13),
            hintText: 'Enter $label',
            hintStyle: TextStyle(fontSize: 12)),
      ),
    ],
  );
}

Widget dropdown(
    {String? label,
    List<String>? items,
    void Function(Object?)? onChanged,
    Object? value}) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text("Select $label"),
      SizedBox(
        height: 5,
      ),
      DropdownButtonFormField(
        value: value,
        validator: (value) {
          if (value == null) {
            return 'Please select $label';
          }
          return null;
        },
        onChanged: onChanged,
        items: [
          for (String item in items!)
            DropdownMenuItem(
              child: Text(
                item,
                style: TextStyle(fontSize: 12),
              ),
              value: item,
            ),
        ],
        decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            isDense: true,
            contentPadding: EdgeInsets.all(13),
            hintText: '$label',
            hintStyle: TextStyle(fontSize: 12)),
      ),
    ],
  );
}

Widget dropdownCategories(
    {String? label, List? items, void Function(dynamic)? onChanged}) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text("Select $label"),
      SizedBox(
        height: 5,
      ),
      DropdownButtonFormField(
        validator: (value) {
          if (value == null) {
            return 'Please select $label';
          }
          return null;
        },
        onChanged: (v) {
          onChanged!(v);
        },
        items: [
          for (var item in items!)
            DropdownMenuItem(
              child: Text(
                item.name,
                style: TextStyle(fontSize: 12),
              ),
              value: item,
            ),
        ],
        decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            isDense: true,
            contentPadding: EdgeInsets.all(13),
            hintText: '$label',
            hintStyle: TextStyle(fontSize: 12)),
      ),
    ],
  );
}
