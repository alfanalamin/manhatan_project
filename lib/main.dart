import 'package:fimber/fimber.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:manhatan_project/injection.dart' as di;
import 'package:manhatan_project/presentation/providers/about_provider.dart';
import 'package:manhatan_project/presentation/providers/button_provider.dart';
import 'package:manhatan_project/presentation/providers/galery_provider.dart';
import 'package:manhatan_project/presentation/providers/home_provider.dart';
import 'package:manhatan_project/presentation/providers/konsultasi_provider.dart';
import 'package:manhatan_project/presentation/providers/varises_provider.dart';
import 'package:provider/provider.dart';


import 'presentation/pages/splash_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  di.init();
  Intl.defaultLocale = 'id';
  initializeDateFormatting();
  await di.locator.allReady();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  Fimber.plantTree(DebugTree());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context, child) {
        return MultiProvider(
          providers: [
            ChangeNotifierProvider(
              create: (_) => di.locator<ButtonProvider>(),
            ),
            ChangeNotifierProvider(
              create: (_) => di.locator<HomeProvider>(),
            ),
            ChangeNotifierProvider(
              create: (_) => di.locator<VarisesProvider>(),
            ),
            ChangeNotifierProvider(
              create: (_) => di.locator<AboutProvider>(),
            ),
            ChangeNotifierProvider(
              create: (_) => di.locator<GaleryProvider>(),
            ),
            ChangeNotifierProvider(
              create: (_) => di.locator<KonsultasiProvider>(),
            ),
          ],
          child: const MaterialApp(
            debugShowCheckedModeBanner: false,
            home: SplashScreen(),
          ),
        );
      },
    );
  }
}
