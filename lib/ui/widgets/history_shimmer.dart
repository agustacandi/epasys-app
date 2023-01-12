import 'package:epasys_app/shared/theme.dart';
import 'package:epasys_app/ui/widgets/skeleton.dart';
import 'package:flutter/material.dart';

class HistoryShimmer extends StatelessWidget {
  const HistoryShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        SizedBox(
          height: 20,
        ),
        Card(),
        SizedBox(
          height: 5,
        ),
        Card(),
        SizedBox(
          height: 5,
        ),
        Card(),
        SizedBox(
          height: 5,
        ),
        Card(),
      ],
    );
  }
}

class Card extends StatelessWidget {
  const Card({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 16,
      ),
      margin: const EdgeInsets.only(
        bottom: 16,
      ),
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(
          10,
        ),
        border: Border.all(
          color: greyColor2,
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Skeleton(
            width: 50,
            height: 50,
            borderRadius: 50,
          ),
          const SizedBox(
            width: 20,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Skeleton(
                width: 100,
                height: 10,
                borderRadius: 10,
              ),
              SizedBox(
                height: 5,
              ),
              Skeleton(
                width: 150,
                height: 10,
                borderRadius: 10,
              )
            ],
          ),
          const Spacer(),
          const Skeleton(
            width: 50,
            height: 10,
            borderRadius: 10,
          ),
        ],
      ),
    );
  }
}
