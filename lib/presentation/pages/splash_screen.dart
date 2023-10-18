import 'package:flutter/material.dart';
import 'package:manhatan_project/presentation/pages/main_page.dart';

import '../../common/color.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Menggunakan Future.delayed untuk menunda navigasi ke HomePage.
    Future.delayed(
      const Duration(seconds: 3),
      () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const MainPage(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment:
            Alignment.bottomCenter, // Untuk membuat teks ada di bagian bawah.
        children: [
          Center(
            child: Image.asset(
              'assets/images/image 1.png',
              width: 200,
              height: 200,
            ),
          ),
          Positioned(
            bottom: 10, // Untuk mengatur posisi teks.
            child: Text(
              'V.1.1.0',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: BaseColors.neutral500,
                height: 2.4,
                fontFamily: 'Inter',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
