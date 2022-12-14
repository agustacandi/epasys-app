import 'package:epasys_app/shared/theme.dart';
import 'package:flutter/material.dart';

class VehiclePage extends StatefulWidget {
  const VehiclePage({Key? key}) : super(key: key);

  @override
  State<VehiclePage> createState() => _VehiclePageState();
}

class _VehiclePageState extends State<VehiclePage> {
  bool isLoading = false;

  getVehicles() async {
    setState(() {
      isLoading = true;
    });

    setState(() {
      isLoading = true;
    });
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      getVehicles();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: blueColor,
        onPressed: () {
          Navigator.pushNamed(
            context,
            '/add-vechile',
          );
        },
        child: const Icon(Icons.add),
      ),
      body: Stack(
        children: <Widget>[
          Container(
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
          ),
          Container(
            padding: const EdgeInsets.only(
              top: 60,
              left: 24,
              right: 24,
            ),
            height: 200,
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Kendaraan',
                  style: whiteTextStyle.copyWith(
                    fontSize: 20,
                    fontWeight: bold,
                  ),
                ),
                const SizedBox(
                  height: 28,
                ),
                TextFormField(
                  style: blackTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: semiBold,
                  ),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: whiteColor,
                    hintText: 'Cari kendaraan...',
                    hintStyle: greyTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: semiBold,
                    ),
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(
                          10,
                        ),
                      ),
                      borderSide: BorderSide(
                        width: 0,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 200,
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.only(
                left: 24,
                top: 24,
                right: 24,
              ),
              decoration: BoxDecoration(
                color: lightBackgroundColor,
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(30),
                ),
              ),
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Padding(
                  padding: const EdgeInsets.only(
                    bottom: 24,
                  ),
                  child: Column(
                    children: <Widget>[
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 14,
                          vertical: 10,
                        ),
                        decoration: BoxDecoration(
                          color: whiteColor,
                          border: Border.all(
                            color: greyColor2,
                          ),
                          borderRadius: BorderRadius.circular(
                            10,
                          ),
                        ),
                        child: Row(
                          children: [
                            Container(
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                color: lightBlueColor,
                                shape: BoxShape.circle,
                              ),
                              child: Center(
                                child: Image.asset(
                                  'assets/images/ic_logo.png',
                                  width: 30,
                                  height: 30,
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Motor Mogeku',
                                  style: blackTextStyle,
                                ),
                                Text(
                                  'Yamaha R15 - N116GA',
                                  style: greyTextStyle,
                                ),
                              ],
                            ),
                            const Spacer(),
                            IconButton(
                              icon: Icon(Icons.arrow_forward_ios_rounded),
                              onPressed: () {},
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
