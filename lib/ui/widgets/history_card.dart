import 'package:epasys_app/shared/theme.dart';
import 'package:flutter/material.dart';

class HistoryCard extends StatelessWidget {
  final VoidCallback onTap;
  const HistoryCard({
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 16,
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
                Image.asset(
                  'assets/images/img_checkout.png',
                  width: 50,
                ),
                const SizedBox(
                  width: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Scoopy',
                      style: blackTextStyle.copyWith(
                        fontSize: 16,
                        fontWeight: bold,
                      ),
                    ),
                    Text(
                      'N 111 GA',
                      style: greyTextStyle.copyWith(
                        fontSize: 14,
                        fontWeight: semiBold,
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                Text(
                  '17:00',
                  style: blackTextStyle.copyWith(
                    fontSize: 14,
                    fontWeight: bold,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 16,
          ),
        ],
      ),
    );
  }
}

class EmptyHistoryCard extends StatelessWidget {
  const EmptyHistoryCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 172,
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(
          10,
        ),
        border: Border.all(
          color: greyColor2,
        ),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.history,
              size: 34,
              color: blackColor,
            ),
            Text(
              'Belum Ada Riwayat Parkir',
              style: blackTextStyle.copyWith(
                fontSize: 16,
                fontWeight: bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
