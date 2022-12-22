import 'package:barcode_widget/barcode_widget.dart';
import 'package:epasys_app/models/parking_model.dart';
import 'package:epasys_app/shared/functions.dart';
import 'package:epasys_app/shared/theme.dart';
import 'package:flutter/material.dart';

class HistoryDetailPage extends StatefulWidget {
  const HistoryDetailPage({super.key});

  @override
  State<HistoryDetailPage> createState() => _HistoryDetailPageState();
}

class _HistoryDetailPageState extends State<HistoryDetailPage> {
  @override
  Widget build(BuildContext context) {
    final arguments =
        ModalRoute.of(context)!.settings.arguments as ParkingModel;
    return Scaffold(
      backgroundColor: lightBackgroundColor,
      appBar: AppBar(
        title: Text(
          'Detail Riwayat',
          style: whiteTextStyle.copyWith(
            fontWeight: bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(
          16,
        ),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 20,
              ),
              decoration: BoxDecoration(
                color: whiteColor,
                border: Border.all(
                  color: greyColor2,
                ),
                borderRadius: BorderRadius.circular(
                  10,
                ),
              ),
              child: Column(
                children: [
                  Text(
                    'Check ${arguments.status == 'IN' ? 'In' : 'Out'} Parkir',
                    style: blackTextStyle.copyWith(
                      fontSize: 20,
                      fontWeight: bold,
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Divider(
                    color: greyColor,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'ID',
                            style: blackTextStyle.copyWith(
                              fontSize: 16,
                              fontWeight: semiBold,
                            ),
                          ),
                          Text(
                            'Jam ${arguments.status == 'IN' ? 'Masuk' : 'Keluar'}',
                            style: blackTextStyle.copyWith(
                              fontSize: 16,
                              fontWeight: semiBold,
                            ),
                          ),
                          Text(
                            'Tanggal',
                            style: blackTextStyle.copyWith(
                              fontSize: 16,
                              fontWeight: semiBold,
                            ),
                          ),
                          Text(
                            'Merek',
                            style: blackTextStyle.copyWith(
                              fontSize: 16,
                              fontWeight: semiBold,
                            ),
                          ),
                          Text(
                            'No. Polisi',
                            style: blackTextStyle.copyWith(
                              fontSize: 16,
                              fontWeight: semiBold,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            arguments.nomorParkir!,
                            style: blackTextStyle.copyWith(
                              fontSize: 16,
                              fontWeight: semiBold,
                            ),
                          ),
                          Text(
                            Functions().convertDateTime3(arguments.createdAt!),
                            style: blackTextStyle.copyWith(
                              fontSize: 16,
                              fontWeight: semiBold,
                            ),
                          ),
                          Text(
                            Functions().convertDateTime2(arguments.createdAt!),
                            style: blackTextStyle.copyWith(
                              fontSize: 16,
                              fontWeight: semiBold,
                            ),
                          ),
                          Text(
                            arguments.vehicle!.merek!,
                            style: blackTextStyle.copyWith(
                              fontSize: 16,
                              fontWeight: semiBold,
                            ),
                          ),
                          Text(
                            arguments.vehicle!.noPolisi!,
                            style: blackTextStyle.copyWith(
                              fontSize: 16,
                              fontWeight: semiBold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Divider(
                    color: greyColor,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      BarcodeWidget(
                        barcode: Barcode.qrCode(
                          errorCorrectLevel: BarcodeQRCorrectionLevel.high,
                        ),
                        data: arguments.nomorParkir!,
                        width: 200,
                        height: 200,
                      ),
                      Container(
                        width: 50,
                        height: 50,
                        padding: const EdgeInsets.all(
                          5,
                        ),
                        decoration: BoxDecoration(
                          color: whiteColor,
                          border: Border.all(
                            color: greyColor2,
                          ),
                          borderRadius: BorderRadius.circular(
                            5,
                          ),
                        ),
                        child: Image.asset(
                          'assets/images/ic_logo.png',
                          width: 20,
                          height: 20,
                          color: blackColor,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Divider(
                    color: greyColor,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
