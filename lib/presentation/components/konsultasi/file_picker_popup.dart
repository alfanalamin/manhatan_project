import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:manhatan_project/common/app_theme.dart';
import 'package:manhatan_project/common/color.dart';
import 'package:manhatan_project/presentation/components/common/button.dart';
import 'package:manhatan_project/presentation/providers/konsultasi_provider.dart';

class FilePickerPopup extends StatelessWidget {
  const FilePickerPopup({
    Key? key,
    required this.onPick,
  }) : super(key: key);
  final ValueChanged<String?> onPick;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 18),
          color: Colors.white,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Pilih File',
                style: AppTheme.appTextTheme.largeNormalBold?.copyWith(
                  color: BaseColors.neutral900,
                  height: 0,
                ),
              ),
              SizedBox(
                height: 18.h,
              ),
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                  GetIt.I<KonsultasiProvider>().pickImageCamera(onPick);
                },
                child: Row(
                  children: [
                    Container(
                      width: 40.w,
                      height: 40.w,
                      decoration: BoxDecoration(
                        color: BaseColors.primary500,
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      alignment: Alignment.center,
                      child: Icon(
                        Icons.camera,
                        size: 24.w,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    Text(
                      'Ambil Dari Kamera',
                      style:
                          AppTheme.appTextTheme.regulerNormalRegular?.copyWith(
                        color: BaseColors.neutral900,
                        height: 0,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                  GetIt.I<KonsultasiProvider>().pickImageGallery(onPick);
                },
                child: Row(
                  children: [
                    Container(
                      width: 40.w,
                      height: 40.w,
                      decoration: BoxDecoration(
                        color: BaseColors.success500,
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      alignment: Alignment.center,
                      child: Icon(
                        Icons.image,
                        size: 24.w,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    Text(
                      'Ambil Dari Galeri',
                      style:
                          AppTheme.appTextTheme.regulerNormalRegular?.copyWith(
                        color: BaseColors.neutral900,
                        height: 0,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              Button(
                caption: 'Tutup',
                captionColor: BaseColors.neutral400,
                backgroundColor: Colors.white,
                borderColor: BaseColors.neutral400,
                listener: () {
                  Navigator.pop(context);
                },
                buttonType: ButtonType.outline,
                height: 40,
              ),
            ],
          ),
        )
      ],
    );
  }
}
