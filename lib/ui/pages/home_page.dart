import 'package:epasys_app/providers/auth_provider.dart';
import 'package:epasys_app/providers/broadcast_provider.dart';
import 'package:epasys_app/shared/theme.dart';
import 'package:epasys_app/ui/widgets/history_card.dart';
import 'package:epasys_app/ui/widgets/home_menu_item.dart';
import 'package:epasys_app/ui/widgets/home_spotlight_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                blueColor3,
                blueColor2,
                // blueColor2,
                // blueColor2,
              ],
              begin: Alignment.bottomLeft,
              end: Alignment.topRight,
            ),
          ),
          child: Column(
            children: <Widget>[
              headerSection(),
              Container(
                decoration: BoxDecoration(
                  color: lightBackgroundColor,
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(30),
                  ),
                ),
                child: Column(
                  children: <Widget>[
                    spotlightSection(),
                    otherMenusSection(),
                    latestHistorySection(),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget headerSection() {
    return Padding(
      padding: const EdgeInsets.only(
        left: 16,
        top: 70,
        right: 16,
        bottom: 50,
      ),
      child: Consumer<AuthProvider>(
        builder: (context, value, child) => Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Selamat Datang,',
                  style: whiteTextStyle.copyWith(
                    fontSize: 16,
                  ),
                ),
                Text(
                  '${value.user.nama}.',
                  style: whiteTextStyle.copyWith(
                    fontSize: 20,
                    fontWeight: bold,
                  ),
                ),
              ],
            ),
            Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                      'https://kelompok17stiebi.website/storage/${value.user.avatar}'),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget spotlightSection() {
    return Container(
      margin: const EdgeInsets.only(
        top: 30,
      ),
      child: Consumer<BroadcastProvider>(
        builder: (context, value, child) => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: <Widget>[
                const SizedBox(
                  width: 16,
                ),
                Text(
                  'Broadcast',
                  style: blackTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: bold,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 12,
            ),
            value.broadcasts.isEmpty
                ? const EmptyBroadcastCard()
                : SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: value.broadcasts
                          .map(
                            (broadcast) => HomeSpotlightItem(
                              broadcast: broadcast,
                            ),
                          )
                          .toList(),
                    ),
                  ),
          ],
        ),
      ),
    );
  }

  Widget otherMenusSection() {
    return Container(
      margin: const EdgeInsets.only(
        left: 16,
        top: 30,
        right: 16,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Menu Lain',
            style: blackTextStyle.copyWith(
              fontSize: 16,
              fontWeight: bold,
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              HomeMenuItem(
                onTap: () {
                  Navigator.pushNamed(context, '/teknisi');
                },
                iconUrl: 'assets/images/img_teknisi.png',
                menuName: 'Teknisi',
              ),
              HomeMenuItem(
                onTap: () {
                  Navigator.pushNamed(context, '/satpam');
                },
                iconUrl: 'assets/images/img_satpam.png',
                menuName: 'Satpam',
              ),
              HomeMenuItem(
                onTap: () {},
                iconUrl: 'assets/images/img_informasi.png',
                menuName: 'Informasi',
              ),
              HomeMenuItem(
                onTap: () {},
                iconUrl: 'assets/images/img_faq.png',
                menuName: 'FAQ',
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget latestHistorySection() {
    return Container(
      margin: const EdgeInsets.only(
        left: 16,
        top: 30,
        right: 16,
        bottom: 40,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Riwayat Terbaru',
            style: blackTextStyle.copyWith(
              fontSize: 16,
              fontWeight: bold,
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          const EmptyHistoryCard(),
          //     color: whiteColor,
          //     borderRadius: BorderRadius.circular(10),
          //     border: Border.all(
          //       color: greyColor2,
          //     ),
          //   ),
          //   child: Column(
          //     children: const <Widget>[
          //       HomeTransactionItem(
          //         iconUrl: 'assets/images/img_checkout.png',
          //         title: 'Scoopy',
          //         time: '11:00',
          //         vechileName: 'N 111 GA',
          //       ),
          //       HomeTransactionItem(
          //         iconUrl: 'assets/images/img_checkin.png',
          //         title: 'Scoopy',
          //         time: '07:00',
          //         vechileName: 'N 111 GA',
          //       ),
          //     ],
          //   ),
          // ),
        ],
      ),
    );
  }
}
