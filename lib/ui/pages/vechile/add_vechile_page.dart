import 'package:epasys_app/shared/theme.dart';
import 'package:flutter/material.dart';

class AddVechilePage extends StatefulWidget {
  const AddVechilePage({super.key});

  @override
  State<AddVechilePage> createState() => _AddVechilePageState();
}

class _AddVechilePageState extends State<AddVechilePage> {
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
