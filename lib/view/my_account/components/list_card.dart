import 'package:flutter/material.dart';
import 'package:pharma/const.dart';

class ListTileCard extends StatelessWidget {
  final String image;
  final String title;
  final String subtitle;
  final void Function()? onTap;

  const ListTileCard(
      {Key? key,
      required this.image,
      required this.title,
      required this.subtitle,
      this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        children: [
          Image.asset(
            image,
            height: 100,
            width: 100,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                    color: blackColor,
                    fontSize: 14,
                    fontWeight: FontWeight.w600),
              ),
              Text(
                subtitle,
                style: TextStyle(
                    color: greyColor,
                    fontSize: 13,
                    fontWeight: FontWeight.w400),
              ),
            ],
          ),
          Spacer(),
          Icon(
            Icons.arrow_forward_ios,
            color: greyColor,
          ),
        ],
      ),
    );
  }
}
