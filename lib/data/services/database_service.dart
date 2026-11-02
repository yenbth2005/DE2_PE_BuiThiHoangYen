import 'package:path/path.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sqflite/sqflite.dart';
import '../../models/chi.dart';
part 'database_service.g.dart';

@Riverpod(keepAlive: true)
DatabaseService databaseService(Ref ref) {
  return DatabaseService();
}

class DatabaseService {
  Database? _db;

  Future<Database> get database async {
    if (_db != null) return _db!;
    _db = await _initDB('chi_manager.db');
    return _db!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE chis (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            tenKhoanChi TEXT NOT NULL,
            soTien REAL NOT NULL,
            danhMuc TEXT NOT NULL,
            ngayChi TEXT NOT NULL
          )
        ''');

        // Dữ liệu mẫu khởi tạo
        await db.insert('chis', {
          'tenKhoanChi': 'Ăn uống',
          'soTien': 150000.0,
          'danhMuc': 'Sinh hoạt',
          'ngayChi': DateTime(2026, 10, 29).toIso8601String(),
        });
        await db.insert('chis', {
          'tenKhoanChi': 'Di chuyển',
          'soTien': 50000.0,
          'danhMuc': 'Đi lại',
          'ngayChi': DateTime(2026, 10, 28).toIso8601String(),
        });
        await db.insert('chis', {
          'tenKhoanChi': 'Mua sách',
          'soTien': 200000.0,
          'danhMuc': 'Học tập',
          'ngayChi': DateTime(2026, 10, 27).toIso8601String(),
        });
        await db.insert('chis', {
          'tenKhoanChi': 'Mua sắm',
          'soTien': 1500000.0,
          'danhMuc': 'Sinh hoạt',
          'ngayChi': DateTime(2026, 10, 25).toIso8601String(),
        });
        await db.insert('chis', {
          'tenKhoanChi': 'Khám bệnh',
          'soTien': 3550000.0,
          'danhMuc': 'Sức khỏe',
          'ngayChi': DateTime(2026, 10, 22).toIso8601String(),
        });
      },
    );
  }

  Future<List<Chi>> getAllChis() async {
    final db = await database;
    final maps = await db.query('chis', orderBy: 'id DESC');
    return maps.map((e) => Chi.fromMap(e)).toList();
  }

  Future<int> insertChi(Chi chi) async {
    final db = await database;
    return await db.insert('chis', chi.toMap());
  }

  Future<int> updateChi(Chi chi) async {
    final db = await database;
    return await db.update('chis', chi.toMap(), where: 'id = ?', whereArgs: [chi.id]);
  }

  Future<int> deleteChi(int id) async {
    final db = await database;
    return await db.delete('chis', where: 'id = ?', whereArgs: [id]);
  }
}
