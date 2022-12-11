import 'package:epasys_app/shared/theme.dart';
import 'package:flutter/material.dart';

class QRPage extends StatefulWidget {
  const QRPage({super.key});

  @override
  State<QRPage> createState() => _QRPageState();
}

class _QRPageState extends State<QRPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.maxFinite,
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
      child: SafeArea(
        bottom: false,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            GestureDetector(
              onTap: () => Navigator.pushNamed(
                context,
                '/check-in',
              ),
              child: Container(
                width: 250,
                height: 200,
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: whiteColor,
                  border: Border.all(
                    color: greyColor2,
                  ),
                  borderRadius: BorderRadius.circular(
                    10,
                  ),
                ),
                child: Center(
                  child: Text(
                    'Check In',
                  ),
                ),
              ),
            ),
            // const SizedBox(
            //   height: 20,
            // ),
            Container(
              width: 250,
              height: 200,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: whiteColor,
                border: Border.all(
                  color: greyColor2,
                ),
                borderRadius: BorderRadius.circular(
                  10,
                ),
              ),
              child: Center(
                child: Text(
                  'Check Out',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
