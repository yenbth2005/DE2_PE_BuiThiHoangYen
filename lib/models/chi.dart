class Chi {
  final int? id;
  final String tenKhoanChi;
  final double soTien;
  final String danhMuc;
  final DateTime ngayChi;

  static const List<String> danhMucList = [
    'Sinh hoạt',
    'Đi lại',
    'Học tập',
    'Sức khỏe',
  ];

  Chi({
    this.id,
    required this.tenKhoanChi,
    required this.soTien,
    required this.danhMuc,
    required this.ngayChi,
  });

  Map<String, dynamic> toMap() {
    final map = <String, dynamic>{
      'tenKhoanChi': tenKhoanChi,
      'soTien': soTien,
      'danhMuc': danhMuc,
      'ngayChi': ngayChi.toIso8601String(),
    };
    if (id != null) map['id'] = id;
    return map;
  }

  factory Chi.fromMap(Map<String, dynamic> map) {
    return Chi(
      id: map['id'] as int?,
      tenKhoanChi: map['tenKhoanChi'] as String,
      soTien: (map['soTien'] as num).toDouble(),
      danhMuc: map['danhMuc'] as String,
      ngayChi: map['ngayChi'] is String
          ? DateTime.parse(map['ngayChi'] as String)
          : DateTime.fromMillisecondsSinceEpoch(map['ngayChi'] as int),
    );
  }

  Chi copyWith({
    int? id,
    String? tenKhoanChi,
    double? soTien,
    String? danhMuc,
    DateTime? ngayChi,
  }) {
    return Chi(
      id: id ?? this.id,
      tenKhoanChi: tenKhoanChi ?? this.tenKhoanChi,
      soTien: soTien ?? this.soTien,
      danhMuc: danhMuc ?? this.danhMuc,
      ngayChi: ngayChi ?? this.ngayChi,
    );
  }
}
