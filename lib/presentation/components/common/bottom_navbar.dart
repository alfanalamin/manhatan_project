import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:manhatan_project/common/color.dart';
import 'package:manhatan_project/presentation/providers/button_provider.dart';
import 'package:provider/provider.dart';

class BottomNavBar extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onItemTapped;
  final VoidCallback onKonsultasi;
  const BottomNavBar({
    Key? key,
    required this.selectedIndex,
    required this.onItemTapped,
    required this.onKonsultasi,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bottomNavBarProvider = Provider.of<ButtonProvider>(context);

    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: bottomNavBarProvider.currentIndex,
      onTap: (index) {
        if (index != 2) {
          bottomNavBarProvider.currentIndex = index;
          onItemTapped(index);
        } else {
          onKonsultasi();
        }
      },
      selectedItemColor: BaseColors.primary600,
      unselectedItemColor: BaseColors.neutral500,
      showSelectedLabels: true,
      showUnselectedLabels: true,
      items: [
        BottomNavigationBarItem(
          icon: ImageIcon(
            const AssetImage(
              'assets/images/home.png',
            ),
            color: bottomNavBarProvider.currentIndex == 0
                ? BaseColors.primary600
                : BaseColors.neutral500,
            size: 24.w,
          ),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: ImageIcon(
            const AssetImage('assets/images/lamp-on.png'),
            color: bottomNavBarProvider.currentIndex == 1
                ? BaseColors.primary600
                : BaseColors.neutral500,
            size: 24.w,
          ),
          label: 'Varises',
        ),
        BottomNavigationBarItem(
          icon: SizedBox(
            width: 24.w,
            height: 24.w,
          ),
          label: 'Konsultasi',
        ),
        BottomNavigationBarItem(
          icon: ImageIcon(
            const AssetImage('assets/images/archive-book.png'),
            color: bottomNavBarProvider.currentIndex == 3
                ? BaseColors.primary600
                : BaseColors.neutral500,
            size: 24.w,
          ),
          label: 'Artikel',
        ),
        BottomNavigationBarItem(
          icon: ImageIcon(
            const AssetImage('assets/images/gallery-favorite.png'),
            color: bottomNavBarProvider.currentIndex == 4
                ? BaseColors.primary600
                : BaseColors.neutral500,
            size: 24.w,
          ),
          label: 'Galeri',
        ),
      ],
    );
  }
}
