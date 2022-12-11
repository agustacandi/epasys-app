import 'package:epasys_app/models/broadcast_model.dart';
import 'package:epasys_app/shared/theme.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class BroadcastDetailPage extends StatefulWidget {
  final BroadcastModel broadcast;
  const BroadcastDetailPage({
    required this.broadcast,
    super.key,
  });

  @override
  State<BroadcastDetailPage> createState() => _BroadcastDetailPageState();
}

class _BroadcastDetailPageState extends State<BroadcastDetailPage> {
  String convertEpochTimeStamp(DateTime date) {
    DateFormat format = DateFormat('EEEE, dd MMMM yyyy', 'id_ID');
    String dateFormated = format.format(date);
    return dateFormated;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightBackgroundColor,
      appBar: AppBar(
        title: Text(
          'Broadcast',
          style: whiteTextStyle.copyWith(
            fontWeight: bold,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                height: 250,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    10,
                  ),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                      'https://kelompok17stiebi.website/storage/${widget.broadcast.imgUrl}',
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(
                  16,
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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.broadcast.judul!,
                      style: blackTextStyle.copyWith(
                        fontSize: 20,
                        fontWeight: bold,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Diposting oleh Satpam ${widget.broadcast.employee!.nama} pada ${convertEpochTimeStamp(widget.broadcast.createdAt!)}',
                      style: blackTextStyle,
                    ),
                    Divider(
                      color: greyColor,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Deskripsi',
                      style: blackTextStyle.copyWith(
                        fontSize: 20,
                        fontWeight: bold,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      widget.broadcast.body!,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
