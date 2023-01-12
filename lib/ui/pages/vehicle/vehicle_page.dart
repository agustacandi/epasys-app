import 'package:epasys_app/providers/auth_provider.dart';
import 'package:epasys_app/providers/vehicle_provider.dart';
import 'package:epasys_app/shared/theme.dart';
import 'package:epasys_app/ui/widgets/history_shimmer.dart';
import 'package:epasys_app/ui/widgets/vehicle_card_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class VehiclePage extends StatefulWidget {
  const VehiclePage({Key? key}) : super(key: key);

  @override
  State<VehiclePage> createState() => _VehiclePageState();
}

class _VehiclePageState extends State<VehiclePage> {
  bool isLoading = true;

  getVehicles() async {
    AuthProvider authProvider =
        Provider.of<AuthProvider>(context, listen: false);
    await Provider.of<VehicleProvider>(context, listen: false)
        .getVehicles(authProvider.user.token!);
    if (mounted) setState(() => isLoading = false);
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
      body: RefreshIndicator(
        onRefresh: () async => getVehicles(),
        child: Stack(
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
                ],
              ),
            ),
            Positioned(
              top: 130,
              bottom: 0,
              left: 0,
              right: 0,
              child: Consumer<VehicleProvider>(
                builder: (context, value, child) => Container(
                  padding: const EdgeInsets.only(
                    left: 24,
                    right: 24,
                  ),
                  decoration: BoxDecoration(
                    color: lightBackgroundColor,
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(30),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(
                      bottom: 24,
                    ),
                    child: isLoading
                        ? const HistoryShimmer()
                        : (value.vehicles.isEmpty
                            ? Center(
                                child: Text(
                                  'Anda belum mendambahkan kendaraan',
                                  style: blackTextStyle,
                                ),
                              )
                            : ListView.separated(
                                separatorBuilder: (context, index) =>
                                    const SizedBox(
                                  height: 15,
                                ),
                                scrollDirection: Axis.vertical,
                                itemCount: value.vehicles.length,
                                itemBuilder: (context, index) {
                                  var vehicle = value.vehicles[index];
                                  return VehicleCardItem(
                                    vehicle: vehicle,
                                  );
                                },
                              )),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
