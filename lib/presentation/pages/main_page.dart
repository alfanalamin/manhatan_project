import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:manhatan_project/presentation/pages/galery_main_page.dart';
import 'package:manhatan_project/presentation/pages/home_page.dart';
import 'package:manhatan_project/presentation/pages/varises_main_page.dart';

import '../components/common/bottom_navbar.dart';
import 'artikel_main_page.dart';
import 'konsultasi_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPage();
}

class _MainPage extends State<MainPage> {
  int _selectedIndex = 0; // Inisialisasi _selectedIndex

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final controller = PageController();

  @override
  void initState() {
    super.initState();
  }

  final pages = [
    const HomePage(),
    const VarisesMainPage(),
    const KonsultasiPage(),
    const ArtikelMainPage(),
     GaleryMainPage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_selectedIndex],
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const KonsultasiPage(),
            ),
          );
        },
        child: Image.asset(
          'assets/images/button_consultation.png',
          width: 68.w,
          height: 68.w,
        ),
      ),
      bottomNavigationBar: BottomNavBar(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
        onKonsultasi: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const KonsultasiPage(),
            ),
          );
        },
      ),
    );
  }
}
