import 'package:epasys_app/models/user_model.dart';
import 'package:epasys_app/providers/auth_provider.dart';
import 'package:epasys_app/shared/theme.dart';
import 'package:epasys_app/ui/widgets/buttons.dart';
import 'package:epasys_app/ui/widgets/forms.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class EditAccountPage extends StatefulWidget {
  const EditAccountPage({
    super.key,
  });

  @override
  State<EditAccountPage> createState() => _EditAccountPageState();
}

class _EditAccountPageState extends State<EditAccountPage> {
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
    AuthProvider userProvider = Provider.of<AuthProvider>(context);
    UserModel user = userProvider.user;
    return Scaffold(
      backgroundColor: lightBackgroundColor,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Edit Account',
          style: whiteTextStyle.copyWith(
            fontWeight: bold,
          ),
        ),
      ),
      body: SafeArea(
        bottom: false,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
          child: SizedBox(
            width: double.infinity,
            child: Column(
              children: [
                SizedBox(
                  width: 100,
                  height: 100,
                  child: Stack(
                    children: [
                      Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(
                              'https://kelompok17stiebi.website/storage/${user.avatar}',
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Align(
                          alignment: Alignment.bottomRight,
                          child: Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: blueColor,
                              border: Border.all(
                                color: whiteColor,
                                width: 3,
                              ),
                            ),
                            child: Icon(
                              Icons.add,
                              color: whiteColor,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                CustomFormField(
                  hintText: '${user.nama}',
                  controller: nameController,
                  icon: Icons.person,
                ),
                const SizedBox(
                  height: 16,
                ),
                CustomFormField(
                  hintText: '${user.nim}',
                  controller: nimController,
                  icon: Icons.person,
                ),
                const SizedBox(
                  height: 16,
                ),
                CustomFormField(
                  hintText: '${user.tanggalLahir}',
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
                      dateController.text =
                          DateFormat('yyyy-MM-dd').format(newDate);
                    });
                  },
                ),
                const SizedBox(
                  height: 16,
                ),
                CustomFormField(
                  hintText: '${user.alamat}',
                  controller: addressController,
                  icon: Icons.navigation,
                ),
                const SizedBox(
                  height: 16,
                ),
                CustomFormField(
                  hintText: '${user.noTelepon}',
                  controller: phoneNumberController,
                  icon: Icons.phone,
                ),
                const SizedBox(
                  height: 16,
                ),
                CustomFormField(
                  hintText: '${user.email}',
                  controller: emailController,
                  icon: Icons.email,
                ),
                const SizedBox(
                  height: 16,
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: CustomButton(
                    width: 100,
                    title: 'Update',
                    textColor: whiteColor,
                    color: greenColor,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
