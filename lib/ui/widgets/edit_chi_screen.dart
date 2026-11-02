import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../models/chi.dart';
import '../../utils/validator.dart';
import '../view_models/chi_view_model.dart';

class EditChiScreen extends ConsumerStatefulWidget {
  final Chi chi;

  const EditChiScreen({super.key, required this.chi});

  @override
  ConsumerState<EditChiScreen> createState() => _EditChiScreenState();
}

class _EditChiScreenState extends ConsumerState<EditChiScreen> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _tenCtrl;
  late TextEditingController _soTienCtrl;
  late String _selectedDanhMuc;
  late DateTime _selectedDate;

  @override
  void initState() {
    super.initState();
    _tenCtrl = TextEditingController(text: widget.chi.tenKhoanChi);
    _soTienCtrl = TextEditingController(text: widget.chi.soTien.toStringAsFixed(0));
    _selectedDanhMuc = Chi.danhMucList.contains(widget.chi.danhMuc)
        ? widget.chi.danhMuc
        : Chi.danhMucList.first;
    _selectedDate = widget.chi.ngayChi;
  }

  @override
  void dispose() {
    _tenCtrl.dispose();
    _soTienCtrl.dispose();
    super.dispose();
  }

  Future<void> _pickDate() async {
    final picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  void _submit() {
    if (!_formKey.currentState!.validate()) return;

    final name = _tenCtrl.text.trim();
    final price = double.parse(_soTienCtrl.text.trim());

    final updated = widget.chi.copyWith(
      tenKhoanChi: name,
      soTien: price,
      danhMuc: _selectedDanhMuc,
      ngayChi: _selectedDate,
    );

    ref.read(chiViewModelProvider.notifier).updateChi(updated);

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Đã cập nhật khoản chi thành công!')),
    );

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chỉnh sửa khoản chi'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextFormField(
                  controller: _tenCtrl,
                  decoration: const InputDecoration(
                    labelText: 'Tên khoản chi',
                  ),
                  validator: (v) => AppValidator.validateRequired(v, fieldName: 'Tên khoản chi'),
                ),
                const SizedBox(height: 12),
                TextFormField(
                  controller: _soTienCtrl,
                  decoration: const InputDecoration(
                    labelText: 'Số tiền (VNĐ)',
                  ),
                  keyboardType: TextInputType.number,
                  validator: (v) => AppValidator.validateNumber(v, fieldName: 'Số tiền', min: 0),
                ),
                const SizedBox(height: 12),
                DropdownButtonFormField<String>(
                  initialValue: _selectedDanhMuc,
                  decoration: const InputDecoration(
                    labelText: 'Danh mục',
                  ),
                  items: Chi.danhMucList.map((cat) {
                    return DropdownMenuItem<String>(
                      value: cat,
                      child: Text(cat),
                    );
                  }).toList(),
                  onChanged: (val) {
                    if (val != null) {
                      setState(() => _selectedDanhMuc = val);
                    }
                  },
                ),
                const SizedBox(height: 12),
                InkWell(
                  onTap: _pickDate,
                  child: InputDecorator(
                    decoration: const InputDecoration(
                      labelText: 'Ngày chi',
                    ),
                    child: Text(
                      '${_selectedDate.day.toString().padLeft(2, '0')}/${_selectedDate.month.toString().padLeft(2, '0')}/${_selectedDate.year}',
                      style: const TextStyle(fontSize: 16),
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                ElevatedButton(
                  onPressed: _submit,
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 14),
                  ),
                  child: const Text(
                    'Lưu',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
