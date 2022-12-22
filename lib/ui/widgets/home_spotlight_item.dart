import 'package:epasys_app/models/broadcast_model.dart';
import 'package:epasys_app/shared/config.dart';
import 'package:epasys_app/shared/theme.dart';
import 'package:epasys_app/ui/pages/broadcast_detail_page.dart';
import 'package:flutter/material.dart';

class HomeSpotlightItem extends StatelessWidget {
  final BroadcastModel broadcast;

  const HomeSpotlightItem({
    Key? key,
    required this.broadcast,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(
          width: 16,
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => BroadcastDetailPage(
                  broadcast: broadcast,
                ),
              ),
            );
          },
          child: Container(
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
                  child: Image.network(
                    '${SharedConfig().imageUrl}/${broadcast.imgUrl!}',
                    width: 200,
                    height: 108,
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(12),
                  child: Text(
                    broadcast.judul!,
                    style: blackTextStyle.copyWith(
                      fontSize: 14,
                      fontWeight: semiBold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class EmptyBroadcastCard extends StatelessWidget {
  const EmptyBroadcastCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 172,
      margin: const EdgeInsets.symmetric(
        horizontal: 16,
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
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.event,
              size: 34,
              color: blackColor,
            ),
            Text(
              'Belum Ada Broadcast',
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
