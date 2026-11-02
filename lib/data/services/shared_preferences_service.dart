import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';
part 'shared_preferences_service.g.dart';

@Riverpod(keepAlive: true)
SharedPreferencesService sharedPreferencesService(Ref ref) {
  return SharedPreferencesService();
}

class SharedPreferencesService {
  static const String _kVNDModeKey = 'vnd_mode_key';

  Future<void> setVNDMode(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_kVNDModeKey, value);
  }

  Future<bool> isVNDMode() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_kVNDModeKey) ?? true;
  }
}
