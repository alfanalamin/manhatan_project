import 'package:flutter/material.dart';

import '../../../common/color.dart';

class BottomNavBar extends StatefulWidget {
  final int selectedIndex;
  final ValueChanged<int> onItemTapped;

  const BottomNavBar({
    super.key,
    required this.selectedIndex,
    required this.onItemTapped,
  });

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Stack(
          children: [
            BottomNavigationBar(
              currentIndex: widget.selectedIndex,
              onTap: widget.onItemTapped,
              selectedItemColor: BaseColors.primary500,
              unselectedItemColor: BaseColors.neutral500,
              showSelectedLabels: true,
              showUnselectedLabels: true,
              items: [
                const BottomNavigationBarItem(
                  icon: ImageIcon(
                    AssetImage('assets/images/home.png'),
                  ),
                  label: 'Home',
                ),
                const BottomNavigationBarItem(
                  icon: ImageIcon(
                    AssetImage('assets/images/lamp-on.png'),
                  ),
                  label: 'Varises',
                ),
                BottomNavigationBarItem(
                    icon: Image.asset(
                      'assets/images/Button.png',
                      width: 24,
                      height: 24,
                    ),
                    label: 'Konsultasi'),
                const BottomNavigationBarItem(
                  icon: ImageIcon(
                    AssetImage('assets/images/archive-book.png'),
                  ),
                  label: 'Artikel',
                ),
                const BottomNavigationBarItem(
                  icon: ImageIcon(
                    AssetImage('assets/images/gallery-favorite.png'),
                  ),
                  label: 'Galeri',
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
