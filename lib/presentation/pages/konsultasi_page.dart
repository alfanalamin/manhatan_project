import 'package:dotted_border/dotted_border.dart';
import 'package:fimber/fimber.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:manhatan_project/presentation/components/common/modal_bottom_sheet.dart';
import 'package:manhatan_project/presentation/components/common/success_page.dart';
import 'package:manhatan_project/presentation/components/konsultasi/file_picker_popup.dart';
import 'package:manhatan_project/presentation/providers/konsultasi_provider.dart';
import 'package:path/path.dart';
import 'package:provider/provider.dart';
import 'package:sn_progress_dialog/sn_progress_dialog.dart';
import 'dart:io';
import '../../common/app_theme.dart';
import '../../common/color.dart';

class KonsultasiPage extends StatefulWidget {
  const KonsultasiPage({super.key});

  @override
  State<KonsultasiPage> createState() => _KonsultasiPageState();
}

class _KonsultasiPageState extends State<KonsultasiPage> {
  File? image;

  Future _pickImage({
    required BuildContext context,
  }) async {
    ModalBottomSheet modalBottomSheet = ModalBottomSheet();
    modalBottomSheet.showModal(
      context: context,
      content: FilePickerPopup(
        onPick: (path) {
          if ((path ?? '') != '') {
            Future.microtask(
              () => Provider.of<KonsultasiProvider>(
                context,
                listen: false,
              ).addImage(path!),
            );
          }
        },
      ),
      shapeBorder: null,
      isScrollControlled: true,
    );
  }

  void _sendKonsultasi({
    required BuildContext context,
  }) {
    final pd = ProgressDialog(context: context);
    pd.show(max: 100, msg: 'Sedang mengirim konsultasi');
    Future.microtask(
      () => Provider.of<KonsultasiProvider>(
        context,
        listen: false,
      ).doPostKonsultasi(
        onSuccess: () {
          pd.close();
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const SuccessPage()),
          );
        },
        onFailure: (failure) {
          pd.close();
          final snackBar = SnackBar(
            content: Text(failure.message),
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        },
        onSendProgress: (count, total) {
          int progress = (((count / total) * 100).toInt());
          pd.update(value: progress);
        },
      ),
    );
  }

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
          Container(
            color: Colors.white,
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
                    height: 0,
                  ),
                ),
                SizedBox(
                  height: 4.h,
                ),
                TextField(
                  controller: context.read<KonsultasiProvider>().textFullName,
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
                      height: 0),
                ),
                SizedBox(
                  height: 4.h,
                ),
                TextField(
                  controller: context.read<KonsultasiProvider>().textEmail,
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
                      height: 0),
                ),
                SizedBox(
                  height: 4.h,
                ),
                TextField(
                  controller: context.read<KonsultasiProvider>().textPhone,
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
                      height: 0),
                ),
                SizedBox(
                  height: 4.h,
                ),
                IntrinsicHeight(
                  child: TextField(
                    controller:
                        context.read<KonsultasiProvider>().textDescription,
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
                  ], // Pola garis putus-putus (8 piksel terisi, 8 piksel kosong)
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      children: [
                        Column(
                          children: [
                            Icon(
                              Icons.add_a_photo_outlined,
                              size: 48,
                              color: BaseColors.neutral400,
                            ),
                            const SizedBox(height: 8),
                            Text(
                              'Tambah Foto',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                fontFamily: 'Inter',
                                color: BaseColors.neutral400,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 8.h),
                        ElevatedButton(
                          onPressed: () {
                            _pickImage(
                                context:
                                    context); // Panggil fungsi ini untuk memilih foto dari galeri
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
                Consumer<KonsultasiProvider>(
                  builder: (context, provider, child) {
                    Fimber.d('testing');
                    provider.images?.forEach((element) {
                      Fimber.d(element);
                    });

                    if ((provider.images ?? []).isEmpty) {
                      return const SizedBox();
                    } else {
                      return Padding(
                        padding: EdgeInsets.only(
                          top: 16.h,
                        ),
                        child: ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (c, index) {
                            final imagePath = (provider.images ?? [])[index];
                            return Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: BaseColors.success500,
                                ),
                                borderRadius: BorderRadius.circular(10.r),
                              ),
                              padding: EdgeInsets.symmetric(
                                horizontal: 6.w,
                                vertical: 10.h,
                              ),
                              child: Row(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(4.r),
                                    child: Image.file(
                                      File(imagePath),
                                      fit: BoxFit.cover,
                                      width: 28.w,
                                      height: 28.w,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 6.w,
                                  ),
                                  Expanded(
                                    child: Text(
                                      basename(imagePath),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 6.w,
                                  ),
                                  InkWell(
                                    onTap: () {
                                      Provider.of<KonsultasiProvider>(
                                        context,
                                        listen: false,
                                      ).deleteImage(index);
                                    },
                                    child: Icon(
                                      Icons.delete,
                                      color: BaseColors.danger500,
                                      size: 24.w,
                                    ),
                                  )
                                ],
                              ),
                            );
                          },
                          itemCount: (provider.images ?? []).length,
                        ),
                      );
                    }
                  },
                ),
                SizedBox(height: 20.h),
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
                    onPressed: () {
                      _sendKonsultasi(context: context);
                    },
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
