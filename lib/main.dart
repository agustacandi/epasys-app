import 'package:epasys_app/providers/auth_provider.dart';
import 'package:epasys_app/ui/pages/account/detail_account_page.dart';
import 'package:epasys_app/ui/pages/account/edit_account_page.dart';
import 'package:epasys_app/ui/pages/main_page.dart';
import 'package:epasys_app/ui/pages/onboarding_page.dart';
import 'package:epasys_app/ui/pages/satpam_page.dart';
import 'package:epasys_app/ui/pages/sign_in_page.dart';
import 'package:epasys_app/ui/pages/sign_up_page.dart';
import 'package:epasys_app/ui/pages/splash_page.dart';
import 'package:epasys_app/ui/pages/teknisi_page.dart';
import 'package:epasys_app/ui/pages/upload_avatar_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    const Epasys(),
  );
}

class Epasys extends StatelessWidget {
  const Epasys({Key? key}) : super(key: key);

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
          '/sign-up': (context) => const SignUpPage(),
          '/upload-avatar': (context) => const UploadAvatarPage(),
          '/main': (context) => const MainPage(),
          '/satpam': (context) => const SatpamPage(),
          '/teknisi': (context) => const TeknisiPage(),
          '/broadcast': (context) => const TeknisiPage(),
          '/faq': (context) => const TeknisiPage(),
          '/detail-account': (context) => const DetailAccountPage(),
          '/edit-account': (context) => const EditAccountPage(),
        },
      ),
    );
  }
}
