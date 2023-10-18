import 'package:flutter/material.dart';
import 'package:flutter_masonry_view/flutter_masonry_view.dart';
import 'package:shimmer/shimmer.dart';

class SkeletonGalery extends StatefulWidget {
  const SkeletonGalery({super.key});

  @override
  State<SkeletonGalery> createState() => _SkeletonGaleryState();
}

class _SkeletonGaleryState extends State<SkeletonGalery> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 10, 0, 16),
            child: MasonryView(
              listOfItem: List.generate(
                  6,
                  (index) =>
                      'placeholder'), // Buat placeholder sejumlah item yang akan ditampilkan
              numberOfColumn: 2,
              itemBuilder: (item) {
                if (item == 'placeholder') {
                  return Shimmer.fromColors(
                    baseColor:
                        Colors.grey[300]!, // Warna latar belakang skeleton
                    highlightColor:
                        Colors.grey[100]!, // Warna highlight skeleton
                    child: Container(
                      width: double.infinity,
                      height:
                          200, // Tinggi skeleton sesuaikan dengan gambar asli
                      color: Colors.white, // Warna latar belakang skeleton
                    ),
                  );
                }
                // Item asli dihapus
                return const SizedBox.shrink(); // Menghilangkan item asli
              },
            ),
          ),
        ],
      ),
    );
  }
}
