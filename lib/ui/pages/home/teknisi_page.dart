import 'package:epasys_app/models/employee_model.dart';
import 'package:epasys_app/providers/auth_provider.dart';
import 'package:epasys_app/providers/employee_provider.dart';
import 'package:epasys_app/shared/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quickalert/quickalert.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../widgets/skeleton.dart';

class TeknisiPage extends StatefulWidget {
  const TeknisiPage({super.key});

  @override
  State<TeknisiPage> createState() => _TeknisiPageState();
}

class _TeknisiPageState extends State<TeknisiPage> {
  bool isLoading = false;
  getAllDataEmployees() async {
    setState(() {
      isLoading = true;
    });
    await Provider.of<EmployeeProvider>(context, listen: false).getTeknisi();
    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();

    Future.delayed(Duration.zero, () {
      getAllDataEmployees();
    });
  }

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
          child: Consumer<EmployeeProvider>(
            builder: (context, value, child) => Column(
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
                        width: 100,
                      ),
                      Text(
                        'Teknisi',
                        style: whiteTextStyle.copyWith(
                            fontSize: 20, fontWeight: bold),
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 30),
                    decoration: BoxDecoration(
                      color: lightBackgroundColor,
                      borderRadius: const BorderRadius.vertical(
                        top: Radius.circular(30),
                      ),
                    ),
                    child: isLoading
                        ? Column(
                            children: const [
                              Shimmer(),
                              Shimmer(),
                              Shimmer(),
                            ],
                          )
                        : ListView.builder(
                            itemCount: value.teknisi.length,
                            itemBuilder: (context, index) {
                              var teknisi = value.teknisi[index];
                              return Container(
                                padding: const EdgeInsets.all(15),
                                margin: const EdgeInsets.only(
                                  bottom: 10,
                                ),
                                decoration: BoxDecoration(
                                  color: whiteColor,
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                    color: greyColor2,
                                  ),
                                ),
                                child: Row(
                                  children: [
                                    Container(
                                      width: 60,
                                      height: 60,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: NetworkImage(
                                              'https://kelompok17stiebi.website/storage/${teknisi.avatar}'),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 12,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          teknisi.nama!,
                                          style: blackTextStyle.copyWith(
                                            fontSize: 16,
                                            fontWeight: bold,
                                          ),
                                        ),
                                        Text(
                                          'Teknisi Lab Falcon',
                                          style: greyTextStyle.copyWith(
                                            fontWeight: semiBold,
                                          ),
                                        ),
                                      ],
                                    ),
                                    const Spacer(),
                                    IconButton(
                                      onPressed: () async {
                                        Uri url = Uri.parse(
                                            'https://api.whatsapp.com/send/?phone=${teknisi.noTelepon}');
                                        if (await canLaunchUrl(url)) {
                                          await launchUrl(
                                            url,
                                            mode:
                                                LaunchMode.externalApplication,
                                          );
                                        }
                                      },
                                      icon: Image.asset(
                                        'assets/images/ic_whatsapp.png',
                                        width: 24,
                                      ),
                                    )
                                  ],
                                ),
                              );
                            },
                          ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
