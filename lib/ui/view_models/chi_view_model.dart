import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../data/repositories/chi_repository.dart';
import '../../models/chi.dart';
part 'chi_view_model.g.dart';

@riverpod
class ChiViewModel extends _$ChiViewModel {
  @override
  Future<List<Chi>> build() async {
    return ref.watch(chiRepositoryProvider).getChis();
  }

  Future<void> addChi(Chi chi) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      await ref.read(chiRepositoryProvider).addChi(chi);
      return ref.read(chiRepositoryProvider).getChis();
    });
  }

  Future<void> updateChi(Chi chi) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      await ref.read(chiRepositoryProvider).editChi(chi);
      return ref.read(chiRepositoryProvider).getChis();
    });
  }

  Future<void> deleteChi(int id) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      await ref.read(chiRepositoryProvider).removeChi(id);
      return ref.read(chiRepositoryProvider).getChis();
    });
  }
}
