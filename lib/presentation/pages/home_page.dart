import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:manhatan_project/common/state_enum.dart';
import 'package:manhatan_project/data/models/home_response.dart';
import 'package:manhatan_project/presentation/pages/artikel_main_page.dart';
import 'package:manhatan_project/presentation/pages/detail_artikel_home.dart';
import 'package:manhatan_project/presentation/pages/konsultasi_page.dart';
import 'package:manhatan_project/presentation/providers/home_provider.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../common/app_theme.dart';
import '../../common/color.dart';
import '../components/common/app_navbar.dart';
import '../components/common/skeleton_home_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = PageController();

  @override
  void initState() {
    super.initState();
    Future.microtask(
      () => Provider.of<HomeProvider>(
        context,
        listen: false,
      ).doGetHome(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppNavbar(),
      body: Consumer<HomeProvider>(
        builder: (context, provider, child) {
          if (provider.homeState == RequestState.loading ||
              provider.homeState == RequestState.empty) {
            return const SkeletonHomePage();
          }
          final sliders = provider.homeResponse?.slider ?? [];
          final articles = provider.homeResponse?.article ?? [];
          return ListView(
            children: [
              sliders.isEmpty == true
                  ? const SizedBox()
                  : Container(
                      padding: EdgeInsets.only(
                        left: 16.w,
                        right: 16.w,
                        bottom: 16.h,
                      ),
                      height: 200.h,
                      child: PageView(
                        padEnds: false,
                        controller: controller,
                        children: List.generate(
                          sliders.length,
                          (index) {
                            return Container(
                              height: 200.h,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12.r),
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(12.r),
                                child: CachedNetworkImage(
                                  height: 200.h,
                                  fit: BoxFit.cover,
                                  imageUrl: sliders[index].imagedir ?? '',
                                  placeholder: (context, url) => Container(
                                    height: 200.h,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(
                                        12.r,
                                      ),
                                      color: BaseColors.neutral100,
                                    ),
                                  ),
                                  errorWidget: (context, url, error) =>
                                      Container(
                                    height: 200.h,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(
                                        12.r,
                                      ),
                                      color: BaseColors.neutral100,
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
              sliders.isEmpty == true
                  ? const SizedBox()
                  : Padding(
                      padding: EdgeInsets.only(
                        left: 16.w,
                        bottom: 20.h,
                      ),
                      child: SmoothPageIndicator(
                        controller: controller,
                        count: sliders.length,
                        effect: ExpandingDotsEffect(
                          dotHeight: 12.h,
                          dotWidth: 12.h, // Ukuran tombol pertama
                          dotColor: BaseColors.primary300,
                          activeDotColor: BaseColors.primary500,
                        ),
                      ),
                    ),
              articles.isEmpty == true
                  ? const SizedBox()
                  : Padding(
                      padding: const EdgeInsets.fromLTRB(20, 10, 20, 16),
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: BaseColors.neutral100,
                          border: Border.all(
                            color: BaseColors.neutral200,
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 20,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.asset(
                                'assets/images/Frame 6.png',
                                width: 300,
                              ),
                              const SizedBox(height: 10),
                              Text(
                                'Konsultasi Yuk!',
                                style: AppTheme.appTextTheme.largeNoneMedium
                                    ?.copyWith(
                                  height: 0,
                                  color: BaseColors.neutral950,
                                ),
                              ),
                              Text(
                                'Jika anda punya keluhan dengan kulit anda, jangan ragu untuk konsultasi dengan kami.',
                                style: AppTheme.appTextTheme.smallNormalReguler
                                    ?.copyWith(
                                  height: 1.5,
                                  color: BaseColors.neutral600,
                                ),
                              ),
                              const SizedBox(height: 10),
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const KonsultasiPage(),
                                    ),
                                  );
                                },
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                    vertical: 14.h,
                                  ),
                                  decoration: BoxDecoration(
                                    color: HexColor.fromHex(
                                      '#EC53B8',
                                    ),
                                    borderRadius: BorderRadius.circular(1000.r),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Konsultasi Sekarang',
                                        style: AppTheme
                                            .appTextTheme.smallTightMedium
                                            ?.copyWith(
                                          color: Colors.white,
                                          height: 0,
                                        ),
                                      ),
                                      SizedBox(width: 10.w),
                                      Icon(
                                        Icons.arrow_forward_rounded,
                                        color: Colors.white,
                                        size: 20.w,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 10, 20, 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Artikel Terbaru',
                      style: AppTheme.appTextTheme.largeNoneMedium!
                          .copyWith(color: BaseColors.neutral950),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ArtikelMainPage(),
                          ),
                        );
                      },
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        width: 100,
                        height: 30,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: BaseColors.neutral50,
                          border: Border.all(
                            color: BaseColors.primary200,
                          ),
                        ),
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Lihat Semua',
                                style: AppTheme.appTextTheme.tinyTightMedium!
                                    .copyWith(color: BaseColors.primary500),
                              ),
                              const SizedBox(width: 8),
                              Icon(
                                Icons.arrow_forward_rounded,
                                color: BaseColors.primary500,
                                size: 10,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [for (Article item in articles) _article(item)],
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _article(Article article) {
    final tags = article.tags ?? [];
    return Padding(
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
          mainAxisSize: MainAxisSize.min,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(14.r),
                    topRight: Radius.circular(14.r),
                  ),
                  child: CachedNetworkImage(
                    width: double.infinity,
                    height: 200.h,
                    fit: BoxFit.cover,
                    imageUrl: article.imagedir ?? '',
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
                ),
                tags.isEmpty
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
                            tags[0].tag?.name ?? '',
                            style: AppTheme.appTextTheme.xSmallNoneReguler!
                                .copyWith(color: Colors.white),
                          ),
                        ),
                      ),
              ],
            ),
            const SizedBox(height: 10),
            InkWell(
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
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      article.name ?? '',
                      style: AppTheme.appTextTheme.largeNoneMedium!
                          .copyWith(color: BaseColors.neutral950),
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(
                      height: 4.h,
                    ),
                    Text(
                      Bidi.stripHtmlIfNeeded(article.description ?? '').trim(),
                      style: AppTheme.appTextTheme.smallNormalReguler!
                          .copyWith(color: BaseColors.neutral600, height: 1.5),
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
              ),
            )
          ],
        ),
      ),
    );
  }
}
