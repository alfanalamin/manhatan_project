import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

import '../../common/app_theme.dart';
import '../../common/color.dart';

class KonsultasiPage extends StatefulWidget {
  const KonsultasiPage({super.key});

  @override
  State<KonsultasiPage> createState() => _KonsultasiPageState();
}

class _KonsultasiPageState extends State<KonsultasiPage> {
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
              'Konsultasi',
              style: AppTheme.appTextTheme.regulerNoneMedium!
                  .copyWith(color: BaseColors.neutral950),
            ),
          ],
        ),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Nama',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'Inter',
                    color: BaseColors.neutral950,
                  ),
                ),
                TextField(
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: BaseColors.neutral200,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: BaseColors.neutral200,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    hintText: 'Masukkan Nama Lengkap',
                    hintStyle: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'Inter',
                      color: BaseColors.neutral400,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'Email',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'Inter',
                    color: BaseColors.neutral950,
                  ),
                ),
                TextField(
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: BaseColors.neutral200,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: BaseColors.neutral200,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    hintText: 'Masukkan Email',
                    hintStyle: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'Inter',
                      color: BaseColors.neutral400,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'Nomor Telepon',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'Inter',
                    color: BaseColors.neutral950,
                  ),
                ),
                TextField(
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: BaseColors.neutral200,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: BaseColors.neutral200,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    hintText: 'Masukkan Nomer',
                    hintStyle: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'Inter',
                      color: BaseColors.neutral400,
                    ),
                    prefixIcon: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Stack(
                        alignment: Alignment.centerRight,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                '+62',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: 'Inter',
                                  color: BaseColors.neutral950,
                                ),
                              ),
                              const SizedBox(
                                width: 8,
                              ),
                              Container(
                                width: 1, // Lebar garis lurus
                                height: 24, // Tinggi garis lurus
                                color:
                                    BaseColors.neutral200, // Warna garis lurus
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'Pesan',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'Inter',
                    color: BaseColors.neutral950,
                  ),
                ),
                IntrinsicHeight(
                  child: TextField(
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: BaseColors.neutral200,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: BaseColors.neutral200,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      hintText: 'Masukkan Pesan',
                      hintStyle: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'Inter',
                        color: BaseColors.neutral400,
                      ),
                    ),
                    maxLines: 5,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                DottedBorder(
                  borderType: BorderType.RRect,
                  radius: const Radius.circular(10), // Radius border
                  color: BaseColors.neutral200, // Warna border
                  strokeWidth: 1, // Ketebalan border
                  dashPattern: const [
                    8,
                    8,
                  ], // Pola garis putus-putus (5 piksel terisi, 5 piksel kosong)
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      children: [
                        Icon(
                          Icons.add_a_photo_outlined,
                          size: 48,
                          color: BaseColors.neutral400,
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Tambahkan Foto',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Inter',
                            color: BaseColors.neutral400,
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            // Logika untuk memilih foto
                          },
                          style: ElevatedButton.styleFrom(
                            elevation: 0, // Mengatur elevation menjadi 0
                            shadowColor: Colors
                                .transparent, // Menghilangkan shadow dengan warna transparent
                            foregroundColor: Colors.white,
                            backgroundColor: Colors.transparent,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50),
                              side: BorderSide(
                                color: BaseColors.primary400,
                              ),
                            ),
                          ),
                          child: Text(
                            'Pilih Foto',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              fontFamily: 'Inter',
                              color: BaseColors.primary400,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Center(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFEC53B8),
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
                      'Kirim',
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
