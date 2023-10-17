import 'package:shared_preferences/shared_preferences.dart';

class AppSharedPreferences {
  final SharedPreferences preferences;

  AppSharedPreferences({required this.preferences});

  _updateLang(String lang) {
    preferences.setString('lang', lang);
  }

  toggleLang() {
    final lang = preferences.getString('lang') ?? 'id';
    if (lang == 'id') {
      _updateLang('en');
    } else {
      _updateLang('id');
    }
  }

  String getLang() {
    final lang = preferences.getString('lang');
    if ((lang ?? '') == '') {
      _updateLang('id');
      return 'id';
    } else {
      return lang!;
    }
  }
}
