import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:manhatan_project/data/models/home_response.dart';
import 'package:manhatan_project/presentation/pages/detail_artikel_home.dart';
import 'package:manhatan_project/presentation/providers/home_provider.dart';
import 'package:provider/provider.dart';

import 'package:intl/intl.dart';

import '../../common/app_theme.dart';
import '../../common/color.dart';
import '../components/common/skeleton_home_page.dart';

class ArtikelMainPage extends StatefulWidget {
  // ignore: use_key_in_widget_constructors
  const ArtikelMainPage({Key? key});

  @override
  State<ArtikelMainPage> createState() => _ArtikelMainPageState();
}

class _ArtikelMainPageState extends State<ArtikelMainPage> {
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    Future.delayed(
      const Duration(seconds: 2),
      () => setState(() {
        isLoading = false;
      }),
    );
  }

  TextEditingController searchController = TextEditingController();
  bool isSearching = false;
  List<Article> searchResults = [];

  @override
  Widget build(BuildContext context) {
    final homeProvider = Provider.of<HomeProvider>(context);

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        title: isSearching ? _buildSearchField() : _buildTitle(),
        actions: _buildActions(),
      ),
      body: isLoading
          ? const SkeletonHomePage()
          : ListView(
              children: [
                Column(
                  children: [
                    _buildArticleList(homeProvider.homeResponse?.article ?? []),
                  ],
                ),
              ],
            ),
    );
  }

  List<Widget> _buildActions() {
    if (isSearching) {
      return [
        IconButton(
          icon: const Icon(
            Icons.clear,
            color: Colors.black,
          ),
          onPressed: () {
            setState(() {
              isSearching = false;
              searchController.clear();
              searchResults.clear();
            });
          },
        ),
      ];
    } else {
      return [
        IconButton(
          icon: const Icon(
            Icons.search,
            color: Colors.black,
          ),
          onPressed: () {
            setState(() {
              isSearching = true;
            });
          },
        ),
      ];
    }
  }

  Widget _buildTitle() {
    return Text(
      'Artikel',
      style: AppTheme.appTextTheme.regulerNormalMedium!
          .copyWith(color: BaseColors.neutral950),
    );
  }

  Widget _buildSearchField() {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(top: 8),
        child: TextField(
          controller: searchController,
          onChanged: (query) {
            onSearch(query);
          },
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(
              vertical: 1,
              horizontal: 30,
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: BaseColors.neutral200,
              ),
              borderRadius: BorderRadius.circular(50),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: BaseColors.neutral200,
              ),
              borderRadius: BorderRadius.circular(50),
            ),
            hintText: 'Search',
            hintStyle: AppTheme.appTextTheme.xSmallNormalReguler!
                .copyWith(color: BaseColors.neutral400),
          ),
        ),
      ),
    );
  }

  Widget _buildArticleList(List<Article> articles) {
    List<Article> displayArticles = isSearching ? searchResults : articles;

    return Column(
      children: displayArticles.map((article) {
        return InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DetailArtikelMain(
                  article: article,
                ),
              ),
            );
          },
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 10, 20, 16),
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: BaseColors.neutral100,
                border: Border.all(
                  color: BaseColors.neutral50,
                ),
              ),
              child: Column(
                children: [
                  Stack(
                    children: [
                      CachedNetworkImage(
                        width: double.infinity,
                        height: 200.h,
                        fit: BoxFit.cover,
                        imageUrl: article.imagedir ?? '',
                        imageBuilder: (context, imageProvider) => ClipRRect(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(14.r),
                            topRight: Radius.circular(14.r),
                          ),
                          child: Image(
                            image: imageProvider,
                            fit: BoxFit.cover,
                          ),
                        ),
                        placeholder: (context, url) => Container(
                          height: 200.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                              12.r,
                            ),
                            color: BaseColors.neutral100,
                          ),
                        ),
                        errorWidget: (context, url, error) => Container(
                          height: 200.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(14.r),
                              topRight: Radius.circular(14.r),
                            ),
                            color: BaseColors.neutral100,
                          ),
                        ),
                      ),
                      (article.tags?.isEmpty == true)
                          ? const SizedBox()
                          : Positioned(
                              bottom: 10,
                              left: 10,
                              child: Container(
                                padding: const EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  color: BaseColors.primary500,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Text(
                                  article.tags![0].tag?.name ?? '',
                                  style: AppTheme
                                      .appTextTheme.xSmallNoneReguler!
                                      .copyWith(color: Colors.white),
                                ),
                              ),
                            ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    child: Column(
                      children: [
                        Text(
                          article.name ?? '',
                          style: AppTheme.appTextTheme.largeNoneMedium!
                              .copyWith(color: BaseColors.neutral950),
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          Bidi.stripHtmlIfNeeded(article.description ?? '')
                              .trim(),
                          style: AppTheme.appTextTheme.smallNormalReguler!
                              .copyWith(
                                  color: BaseColors.neutral600, height: 1.5),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                        ),
                        SizedBox(
                          height: 12.h,
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.calendar_today_rounded,
                              color: BaseColors.neutral600,
                              size: 15,
                            ),
                            const SizedBox(width: 5),
                            Text(
                              DateFormat('dd MMMM yyyy HH:mm').format(
                                  DateFormat('yyyy-MM-dd HH:mm:ss')
                                      .parse(article.createdAt ?? '')),
                              style: AppTheme.appTextTheme.smallNoneReguler!
                                  .copyWith(color: BaseColors.neutral500),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      }).toList(),
    );
  }

  void onSearch(String query) {
    if (query.isEmpty) {
      // Jika kueri kosong, tampilkan semua artikel
      setState(() {
        searchResults = [];
      });
    } else {
      // Jika kueri tidak kosong, cari artikel yang sesuai
      final homeProvider = Provider.of<HomeProvider>(context, listen: false);
      final allArticles = homeProvider.homeResponse?.article ?? [];

      final results = allArticles.where((article) {
        return article.name?.toLowerCase().contains(query.toLowerCase()) ??
            false;
      }).toList();

      setState(() {
        searchResults = results;
      });
    }
  }
}
