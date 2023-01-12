import 'dart:async';

import 'package:epasys_app/providers/auth_provider.dart';
import 'package:epasys_app/providers/check_in_provider.dart';
import 'package:epasys_app/providers/parking_provider.dart';
import 'package:epasys_app/services/parking_service.dart';
import 'package:epasys_app/shared/functions.dart';
import 'package:epasys_app/shared/theme.dart';
import 'package:epasys_app/ui/pages/qr/qr_overlay.dart';
import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:provider/provider.dart';
import 'package:quickalert/quickalert.dart';

class CheckInPage extends StatefulWidget {
  const CheckInPage({super.key});

  @override
  State<CheckInPage> createState() => _CheckInPageState();
}

class _CheckInPageState extends State<CheckInPage> {
  MobileScannerController cameraController = MobileScannerController();
  bool _screenOpened = false;
  final bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightBackgroundColor,
      body: Stack(
        children: [
          MobileScanner(
            allowDuplicates: true,
            controller: cameraController,
            onDetect: _foundBarcode,
          ),
          QRScannerOverlay(
            overlayColour: Colors.black.withOpacity(
              0.5,
            ),
          ),
          Positioned(
            top: 60,
            left: 0,
            right: 0,
            child: Text(
              'Scan QR Code!',
              style: whiteTextStyle.copyWith(
                fontWeight: bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Positioned(
            top: 45,
            left: 0,
            right: 0,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: Icon(
                    Icons.arrow_back_ios_new_rounded,
                    color: whiteColor,
                  ),
                  onPressed: () => Navigator.pop(context),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    IconButton(
                      color: whiteColor,
                      icon: ValueListenableBuilder(
                        valueListenable: cameraController.torchState,
                        builder: (context, value, child) {
                          switch (value) {
                            case TorchState.off:
                              return const Icon(Icons.flash_off);
                            case TorchState.on:
                              return const Icon(Icons.flash_on);
                          }
                        },
                      ),
                      iconSize: 28,
                      onPressed: () => cameraController.toggleTorch(),
                    ),
                    IconButton(
                      color: whiteColor,
                      icon: ValueListenableBuilder(
                        valueListenable: cameraController.cameraFacingState,
                        builder: (context, value, child) {
                          switch (value) {
                            case CameraFacing.front:
                              return const Icon(Icons.camera_front);
                            case CameraFacing.back:
                              return const Icon(Icons.camera_rear);
                          }
                        },
                      ),
                      iconSize: 28,
                      onPressed: () => cameraController.switchCamera(),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _foundBarcode(
      Barcode barcode, MobileScannerArguments? args) async {
    AuthProvider authProvider =
        Provider.of<AuthProvider>(context, listen: false);
    CheckInProvider checkInProvider =
        Provider.of<CheckInProvider>(context, listen: false);
    ParkingProvider parkingProvider =
        Provider.of<ParkingProvider>(context, listen: false);
    String noParkir =
        'IN${authProvider.user.id}${Functions().convertDateTime4(DateTime.now())}';
    String noParkirOut =
        'OUT${authProvider.user.id}${Functions().convertDateTime4(DateTime.now())}';
    if (!_screenOpened) {
      final String code = barcode.rawValue ?? '---';
      _screenOpened = true;
      QuickAlert.show(
        context: context,
        type: QuickAlertType.loading,
      );
      cameraController.stop();
      if (await ParkingService().checkIn(
        noParkir,
        code,
        checkInProvider.helm,
        authProvider.user.id!,
        checkInProvider.idKendaraan,
        authProvider.user.token!,
      )) {
        await parkingProvider.checkInAndOut(
          noParkirOut,
          'OUT',
          checkInProvider.helm,
          authProvider.user.id!,
          checkInProvider.idKendaraan,
          authProvider.user.token!,
        );
        if (!mounted) return;
        Navigator.pop(context);
        QuickAlert.show(
          context: context,
          type: QuickAlertType.success,
          text: 'Berhasil melakukan check in',
          onConfirmBtnTap: () {
            Navigator.pop(context);
            Navigator.pop(context);
            Navigator.pop(context);
            _screenOpened = false;
          },
          barrierDismissible: false,
        );
      } else {
        QuickAlert.show(
          context: context,
          type: QuickAlertType.error,
          text: 'Gagal melakukan check in',
          onConfirmBtnTap: () {
            Navigator.pop(context);
            Navigator.pop(context);
            _screenOpened = false;
          },
          barrierDismissible: false,
        );
      }
      // Navigator.push(
      //   context,
      //   MaterialPageRoute(
      //     builder: (context) => FoundCodePage(
      //       screenClosed: _screenWasClosed,
      //       value: code,
      //     ),
      //   ),
      // );
    }
  }

  void _screenWasClosed() {
    _screenOpened = false;
  }
}
