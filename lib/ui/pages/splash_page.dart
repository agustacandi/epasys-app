import 'dart:async';
import 'package:epasys_app/shared/theme.dart';
import 'package:epasys_app/ui/pages/onboarding_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(seconds: 3),
      () => Navigator.pushNamedAndRemoveUntil(
          context, '/on-boarding', (route) => false),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: blackColor,
      body: Center(
        child: SizedBox(
          width: 172,
          height: 48,
          child: Image.asset('assets/images/img_logo_dark.png'),
        ),
      ),
    );
  }
}
