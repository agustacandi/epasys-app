import 'package:epasys_app/shared/theme.dart';
import 'package:flutter/material.dart';

class FoundCodePage extends StatefulWidget {
  final String value;
  final Function() screenClosed;
  const FoundCodePage({
    required this.screenClosed,
    required this.value,
    super.key,
  });

  @override
  State<FoundCodePage> createState() => _FoundCodePageState();
}

class _FoundCodePageState extends State<FoundCodePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightBackgroundColor,
      appBar: AppBar(
        title: Text(
          'Found Code',
          style: whiteTextStyle.copyWith(
            fontWeight: bold,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
          onPressed: () {
            widget.screenClosed();
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        children: [
          Text(
            'Found Code:',
            style: blackTextStyle,
          ),
          Text(
            widget.value,
            style: blackTextStyle,
          ),
        ],
      ),
    );
  }
}
