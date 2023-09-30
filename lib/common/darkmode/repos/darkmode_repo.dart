import 'package:shared_preferences/shared_preferences.dart';

class DarkmodeRepository {
  static const String _darkmode = "darkmode";

  final SharedPreferences _preferences;

  DarkmodeRepository(this._preferences);

  Future<void> setDarkMode(bool value) async {
    _preferences.setBool(_darkmode, value);
  }

  bool isDark() {
    return _preferences.getBool(_darkmode) ?? false;
  }
}
