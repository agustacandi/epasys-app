import 'package:epasys_app/shared/theme.dart';
import 'package:epasys_app/ui/widgets/buttons.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class HelpPage extends StatefulWidget {
  const HelpPage({super.key});

  @override
  State<HelpPage> createState() => _HelpPageState();
}

class _HelpPageState extends State<HelpPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightBackgroundColor,
      appBar: AppBar(
        title: Text(
          'Bantuan',
          style: whiteTextStyle.copyWith(
            fontWeight: bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 24,
          vertical: 20,
        ),
        child: Column(
          children: [
            Image.asset('assets/images/img_help.png'),
            Text(
              'Anda Mengalami Kesulitan?',
              style: blackTextStyle.copyWith(
                fontSize: 20,
                fontWeight: bold,
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Text(
              'Hubungi Developer',
              style: blackTextStyle.copyWith(
                fontSize: 16,
                fontWeight: medium,
              ),
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
                      'Email:',
                      style: blackTextStyle,
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      'Telegram:',
                      style: blackTextStyle,
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      'mugiwaraagusta@gmail.com',
                      style: blackTextStyle,
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      '@usevoid',
                      style: blackTextStyle,
                    ),
                  ],
                )
              ],
                         ),
            const SizedBox(
              height: 16,
            ),
            CustomButton(
              title: 'WhatsApp',
              width: double.infinity,
              color: greenColor,
              onPressed: () async {
                Uri url = Uri.parse(
                    'https://api.whatsapp.com/send/?phone=+62895369770701');
                if (await canLaunchUrl(url)) {
                  await launchUrl(
                    url,
                    mode: LaunchMode.externalApplication,
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
