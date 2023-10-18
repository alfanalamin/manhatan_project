import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masonry_view/flutter_masonry_view.dart';
import 'package:get_it/get_it.dart';
import 'package:manhatan_project/common/app_shared_preferences.dart';
import 'package:manhatan_project/common/app_theme.dart';
import 'package:manhatan_project/common/color.dart';
import 'package:manhatan_project/common/state_enum.dart';
import 'package:manhatan_project/data/models/galery_response.dart';
import 'package:manhatan_project/presentation/components/common/skeleton_galery.dart';
import 'package:manhatan_project/presentation/pages/about_main_page.dart';
import 'package:manhatan_project/presentation/pages/main_page.dart';
import 'package:manhatan_project/presentation/providers/galery_provider.dart';
import 'package:provider/provider.dart';

class GaleryMainPage extends StatefulWidget {
  const GaleryMainPage({super.key});

  @override
  State<GaleryMainPage> createState() => _GaleryMainPageState();
}

class _GaleryMainPageState extends State<GaleryMainPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<GaleryProvider>(
        context,
        listen: false,
      ).doGetGalery();
    });
  }

  void _showImageDialog(String image, String name) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          elevation: 0,
          backgroundColor: Colors.transparent,
          contentPadding: EdgeInsets.zero,
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Center(
                child: SizedBox(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.6,
                  child: Ink(
                    color: Colors.transparent,
                    child: CachedNetworkImage(
                      imageUrl: image,
                      fit: BoxFit.cover,
                      placeholder: (context, url) =>
                          const CircularProgressIndicator(),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Text(
                name,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        automaticallyImplyLeading: false,
        elevation: 0,
        shadowColor: Colors.transparent,
        backgroundColor: Colors.white,
        title: Padding(
          padding: const EdgeInsets.fromLTRB(10, 10, 10, 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Galeri',
                style: AppTheme.appTextTheme.regulerNoneMedium!.copyWith(
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
                            style: AppTheme.appTextTheme.xSmallNoneMedium!
                                .copyWith(color: BaseColors.neutral950),
                          ),
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const AboutMainPage()),
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
      body: Consumer<GaleryProvider>(
        builder: (context, provider, child) {
          if (provider.galeryState == RequestState.loading ||
              provider.galeryState == RequestState.empty) {
            return const SkeletonGalery();
          }
          final gallery = provider.galeryResponse?.galery ?? [];
          gallery.isNotEmpty ? const SizedBox(height: 10) : const SizedBox();
          return ListView(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 10, 0, 16),
                child: MasonryView(
                  listOfItem: gallery,
                  numberOfColumn: 2,
                  itemBuilder: (item) {
                    final galleryItem = item as Galery;
                    final image = galleryItem.imagedir;
                    final name = galleryItem.name;
                    return GestureDetector(
                      onTap: () {
                        _showImageDialog(image ?? '', name ?? '');
                      },
                      child: ClipRRect(
                        child: CachedNetworkImage(
                          imageUrl: image ?? '',
                          fit: BoxFit.cover,
                          placeholder: (context, url) =>
                              const CircularProgressIndicator(),
                          errorWidget: (context, url, error) =>
                              const Icon(Icons.error),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
