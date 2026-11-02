import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../models/chi.dart';
import '../services/database_service.dart';
part 'chi_repository.g.dart';

@riverpod
ChiRepository chiRepository(Ref ref) {
  final service = ref.watch(databaseServiceProvider);
  return ChiRepository(service);
}

class ChiRepository {
  final DatabaseService _service;
  ChiRepository(this._service);

  Future<List<Chi>> getChis() => _service.getAllChis();
  Future<void> addChi(Chi chi) => _service.insertChi(chi);
  Future<void> editChi(Chi chi) => _service.updateChi(chi);
  Future<void> removeChi(int id) => _service.deleteChi(id);
}
