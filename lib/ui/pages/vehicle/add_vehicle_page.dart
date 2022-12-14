import 'package:epasys_app/shared/theme.dart';
import 'package:flutter/material.dart';

class AddVehiclePage extends StatefulWidget {
  const AddVehiclePage({super.key});

  @override
  State<AddVehiclePage> createState() => _AddVehiclePageState();
}

class _AddVehiclePageState extends State<AddVehiclePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightBackgroundColor,
      appBar: AppBar(
        title: Text(
          'Tambah Kendaraan',
          style: whiteTextStyle.copyWith(
            fontWeight: bold,
          ),
        ),
        centerTitle: true,
      ),
    );
  }
}
