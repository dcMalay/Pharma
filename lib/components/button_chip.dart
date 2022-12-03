import 'package:flutter/material.dart';

Widget customButton(
    {required String lable,
    required Color color,
    void Function()? onTap,
    double radius = 20}) {
  return Container(
    height: 50,
    child: InkWell(
      onTap: onTap,
      // onTap: CallBackLogin(context).verify,
      child: Container(
        child: Center(
          child: Text(
            lable.toUpperCase(),
            style: TextStyle(color: Colors.white),
          ),
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius),
          color: color,
        ),
      ),
    ),
  );
}

Widget chipButton(
    {required Color color, required String lable, void Function()? onTap}) {
  return InkWell(
    onTap: onTap,
    child: Container(
        height: 30,
        width: 80,
        decoration: BoxDecoration(
            color: color.withOpacity(0.1),
            borderRadius: BorderRadius.circular(30)),
        child: Center(
          child: Text(
            lable,
            style: TextStyle(color: color, fontSize: 15),
          ),
        )),
  );
}
