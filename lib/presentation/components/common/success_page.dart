import 'package:flutter/material.dart';
import 'package:manhatan_project/common/color.dart';

import '../../../common/app_theme.dart';

class SuccessPage extends StatelessWidget {
  const SuccessPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Image.asset(
              'assets/images/bro.png',
            ),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 16),
            child: Column(
              children: [
                Text(
                  'Konsultasi Berhasil Terkirim',
                  style: AppTheme.appTextTheme.title3!
                      .copyWith(color: BaseColors.neutral950),
                ),
                const SizedBox(height: 10),
                Text(
                  'Konsultasi anda sedang dalam proses,balasan akan dikirim melalui email,Terima Kasih',
                  style: AppTheme.appTextTheme.smallTightMedium!
                      .copyWith(color: BaseColors.neutral600),
                  textAlign: TextAlign.center,
                  maxLines: 3,
                ),
                const SizedBox(height: 10),
                // button elevation kembali ke home
                Center(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: BaseColors.primary500,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                      minimumSize: const Size(
                        343,
                        48,
                      ),
                    ),
                    onPressed: () {},
                    child: const Text(
                      'Kembali ke Home',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Inter',
                        color: Colors.white,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
