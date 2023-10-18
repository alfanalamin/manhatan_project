import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:varises/common/color.dart';
import 'package:varises/common/state_enum.dart';
import 'package:varises/presentation/providers/about_provider.dart';

class AboutMainPage extends StatefulWidget {
  const AboutMainPage({Key? key}) : super(key: key);

  @override
  State<AboutMainPage> createState() => _AboutMainPageState();
}

class _AboutMainPageState extends State<AboutMainPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<AboutProvider>(
        context,
        listen: false,
      ).doGetAbout();
    });
  }

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
              ),
            ),
            const Text(
              'Tentang',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
      body: Consumer<AboutProvider>(
        builder: (context, provider, child) {
          if (provider.aboutState == RequestState.loading ||
              provider.aboutState == RequestState.empty) {
            return const Center(child: CircularProgressIndicator());
          }
          final about = provider.aboutResponse?.about;
          if (about != null) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  // Tambahkan gambar di sini
                  Image.asset(
                    'assets/images/Mask group.png',
                    fit: BoxFit.cover,
                  ),
                  Text(
                    'Tentang',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'Inter',
                      color: BaseColors.neutral950,
                    ),
                  ),
                  Text(
                    about.name ?? '',
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 10, 20, 20),
                    child: Text(
                      Bidi.stripHtmlIfNeeded(about.description ?? '').trim(),
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                      ),
                      textAlign: TextAlign.justify,
                    ),
                  ),
                  SizedBox(
                    width: 400,
                    height: 200,
                    child: CachedNetworkImage(
                      imageUrl: about.gmapQuery ?? '',
                      width: double.infinity,
                      height: 200,
                      fit: BoxFit.cover,
                      placeholder: (context, url) => const Center(
                        child: CircularProgressIndicator(),
                      ),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                    ),
                  ),
                  Stack(
                    children: [
                      Container(
                        width: double.infinity,
                        height: 100,
                        decoration: BoxDecoration(
                          color: BaseColors.primary400,
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: Image.asset(
                          'assets/images/Ellipse 5.png',
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        left: 0,
                        child: Image.asset(
                          'assets/images/Ellipse 4.png',
                        ),
                      ),
                      const Positioned(
                        bottom: 20,
                        left: 0,
                        right: 0,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Open Hour',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                                fontFamily: 'Inter',
                                color: Colors.white,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(height: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  children: [
                                    Icon(
                                      Icons.calendar_today_outlined,
                                      color: Colors.white,
                                      size: 24,
                                    ),
                                    SizedBox(width: 10),
                                    Text(
                                      'Senin - Jumat',
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                        fontFamily: 'Inter',
                                        color: Colors.white,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ],
                                ),
                                SizedBox(width: 20),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.lock_clock_outlined,
                                      color: Colors.white,
                                      size: 24,
                                    ),
                                    SizedBox(width: 10),
                                    Text(
                                      '08.00 - 17.00',
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                        fontFamily: 'Inter',
                                        color: Colors.white,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                    // Text(
                                    //   Bidi.stripHtmlIfNeeded(
                                    //           about.opentime ?? '')
                                    //       .trim(),
                                    //   style: const TextStyle(
                                    //     fontSize: 14,
                                    //     fontWeight: FontWeight.w400,
                                    //     fontFamily: 'Inter',
                                    //     color: Colors.white,
                                    //   ),
                                    //   textAlign: TextAlign.center,
                                    // ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Divider(
                    color: BaseColors.neutral300,
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'Kontak Info',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'Inter',
                      color: BaseColors.neutral950,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Column(
                    children: [
                      Icon(
                        Icons.add_location_outlined,
                        color: BaseColors.primary400,
                      ),
                      const SizedBox(height: 10),
                      Text(
                        'Address :',  
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          fontFamily: 'Inter',
                          color: BaseColors.neutral950,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        about.address ?? '',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          fontFamily: 'Inter',
                          color: BaseColors.neutral950,
                        ),
                        textAlign: TextAlign.center,
                        maxLines: 2,
                      ),
                      const SizedBox(height: 20),
                      Icon(
                        Icons.phone_outlined,
                        color: BaseColors.primary400,
                      ),
                      const SizedBox(height: 10),
                      Text(
                        'Telepon :',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          fontFamily: 'Inter',
                          color: BaseColors.neutral950,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        about.phone ?? '',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          fontFamily: 'Inter',
                          color: BaseColors.neutral950,
                        ),
                        textAlign: TextAlign.center,
                        maxLines: 2,
                      ),
                      const SizedBox(height: 20),
                      Icon(
                        Icons.email_outlined,
                        color: BaseColors.primary400,
                      ),
                      const SizedBox(height: 10),
                      Text(
                        'Email :',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          fontFamily: 'Inter',
                          color: BaseColors.neutral950,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        about.email ?? '',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          fontFamily: 'Inter',
                          color: BaseColors.neutral950,
                        ),
                        textAlign: TextAlign.center,
                        maxLines: 2,
                      ),
                    ],
                  ),
                ],
              ),
            );
          } else {
            return const Center(child: Text('Data tidak ditemukan'));
          }
        },
      ),
    );
  }
}
