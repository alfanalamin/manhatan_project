import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:manhatan_project/data/models/varises_response.dart';
import '../../common/app_theme.dart';
import '../../common/color.dart';

class DetailMainVarises extends StatefulWidget {
  final Varises varises;
  const DetailMainVarises({Key? key, required this.varises}) : super(key: key);

  @override
  _DetailMainVarisesState createState() => _DetailMainVarisesState();
}

class _DetailMainVarisesState extends State<DetailMainVarises> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 0,
        title: Row(
          children: [
            IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.arrow_back_ios,
                  color: Colors.black,
                )),
            Text(
              'Tanda dan Gejala Varises',
              style: AppTheme.appTextTheme.regulerNoneMedium!
                  .copyWith(color: BaseColors.neutral950),
            ),
          ],
        ),
      ),
      body: ListView(
        children: [
          Column(
            children: [
              CachedNetworkImage(
                imageUrl: widget.varises.imagedir ?? '',
                fit: BoxFit.cover,
              ),
            ],
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 16),
            child: Column(
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.calendar_today_rounded,
                      color: BaseColors.neutral600,
                      size: 15,
                    ),
                    const SizedBox(width: 5),
                    Text(
                      widget.varises.tgl ?? '',
                      style: AppTheme.appTextTheme.smallNoneReguler!
                          .copyWith(color: BaseColors.neutral500),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.varises.name ?? '',
                  style: AppTheme.appTextTheme.largeNoneMedium!
                      .copyWith(color: BaseColors.neutral950),
                  maxLines: 2,
                ),
                const SizedBox(height: 10),
                Text(
                  widget.varises.nameEn ?? '',
                ),
                Text(
                  Bidi.stripHtmlIfNeeded(widget.varises.description ?? '')
                      .trim(),
                  style: AppTheme.appTextTheme.xSmallNoneMedium?.copyWith(
                    color: BaseColors.neutral600,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 10),
                Text(
                  Bidi.stripHtmlIfNeeded(widget.varises.description ?? '')
                      .trim(),
                  style: AppTheme.appTextTheme.xSmallNoneMedium?.copyWith(
                    color: BaseColors.neutral600,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                  ),
                  textAlign: TextAlign.justify,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
