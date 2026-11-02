import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../data/repositories/theme_repository.dart';
part 'theme_view_model.g.dart';

@Riverpod(keepAlive: true)
class ThemeViewModel extends _$ThemeViewModel {
  @override
  Future<bool> build() async {
    final repository = ref.watch(themeRepositoryProvider);
    return repository.isVNDMode();
  }

  Future<void> changeVNDMode(bool isVND) async {
    final repository = ref.read(themeRepositoryProvider);
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      await repository.setVNDMode(isVND);
      return isVND;
    });
  }

  Future<void> toggleVNDMode() async {
    final current = state.value ?? true;
    await changeVNDMode(!current);
  }
}
