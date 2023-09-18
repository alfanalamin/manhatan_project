import 'package:flutter/material.dart';
import 'package:manhatan_project/common/color.dart';

import '../../common/app_theme.dart';

class DetailMainVarises extends StatefulWidget {
  const DetailMainVarises({Key? key}) : super(key: key);

  @override
  _DetailMainVarisesState createState() => _DetailMainVarisesState();
}

class _DetailMainVarisesState extends State<DetailMainVarises> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
            // GestureDetector(
            //   onTap: () {
            //     Navigator.pop(context);
            //   },
            //   child: Image.asset(
            //     'assets/images/back.png',
            //     width: 30,
            //     height: 30,
            //   ),
            // ),
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
          Image.asset(
            'assets/images/detail 1.png',
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
                      '12 Agustus 2021',
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
                  'Tanda dan Gejala Varises',
                  style: AppTheme.appTextTheme.largeNoneMedium!
                      .copyWith(color: BaseColors.neutral950),
                  maxLines: 2,
                ),
                const SizedBox(height: 10),
                const Text(
                  'Secara klinis, gejala varises dibagi ke dalam beberapa stadium klinis :',
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
                  'STADIUM I',
                  style: AppTheme.appTextTheme.largeNoneMedium!
                      .copyWith(color: BaseColors.neutral950),
                  maxLines: 2,
                ),
                const SizedBox(height: 10),
                const Text(
                  'Pada stadium ini aliran darah vena yang terhambat mencoba mencari “jalan lain” untuk mencapai bagian atas tubuh ke jantung melalui vena-vena penghubung vena luar/bawah kulit (superficial) dengan vena dalam (profunda). Hal ini mengakibatkan sensasi rasa pegal, nyeri, linu, cepat lelah, ”kemeng” atau kebas pada kaki, hingga kaki tampak bengkak setelah melakukan pekerjaan yang melibatkan tungkai dalam waktu lama (cth. Berjalan lama, berdiri lama).',
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
                  'STADIUM I',
                  style: AppTheme.appTextTheme.largeNoneMedium!
                      .copyWith(color: BaseColors.neutral950),
                  maxLines: 2,
                ),
                const SizedBox(height: 10),
                const Text(
                  'Pada stadium ini aliran darah vena yang terhambat mencoba mencari “jalan lain” untuk mencapai bagian atas tubuh ke jantung melalui vena-vena penghubung vena luar/bawah kulit (superficial) dengan vena dalam (profunda). Hal ini mengakibatkan sensasi rasa pegal, nyeri, linu, cepat lelah, ”kemeng” atau kebas pada kaki, hingga kaki tampak bengkak setelah melakukan pekerjaan yang melibatkan tungkai dalam waktu lama (cth. Berjalan lama, berdiri lama).',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
