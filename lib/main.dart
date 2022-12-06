import 'package:epasys_app/providers/auth_provider.dart';
import 'package:epasys_app/ui/pages/information_page.dart';
import 'package:epasys_app/ui/pages/main_page.dart';
import 'package:epasys_app/ui/pages/onboarding_page.dart';
import 'package:epasys_app/ui/pages/qr/scan_qr_page.dart';
import 'package:epasys_app/ui/pages/satpam_page.dart';
import 'package:epasys_app/ui/pages/sign_in_page.dart';
import 'package:epasys_app/ui/pages/sign_up_page.dart';
import 'package:epasys_app/ui/pages/splash_page.dart';
import 'package:epasys_app/ui/pages/teknisi_page.dart';
import 'package:epasys_app/ui/pages/test_page.dart';
import 'package:epasys_app/ui/pages/upload_avatar_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(Epasys());
}

class Epasys extends StatelessWidget {
  Epasys({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => AuthProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => const SplashPage(),
          '/on-boarding': (context) => const OnBoardingPage(),
          '/sign-in': (context) => const SignInPage(),
          '/sign-up': (context) => const UploadAvatarPage(),
          '/upload-avatar': (context) => const UploadAvatarPage(),
          '/main': (context) => const MainPage(),
          '/satpam': (context) => const SatpamPage(),
          '/teknisi': (context) => const TeknisiPage(),
          '/broadcast': (context) => const TeknisiPage(),
          '/faq': (context) => const TeknisiPage(),
        },
      ),
    );
  }
}
