import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import '../../../common/color.dart';

class SkeletonHomePage extends StatefulWidget {
  const SkeletonHomePage({Key? key}) : super(key: key);

  @override
  _SkeletonHomePageState createState() => _SkeletonHomePageState();
}

class _SkeletonHomePageState extends State<SkeletonHomePage> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Column(
          children: [
            Padding(
              // left, top, right, bottom
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 16),
              child: Shimmer.fromColors(
                direction: ShimmerDirection.ltr, // Dari kiri ke kanan
                baseColor: BaseColors.neutral100,
                highlightColor: BaseColors.neutral200,
                child: Container(
                  width: double.infinity,
                  height: 165,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14),
                    color: BaseColors.neutral200,
                  ),
                ),
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 10, 20, 16),
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14),
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
                  const SizedBox(height: 8),
                  Shimmer.fromColors(
                    direction: ShimmerDirection.ltr, // Dari kiri ke kanan
                    baseColor: BaseColors.neutral100,
                    highlightColor: BaseColors.neutral200,
                    child: Container(
                      height: 110,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                        color: BaseColors.neutral200,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Shimmer.fromColors(
                    direction: ShimmerDirection.ltr, // Dari kiri ke kanan
                    baseColor: BaseColors.neutral200,
                    highlightColor: BaseColors.neutral100,
                    child: Container(
                      width: 130,
                      height: 18,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                        color: BaseColors.neutral200,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Shimmer.fromColors(
                    direction: ShimmerDirection.ltr, // Dari kiri ke kanan
                    baseColor: BaseColors.neutral200,
                    highlightColor: BaseColors.neutral100,
                    child: Container(
                      width: double.infinity,
                      height: 14,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                        color: BaseColors.neutral200,
                      ),
                    ),
                  ),
                  const SizedBox(height: 5),
                  Shimmer.fromColors(
                    direction: ShimmerDirection.ltr, // Dari kiri ke kanan
                    baseColor: BaseColors.neutral200,
                    highlightColor: BaseColors.neutral100,
                    child: Container(
                      width: double.infinity,
                      height: 14,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                        color: BaseColors.neutral200,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Shimmer.fromColors(
                    direction: ShimmerDirection.ltr, // Dari kiri ke kanan
                    baseColor: BaseColors.neutral200,
                    highlightColor: BaseColors.neutral100,
                    child: Container(
                      width: double.infinity,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(36),
                        color: BaseColors.neutral200,
                      ),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Shimmer.fromColors(
                              direction:
                                  ShimmerDirection.ltr, // Dari kiri ke kanan
                              baseColor: BaseColors.neutral200,
                              highlightColor: BaseColors.neutral100,
                              child: Container(
                                width: 120,
                                height: 16,
                                color: BaseColors.neutral200,
                              ),
                            ),
                            const SizedBox(width: 10),
                            Shimmer.fromColors(
                              direction:
                                  ShimmerDirection.ltr, // Dari kiri ke kanan
                              baseColor: BaseColors.neutral200,
                              highlightColor: BaseColors.neutral100,
                              child: Container(
                                width: 20,
                                height: 20,
                                color: BaseColors.neutral200,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Shimmer.fromColors(
                    direction: ShimmerDirection.ltr, // Dari kiri ke kanan
                    baseColor: BaseColors.neutral100,
                    highlightColor: BaseColors.neutral200,
                    child: Container(
                      width: 130,
                      height: 18,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: BaseColors.neutral200,
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14),
                  color: BaseColors.neutral100,
                  border: Border.all(
                    color: BaseColors.neutral50,
                  ),
                ),
                child: Column(
                  children: [
                    Shimmer.fromColors(
                      direction: ShimmerDirection.ltr, // Dari kiri ke kanan
                      baseColor: BaseColors.neutral100,
                      highlightColor: BaseColors.neutral200,
                      child: Container(
                        width: double.infinity,
                        height: 200,
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(14),
                            topRight: Radius.circular(14),
                          ),
                          color: BaseColors.neutral200,
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 10,
                      ),
                      child: Column(
                        children: [
                          Shimmer.fromColors(
                            direction:
                                ShimmerDirection.ltr, // Dari kiri ke kanan
                            baseColor: BaseColors.neutral100,
                            highlightColor: BaseColors.neutral200,
                            child: Container(
                              width: double.infinity,
                              height: 16,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(14),
                                color: BaseColors.neutral200,
                              ),
                            ),
                          ),
                          const SizedBox(height: 8),
                          Shimmer.fromColors(
                            direction:
                                ShimmerDirection.ltr, // Dari kiri ke kanan
                            baseColor: BaseColors.neutral100,
                            highlightColor: BaseColors.neutral200,
                            child: Container(
                              width: double.infinity,
                              height: 50,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(14),
                                color: BaseColors.neutral200,
                              ),
                            ),
                          ),
                          const SizedBox(height: 8),
                          Row(
                            children: [
                              Shimmer.fromColors(
                                direction:
                                    ShimmerDirection.ltr, // Dari kiri ke kanan
                                baseColor: BaseColors.neutral100,
                                highlightColor: BaseColors.neutral200,
                                child: Container(
                                  width: 130,
                                  height: 12,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(14),
                                    color: BaseColors.neutral200,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ],
    );
  }
}
