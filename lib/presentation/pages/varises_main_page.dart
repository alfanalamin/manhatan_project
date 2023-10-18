import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:intl/intl.dart';
import 'package:manhatan_project/common/app_shared_preferences.dart';
import 'package:manhatan_project/common/app_theme.dart';
import 'package:manhatan_project/common/color.dart';
import 'package:manhatan_project/common/state_enum.dart';
import 'package:manhatan_project/data/models/varises_response.dart';
import 'package:manhatan_project/presentation/components/common/skeleton_home_page.dart';
import 'package:manhatan_project/presentation/pages/about_main_page.dart';
import 'package:manhatan_project/presentation/pages/main_page.dart';
import 'package:manhatan_project/presentation/providers/varises_provider.dart';
import 'package:provider/provider.dart';
import 'detail_main_varises.dart';

class VarisesMainPage extends StatefulWidget {
  const VarisesMainPage({Key? key}) : super(key: key);

  @override
  _VarisesMainPageState createState() => _VarisesMainPageState();
}

class _VarisesMainPageState extends State<VarisesMainPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<VarisesProvider>(
        context,
        listen: false,
      ).doGetVarises();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        title: Padding(
          padding: const EdgeInsets.fromLTRB(10, 10, 10, 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Varises',
                style: AppTheme.appTextTheme.regulerNoneMedium?.copyWith(
                  color: BaseColors.neutral950,
                ),
              ),
              Row(
                children: [
                  InkWell(
                    onTap: () {
                      GetIt.I<AppSharedPreferences>().toggleLang();
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const MainPage(),
                        ),
                      );
                    },
                    child: Container(
                      width: 60,
                      height: 35,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white,
                        border: Border.all(
                          color: BaseColors.neutral200,
                        ),
                      ),
                      child: Row(
                        children: [
                          Image.asset(
                            'assets/images/flag_${GetIt.I<AppSharedPreferences>().getLang()}.png',
                            width: 30,
                            height: 30,
                          ),
                          const SizedBox(width: 8),
                          Text(
                            GetIt.I<AppSharedPreferences>()
                                .getLang()
                                .toUpperCase(),
                            style: AppTheme.appTextTheme.xSmallNoneMedium
                                ?.copyWith(
                              color: BaseColors.neutral950,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const AboutMainPage(),
                        ),
                      );
                    },
                    child: const Icon(
                      Icons.info_outline_rounded,
                      color: Colors.black,
                      size: 35,
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
      body: Consumer<VarisesProvider>(
        builder: (context, provider, child) {
          if (provider.varisesState == RequestState.loading ||
              provider.varisesState == RequestState.empty) {
            return const SkeletonHomePage();
          }
          final varisess = provider.varisesResponse?.varises ?? [];
          return ListView(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 16),
                child: Container(
                  margin: const EdgeInsets.only(top: 5),
                  width: double.infinity,
                  height: 180.h,
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(20),
                    image: const DecorationImage(
                      image: AssetImage("assets/images/Group 101.png"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              varisess.isNotEmpty
                  ? const SizedBox(height: 10)
                  : const SizedBox(),
              varisess.isNotEmpty
                  ? Padding(
                      padding: const EdgeInsets.fromLTRB(20, 0, 20, 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Ketahui Lebih Dalam',
                            style:
                                AppTheme.appTextTheme.largeNoneMedium?.copyWith(
                              color: BaseColors.neutral950,
                              height: 0,
                            ),
                          ),
                        ],
                      ),
                    )
                  : const SizedBox(),
              for (Varises varises in varisess) _varises(varises),
            ],
          );
        },
      ),
    );
  }

  Widget _varises(Varises varises) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 16),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: BaseColors.neutral100,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 20,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(14.r),
                child: CachedNetworkImage(
                  imageUrl: varises.imagedir ?? '',
                  width: double.infinity,
                  height: 200,
                  fit: BoxFit.cover,
                  placeholder: (context, url) => const Center(
                    child: CircularProgressIndicator(),
                  ),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              ),
              SizedBox(height: 10.h),
              Text(
                varises.name ?? '',
                style: AppTheme.appTextTheme.largeNoneMedium?.copyWith(
                  color: BaseColors.neutral950,
                  height: 0,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                Bidi.stripHtmlIfNeeded(varises.description ?? '').trim(),
                style: AppTheme.appTextTheme.xSmallNoneMedium?.copyWith(
                  color: BaseColors.neutral600,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
              SizedBox(
                height: 16.h,
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailMainVarises(
                        varises: varises,
                      ),
                    ),
                  );
                },
                child: Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.symmetric(
                    vertical: 12.h,
                  ),
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(1000.r),
                      border: Border.all(
                        color: BaseColors.primary200,
                      ),
                      color: BaseColors.primary50),
                  child: Text(
                    'Baca Selengkapnya',
                    style: TextStyle(
                      color: BaseColors.primary500,
                      fontSize: 12,
                      fontFamily: 'Inter',
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
