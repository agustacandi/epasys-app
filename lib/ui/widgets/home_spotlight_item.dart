import 'package:epasys_app/shared/theme.dart';
import 'package:flutter/material.dart';

class HomeSpotlightItem extends StatelessWidget {
  final String imageUrl;
  final String title;

  const HomeSpotlightItem({
    Key? key,
    required this.imageUrl,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 172,
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: greyColor2,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          ClipRRect(
            borderRadius: const BorderRadius.vertical(
              top: Radius.circular(10),
            ),
            child: Image.asset(
              imageUrl,
              width: 200,
              height: 108,
            ),
          ),
          Container(
            padding: const EdgeInsets.all(12),
            child: Text(
              title,
              style: blackTextStyle.copyWith(
                fontSize: 14,
                fontWeight: semiBold,
              ),
            ),
          )
        ],
      ),
    );
  }
}
