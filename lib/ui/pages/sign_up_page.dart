import 'package:epasys_app/providers/auth_provider.dart';
import 'package:epasys_app/providers/parking_provider.dart';
import 'package:epasys_app/shared/theme.dart';
import 'package:epasys_app/ui/widgets/buttons.dart';
import 'package:epasys_app/ui/widgets/forms.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController nameController = TextEditingController(text: '');
  TextEditingController nimController = TextEditingController(text: '');
  TextEditingController dateController = TextEditingController(text: '');
  TextEditingController addressController = TextEditingController(text: '');
  TextEditingController emailController = TextEditingController(text: '');
  TextEditingController phoneNumberController = TextEditingController(text: '');
  TextEditingController passwordController = TextEditingController(text: '');
  TextEditingController passwordConfirmationController =
      TextEditingController(text: '');

  bool isLoading = false;
  bool obscureText = true;
  bool obscureText2 = true;
  DateTime date = DateTime.now();

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
              height: 120,
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
            'Register',
            style: blackTextStyle.copyWith(
              fontSize: 24,
              fontWeight: bold,
            ),
          ),
          const SizedBox(
            height: 2,
          ),
          Text(
            'Sign up to create new account',
            style: greyTextStyle.copyWith(
              fontSize: 16,
              fontWeight: semiBold,
            ),
          ),
          const SizedBox(
            height: 60,
          ),
          Container(
            width: 234,
            height: 258,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/img_sign_up.png'),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget footerSection(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    ParkingProvider parkingProvider = Provider.of<ParkingProvider>(context);

    handleSignUp() async {
      setState(() {
        isLoading = true;
      });

      if (await authProvider.register(
          nameController.text,
          nimController.text.toUpperCase(),
          emailController.text,
          addressController.text,
          phoneNumberController.text,
          dateController.text,
          passwordController.text,
          passwordConfirmationController.text)) {
        await parkingProvider.getLatestParkings(authProvider.user.token!);
        await parkingProvider.getParkings(authProvider.user.token!);
        if (!mounted) return;
        Navigator.pushNamedAndRemoveUntil(
            context, '/upload-avatar', (route) => false);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            backgroundColor: Colors.red,
            content: Text(
              'Failed to register',
              textAlign: TextAlign.center,
            ),
          ),
        );
      }
      setState(() {
        isLoading = true;
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
            hintText: 'Full Name',
            controller: nameController,
            icon: Icons.person,
          ),
          const SizedBox(
            height: 16,
          ),
          CustomFormField(
            hintText: 'NIM',
            controller: nimController,
            icon: Icons.person,
          ),
          const SizedBox(
            height: 16,
          ),
          CustomFormField(
            hintText: 'Date of Birth',
            controller: dateController,
            icon: Icons.calendar_month,
            useSuffixIcon: true,
            suffixIcon: Icons.edit,
            onTap: () async {
              DateTime? newDate = await showDatePicker(
                context: context,
                initialDate: date,
                firstDate: DateTime(1995),
                lastDate: DateTime(2050),
              );

              if (newDate == null) return;

              setState(() {
                date = newDate;
                dateController.text = DateFormat('yyyy-MM-dd').format(newDate);
              });
            },
          ),
          const SizedBox(
            height: 16,
          ),
          CustomFormField(
            hintText: 'Address',
            controller: addressController,
            icon: Icons.navigation,
          ),
          const SizedBox(
            height: 16,
          ),
          CustomFormField(
            hintText: 'Phone Number (+628XXX)',
            controller: phoneNumberController,
            icon: Icons.phone,
          ),
          const SizedBox(
            height: 16,
          ),
          CustomFormField(
            hintText: 'Email Address',
            controller: emailController,
            icon: Icons.email,
          ),
          const SizedBox(
            height: 16,
          ),
          CustomFormField(
            hintText: 'Password',
            obscureText: obscureText,
            controller: passwordController,
            icon: Icons.password,
            suffixIcon: Icons.visibility_off,
            suffixIcon2: Icons.visibility,
            useSuffixIcon: true,
            onTap: () {
              setState(() {
                obscureText = !obscureText;
              });
            },
          ),
          const SizedBox(
            height: 16,
          ),
          CustomFormField(
            hintText: 'Confirm Password',
            obscureText: obscureText2,
            controller: passwordConfirmationController,
            icon: Icons.password,
            suffixIcon: Icons.visibility_off,
            suffixIcon2: Icons.visibility,
            useSuffixIcon: true,
            onTap: () {
              setState(() {
                obscureText2 = !obscureText2;
              });
            },
          ),
          const SizedBox(
            height: 24,
          ),
          isLoading
              ? const LoadingButton()
              : CustomButton(
                  title: 'Sign Up',
                  width: double.infinity,
                  color: blueColor,
                  onPressed: handleSignUp,
                ),
          const SizedBox(
            height: 12,
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text(
              'Back to Log In',
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
