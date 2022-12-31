import 'package:epasys_app/providers/auth_provider.dart';
import 'package:epasys_app/providers/parking_provider.dart';
import 'package:epasys_app/ui/widgets/history_card.dart';
import 'package:epasys_app/ui/widgets/history_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../shared/theme.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({Key? key}) : super(key: key);

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  bool isLoading = true;
  getParkings() async {
    AuthProvider authProvider =
        Provider.of<AuthProvider>(context, listen: false);
    await Provider.of<ParkingProvider>(context, listen: false)
        .getParkings(authProvider.user.token!);
    if (mounted) setState(() => isLoading = false);
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      getParkings();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () async => getParkings(),
        child: Stack(
          children: <Widget>[
            Container(
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
            ),
            Container(
              padding: const EdgeInsets.only(
                top: 60,
                left: 24,
                right: 24,
              ),
              height: 200,
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Riwayat Parkir',
                    style: whiteTextStyle.copyWith(
                      fontSize: 20,
                      fontWeight: bold,
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              top: 130,
              bottom: 0,
              left: 0,
              right: 0,
              child: Consumer<ParkingProvider>(
                builder: (context, value, child) => Container(
                  padding: const EdgeInsets.only(
                    left: 24,
                    right: 24,
                  ),
                  decoration: BoxDecoration(
                    color: lightBackgroundColor,
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(30),
                    ),
                  ),
                  child: isLoading
                      ? const HistoryShimmer()
                      : (value.parkings.isEmpty
                          ? Center(
                              child: Text(
                                'Riwayat Parkir Kosong',
                                style: blackTextStyle,
                              ),
                            )
                          : ListView.builder(
                              itemCount: value.parkings.length,
                              itemBuilder: (context, index) {
                                return HistoryCard(
                                  parking: value.parkings[index],
                                  onTap: () {
                                    Navigator.pushNamed(
                                      context,
                                      '/detail-history',
                                      arguments: value.parkings[index],
                                    );
                                  },
                                );
                              },
                            )),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
