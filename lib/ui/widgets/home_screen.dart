import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../view_models/chi_view_model.dart';
import '../view_models/theme_view_model.dart';
import 'edit_chi_screen.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  void _showCurrencyDialog(BuildContext context, bool currentIsVND) {
    bool selectedIsVND = currentIsVND;

    showDialog(
      context: context,
      builder: (ctx) {
        return StatefulBuilder(
          builder: (context, setDialogState) {
            return AlertDialog(
              title: const Text('Chọn đơn vị tiền tệ'),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ListTile(
                    leading: Icon(
                      selectedIsVND ? Icons.radio_button_checked : Icons.radio_button_unchecked,
                      color: selectedIsVND ? Colors.blue : Colors.grey,
                    ),
                    title: const Text('VNĐ (Việt Nam Đồng)'),
                    onTap: () {
                      setDialogState(() {
                        selectedIsVND = true;
                      });
                    },
                  ),
                  ListTile(
                    leading: Icon(
                      !selectedIsVND ? Icons.radio_button_checked : Icons.radio_button_unchecked,
                      color: !selectedIsVND ? Colors.blue : Colors.grey,
                    ),
                    title: const Text('USD (Đô la Mỹ) (\$)'),
                    onTap: () {
                      setDialogState(() {
                        selectedIsVND = false;
                      });
                    },
                  ),
                ],
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(ctx),
                  child: const Text('Hủy'),
                ),
                ElevatedButton(
                  onPressed: () {
                    ref.read(themeViewModelProvider.notifier).changeVNDMode(selectedIsVND);
                    Navigator.pop(ctx);
                  },
                  child: const Text('Lưu'),
                ),
              ],
            );
          },
        );
      },
    );
  }

  String _formatCurrency(double amount, bool isVND) {
    if (!isVND) {
      final usdAmount = amount / 25000;
      return '\$${usdAmount.toStringAsFixed(2)}';
    }
    return '${amount.toStringAsFixed(0)} VNĐ';
  }

  @override
  Widget build(BuildContext context) {
    final chiState = ref.watch(chiViewModelProvider);
    final isVND = ref.watch(themeViewModelProvider).value ?? true;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Quản lý chi tiêu'),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            tooltip: 'Đơn vị tiền tệ',
            onPressed: () => _showCurrencyDialog(context, isVND),
          ),
        ],
      ),
      body: chiState.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text('Lỗi: $e')),
        data: (chis) {
          if (chis.isEmpty) {
            return const Center(
              child: Text('Chưa có khoản chi nào.'),
            );
          }
          return ListView.builder(
            padding: const EdgeInsets.symmetric(vertical: 8),
            itemCount: chis.length,
            itemBuilder: (_, i) {
              final c = chis[i];
              return Card(
                margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                child: ListTile(
                  title: Text(
                    c.tenKhoanChi,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                    '${c.danhMuc} • ${c.ngayChi.day.toString().padLeft(2, '0')}/${c.ngayChi.month.toString().padLeft(2, '0')}/${c.ngayChi.year}',
                  ),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        _formatCurrency(c.soTien, isVND),
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                      const SizedBox(width: 8),
                      IconButton(
                        icon: const Icon(Icons.edit),
                        tooltip: 'Chỉnh sửa khoản chi',
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => EditChiScreen(chi: c),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
