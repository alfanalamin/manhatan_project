import 'package:flutter/material.dart';
import 'package:flutter_masonry_view/flutter_masonry_view.dart';

import '../../common/app_theme.dart';
import '../../common/color.dart';
import '../components/common/bottom_navbar.dart';
import 'home_page.dart';
import 'konsultasi_page.dart';
import 'varises_main_page.dart';

class GaleryMainPage extends StatefulWidget {
  GaleryMainPage({Key? key});

  final List<String> _items = [
    'assets/images/grid1.png',
    'assets/images/grid2.png',
    'assets/images/grid3.png',
    'assets/images/grid4.png',
    'assets/images/grid5.png',
  ];

  @override
  State<GaleryMainPage> createState() => _GaleryMainPageState();
}

class _GaleryMainPageState extends State<GaleryMainPage> {
  final int _selectedIndex = 0;

  void _onItemTapped(int index) {
    if (index == 0) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomePage()),
      );
    } else if (index == 1) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const VarisesMainPage()),
      );
    } else if (index == 2) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const KonsultasiPage()),
      );
    } else if (index == 3) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const VarisesMainPage()),
      );
    } else if (index == 4) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => GaleryMainPage()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        shadowColor: Colors.transparent,
        backgroundColor: Colors.white,
        title: Padding(
          padding: const EdgeInsets.fromLTRB(20, 10, 20, 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Gallery',
                style: AppTheme.appTextTheme.regulerNoneMedium,
              ),
              Row(
                children: [
                  Container(
                    width: 60,
                    height: 35,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                      border: Border.all(
                        color: BaseColors.neutral200,
                      ),
                    ),
                    child: Row(
                      children: [
                        Image.asset(
                          'assets/images/id Indonesia.png',
                          width: 30,
                          height: 30,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          'ID',
                          style: AppTheme.appTextTheme.xSmallNoneMedium,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 8),
                  const Icon(
                    Icons.info_outline_rounded,
                    color: Colors.black,
                    size: 35,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      body: ListView(
        children: [
          MasonryView(
            listOfItem: widget._items,
            numberOfColumn: 2,
            itemBuilder: (item) {
              return Image.asset(item);
            },
          ),
        ],
      ),
      bottomNavigationBar: BottomNavBar(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }
}
