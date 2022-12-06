import 'package:epasys_app/providers/auth_provider.dart';
import 'package:epasys_app/shared/theme.dart';
import 'package:epasys_app/ui/widgets/buttons.dart';
import 'package:epasys_app/ui/widgets/forms.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  TextEditingController nimController = TextEditingController(text: '');
  TextEditingController passwordController = TextEditingController(text: '');
  bool isLoading = false;
  bool obscureText = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightBackgroundColor,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            headerSection(),
            const SizedBox(
              height: 150,
            ),
            footerSection(context),
          ],
        ),
      ),
    );
  }

  Widget headerSection() {
    return Container(
      margin: const EdgeInsets.only(top: 70),
      child: Column(
        children: [
          Text(
            'Welcome Back',
            style: blackTextStyle.copyWith(
              fontSize: 24,
              fontWeight: bold,
            ),
          ),
          const SizedBox(
            height: 2,
          ),
          Text(
            'Sign in to continue',
            style: greyTextStyle.copyWith(
              fontSize: 16,
              fontWeight: semiBold,
            ),
          ),
          const SizedBox(
            height: 60,
          ),
          Container(
            width: 315,
            height: 240,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/img_sign_in.png'),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget footerSection(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);

    handleSignIn() async {
      setState(() {
        isLoading = true;
      });

      if (await authProvider.login(
          nimController.text.toUpperCase(), passwordController.text)) {
        Navigator.pushNamedAndRemoveUntil(
          context,
          '/main',
          (route) => false,
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            backgroundColor: Colors.red,
            content: Text(
              'Login failed',
              textAlign: TextAlign.center,
            ),
          ),
        );
      }
      setState(() {
        isLoading = false;
      });
    }

    return Container(
      margin: const EdgeInsets.only(
        bottom: 70,
        left: 24,
        right: 24,
      ),
      child: Column(
        children: [
          CustomFormField(
            hintText: 'NIM',
            controller: nimController,
            icon: Icons.person,
          ),
          const SizedBox(
            height: 16,
          ),
          CustomFormField(
            hintText: 'Password',
            obscureText: obscureText,
            controller: passwordController,
            icon: Icons.password,
            useSuffixIcon: true,
            onTap: () {
              setState(() {
                obscureText = !obscureText;
              });
            },
          ),
          const SizedBox(
            height: 24,
          ),
          isLoading
              ? const LoadingButton()
              : CustomButton(
                  title: 'Sign In',
                  width: double.infinity,
                  color: blueColor,
                  onPressed: handleSignIn,
                ),
          const SizedBox(
            height: 12,
          ),
          TextButton(
            onPressed: () {
              Navigator.pushNamed(context, '/sign-up');
            },
            child: Text(
              'Create New Account',
              style: greyTextStyle.copyWith(
                fontSize: 16,
                fontWeight: semiBold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
