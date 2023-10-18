import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:manhatan_project/data/models/home_response.dart';

import '../../common/app_theme.dart';
import '../../common/color.dart';

class DetailArtikelMain extends StatefulWidget {
  final Article article;

  const DetailArtikelMain({Key? key, required this.article}) : super(key: key);

  @override
  State<DetailArtikelMain> createState() => _DetailArtikelMainState();
}

class _DetailArtikelMainState extends State<DetailArtikelMain> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
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
          ],
        ),
      ),
      body: ListView(
        children: [
          Column(
            children: [
              Padding(
                // left, top, right, bottom
                padding: const EdgeInsets.fromLTRB(20, 10, 20, 16),
                child: Text(
                  widget.article.name ?? '',
                  style: const TextStyle(
                    fontFamily: 'inter',
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              )
            ],
          ),
          Padding(
            // left, top, right, bottom
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 16),
            child: Column(
              children: [
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: BaseColors.primary500,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        (widget.article.tags?.isNotEmpty ?? false)
                            ? widget.article.tags![0].tag?.name ?? ''
                            : '',
                        style: AppTheme.appTextTheme.xSmallNoneReguler!
                            .copyWith(color: Colors.white),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.calendar_today_rounded,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          DateFormat('dd MMMM yyyy HH:mm').format(
                            DateFormat('yyyy-MM-dd HH:mm:ss')
                                .parse(widget.article.createdAt ?? ''),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
          Column(
            children: [
              CachedNetworkImage(
                imageUrl: widget.article.imagedir ?? '',
                fit: BoxFit.cover,
              ),
            ],
          ),
          const SizedBox(height: 15),
          Padding(
            // left, top, right, bottom
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  Bidi.stripHtmlIfNeeded(widget.article.description ?? '')
                      .trim(),
                  style: AppTheme.appTextTheme.smallNormalReguler!
                      .copyWith(color: BaseColors.neutral600, height: 1.5),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
                Text(
                  Bidi.stripHtmlIfNeeded(widget.article.descriptionEn ?? '')
                      .trim(),
                  style: AppTheme.appTextTheme.smallNormalReguler!
                      .copyWith(color: BaseColors.neutral600, height: 1.5),
                ),
                const SizedBox(height: 10),
                Text(
                  Bidi.stripHtmlIfNeeded(widget.article.nameEn ?? '').trim(),
                  style: AppTheme.appTextTheme.largeNoneMedium!
                      .copyWith(color: BaseColors.neutral950),
                  maxLines: 2,
                ),
                const SizedBox(height: 10),
                Text(
                  Bidi.stripHtmlIfNeeded(widget.article.notag ?? '').trim(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
