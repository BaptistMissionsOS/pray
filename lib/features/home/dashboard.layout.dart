import 'package:flutter/material.dart';
import '../../app/i18n/strings.g.dart';
import '../../core/db/db_provider.dart';
import '../../core/db/database.dart' show DashboardBlock;

class DashboardLayout extends StatefulWidget {
  const DashboardLayout({super.key});

  @override
  State<DashboardLayout> createState() => _DashboardLayoutState();
}

class _DashboardLayoutState extends State<DashboardLayout> {
  final db = DatabaseProvider.instance;
  List<DashboardBlock> _blocks = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadBlocks();
  }

  Future<void> _loadBlocks() async {
    final blocks = await db.getAllDashboardBlocks();
    if (mounted) {
      setState(() {
        _blocks = blocks;
        _isLoading = false;
      });
    }
  }

  Future<void> _saveOrder() async {
    await db.reorderDashboardBlocks(_blocks);
    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(t.dashboard.layout.orderSaved)),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final t = Translations.of(context);

    if (_isLoading) {
      return Scaffold(
        appBar: AppBar(title: Text(t.titles.dashboardLayout)),
        body: const Center(child: CircularProgressIndicator()),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(t.titles.dashboardLayout),
        actions: [
          TextButton(
            onPressed: _saveOrder,
            child: Text(t.common.save),
          ),
        ],
      ),
      body: ReorderableListView(
        padding: const EdgeInsets.all(16),
        header: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              t.dashboard.layout.title,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 8),
            Text(
              t.dashboard.layout.subtitle,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                  ),
            ),
            const SizedBox(height: 16),
            Card(
              color: Theme.of(context).colorScheme.primaryContainer,
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Row(
                  children: [
                    const Icon(Icons.info_outline, size: 20),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        t.hints.reorder,
                        style: const TextStyle(fontSize: 13),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
          ],
        ),
        onReorder: (oldIndex, newIndex) {
          setState(() {
            if (newIndex > oldIndex) {
              newIndex--;
            }
            final block = _blocks.removeAt(oldIndex);
            _blocks.insert(newIndex, block);
          });
        },
        children: _blocks.map((block) => Card(
              key: ValueKey(block.id),
              margin: const EdgeInsets.only(bottom: 8),
              child: ListTile(
                leading: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primaryContainer,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Center(
                    child: Text(
                      _getBlockIcon(block.type),
                      style: const TextStyle(fontSize: 20),
                    ),
                  ),
                ),
                title: Text(_getBlockName(t, block.type)),
                subtitle: Text(block.type),
                trailing: const Icon(Icons.drag_handle),
              ),
            )).toList(),
      ),
    );
  }

  String _getBlockIcon(String type) {
    switch (type) {
      case 'counter': return '#';
      case 'streak': return '🔥';
      case 'chart': return '📊';
      case 'list': return '📋';
      case 'category': return '🏷️';
      case 'rate': return '%';
      default: return type.substring(0, 1).toUpperCase();
    }
  }

  String _getBlockName(Translations t, String type) {
    switch (type) {
      case 'counter': return t.dashboard.blockTypes.counter;
      case 'streak': return t.dashboard.blockTypes.streak;
      case 'chart': return t.dashboard.blockTypes.chart;
      case 'list': return t.dashboard.blockTypes.list;
      case 'category': return t.dashboard.blockTypes.category;
      case 'rate': return t.dashboard.blockTypes.rate;
      default: return type;
    }
  }
}
