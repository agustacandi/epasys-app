import 'package:epasys_app/shared/theme.dart';
import 'package:flutter/material.dart';

class FAQPage extends StatefulWidget {
  const FAQPage({super.key});

  @override
  State<FAQPage> createState() => _FAQPageState();
}

class _FAQPageState extends State<FAQPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightBackgroundColor,
      body: Container(
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
            children: [
              Container(
                width: double.infinity,
                padding: const EdgeInsets.only(
                    left: 16, top: 24, right: 16, bottom: 50),
                child: Row(
                  children: [
                    Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        color: whiteColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: const Icon(Icons.arrow_back_ios_new),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 36,
                    ),
                    Text(
                      'Frequently Asked Questions',
                      style: whiteTextStyle.copyWith(
                          fontSize: 20, fontWeight: bold),
                    )
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  width: double.infinity,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 30),
                  decoration: BoxDecoration(
                    color: whiteColor,
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(30),
                    ),
                  ),
                  child: Column(
                    children: [
                      ExpansionTile(
                        backgroundColor: whiteColor,
                        title: Text(
                          'Apa itu Epasys?',
                          style: blackTextStyle.copyWith(
                            fontWeight: bold,
                          ),
                        ),
                        children: [
                          Text(
                              'Epasys adalah aplikasi yang digunakan untuk mempermudah mahasiswa dan satpam pada saat akan melakukan parkir.',
                              style: blackTextStyle),
                        ],
                      ),
                      ExpansionTile(
                        backgroundColor: whiteColor,
                        title: Text(
                          'Bagaimana cara menggunakan Epasys?',
                          style: blackTextStyle.copyWith(
                            fontWeight: bold,
                          ),
                        ),
                        children: [
                          Text(
                            'Untuk menggunakan aplikasi ini anda cukup men-scan code QR yang terdapat pada pintu masuk gerbang kampus pada saat melakukan check-in. Kemudian anda akan mendapatkan tiket parkir yang dapat anda gunakan untuk keluar dari gerbang kampus dalam bentuk QR Code yang nanti akan ditunjukan pada satpam.',
                            style: blackTextStyle,
                          ),
                        ],
                      ),
                      ExpansionTile(
                        backgroundColor: whiteColor,
                        title: Text(
                          'Kenapa harus menggunakan Epasys?',
                          style: blackTextStyle.copyWith(
                            fontWeight: bold,
                          ),
                        ),
                        children: [
                          Text(
                            'Karena lebih efisien dan praktis, anda tidak perlu lagi menunggu satpam untuk menulis karcis parkir, kehilangan karcis, dan lain-lain.',
                            style: blackTextStyle,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
