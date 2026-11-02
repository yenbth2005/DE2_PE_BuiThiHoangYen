import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../services/shared_preferences_service.dart';
part 'theme_repository.g.dart';

@Riverpod(keepAlive: true)
ThemeRepository themeRepository(Ref ref) {
  final service = SharedPreferencesService();
  return ThemeRepository(service);
}

class ThemeRepository {
  final SharedPreferencesService _service;
  ThemeRepository(this._service);
  Future<bool> isVNDMode() async {
    return _service.isVNDMode();
  }

  Future<void> setVNDMode(bool value) async {
    await _service.setVNDMode(value);
  }
}
