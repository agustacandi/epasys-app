import 'package:epasys_app/providers/auth_provider.dart';
import 'package:epasys_app/providers/broadcast_provider.dart';
import 'package:epasys_app/ui/pages/account/change_password_page.dart';
import 'package:epasys_app/ui/pages/account/detail_account_page.dart';
import 'package:epasys_app/ui/pages/account/edit_account_page.dart';
import 'package:epasys_app/ui/pages/history/history_detail_page.dart';
import 'package:epasys_app/ui/pages/main_page.dart';
import 'package:epasys_app/ui/pages/onboarding_page.dart';
import 'package:epasys_app/ui/pages/qr/check_in_page.dart';
import 'package:epasys_app/ui/pages/home/satpam_page.dart';
import 'package:epasys_app/ui/pages/sign_in_page.dart';
import 'package:epasys_app/ui/pages/sign_up_page.dart';
import 'package:epasys_app/ui/pages/splash_page.dart';
import 'package:epasys_app/ui/pages/home/teknisi_page.dart';
import 'package:epasys_app/ui/pages/upload_avatar_page.dart';
import 'package:epasys_app/ui/pages/vechile/add_vechile_page.dart';
import 'package:epasys_app/ui/pages/vechile/detail_vechile.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDateFormatting('id_ID', null).then(
    (value) => runApp(
      const Epasys(),
    ),
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
        ChangeNotifierProvider(
          create: (context) => BroadcastProvider(),
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
          '/check-in': (context) => const CheckInPage(),
          '/check-out': (context) => const TeknisiPage(),
          '/faq': (context) => const TeknisiPage(),
          '/detail-account': (context) => const DetailAccountPage(),
          '/edit-account': (context) => const EditAccountPage(),
          '/change-password': (context) => const ChangePasswordPage(),
          '/add-vechile': (context) => const AddVechilePage(),
          '/detail-vechile': (context) => const DetailVechilePage(),
          '/detail-history': (context) => const HistoryDetailPage(),
        },
      ),
    );
  }
}
