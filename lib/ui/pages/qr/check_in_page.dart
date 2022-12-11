import 'package:epasys_app/shared/theme.dart';
import 'package:epasys_app/ui/pages/qr/found_code_page.dart';
import 'package:epasys_app/ui/pages/qr/qr_overlay.dart';
import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class CheckInPage extends StatefulWidget {
  const CheckInPage({super.key});

  @override
  State<CheckInPage> createState() => _CheckInPageState();
}

class _CheckInPageState extends State<CheckInPage> {
  MobileScannerController cameraController = MobileScannerController();
  bool _screenOpened = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightBackgroundColor,
      appBar: AppBar(
        title: Text(
          'Check In',
          style: whiteTextStyle.copyWith(
            fontWeight: bold,
          ),
        ),
        centerTitle: true,
        actions: [
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
            iconSize: 32,
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
            iconSize: 32,
            onPressed: () => cameraController.switchCamera(),
          ),
        ],
      ),
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
        ],
      ),
    );
  }

  void _foundBarcode(Barcode barcode, MobileScannerArguments? args) {
    if (!_screenOpened) {
      final String code = barcode.rawValue ?? '---';
      debugPrint('Barcode found! $code');
      _screenOpened = true;
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => FoundCodePage(
            screenClosed: _screenWasClosed,
            value: code,
          ),
        ),
      );
    }
  }

  void _screenWasClosed() {
    _screenOpened = false;
  }
}
