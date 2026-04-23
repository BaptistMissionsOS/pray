import 'package:flutter/material.dart';
import '../../app/i18n/strings.g.dart';
import '../../core/db/db_provider.dart';
import '../../core/db/database.dart' show DashboardBlock;
import 'dashboard.add.dart';

class DashboardEdit extends StatefulWidget {
  const DashboardEdit({super.key});

  @override
  State<DashboardEdit> createState() => _DashboardEditState();
}

class _DashboardEditState extends State<DashboardEdit> {
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

  Future<void> _deleteBlock(int id) async {
    await db.deleteDashboardBlock(id);
    _loadBlocks();
  }

  Future<void> _addBlock() async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const DashboardAdd()),
    );
    if (result == true) {
      _loadBlocks();
    }
  }

  @override
  Widget build(BuildContext context) {
    final t = Translations.of(context);

    if (_isLoading) {
      return Scaffold(
        appBar: AppBar(title: Text(t.titles.dashboardEdit)),
        body: const Center(child: CircularProgressIndicator()),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(t.titles.dashboardEdit),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(t.common.done),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Text(
            t.dashboard.edit.title,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(height: 8),
          Text(
            t.dashboard.edit.subtitle,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                ),
          ),
          const SizedBox(height: 16),
          if (_blocks.isEmpty)
            Center(
              child: Padding(
                padding: const EdgeInsets.all(32),
                child: Text(
                  t.dashboard.layout.empty,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Theme.of(context).colorScheme.onSurfaceVariant,
                      ),
                ),
              ),
            )
          else
            ..._blocks.map((block) => Card(
                  margin: const EdgeInsets.only(bottom: 12),
                  child: ListTile(
                    leading: Container(
                      width: 48,
                      height: 48,
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.secondaryContainer,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Center(
                        child: Text(
                          _getBlockTypeLabel(block.type),
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).colorScheme.onSecondaryContainer,
                          ),
                        ),
                      ),
                    ),
                    title: Text(_getBlockName(t, block.type)),
                    subtitle: Text('${t.dashboard.edit.typeLabel}: ${_getBlockTypeName(t, block.type)}'),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.delete_outline, color: Colors.red),
                          onPressed: () => _deleteBlock(block.id),
                        ),
                      ],
                    ),
                  ),
                )),
          const SizedBox(height: 24),
          OutlinedButton.icon(
            onPressed: _addBlock,
            icon: const Icon(Icons.add),
            label: Text(t.drawer.actions.add),
          ),
        ],
      ),
    );
  }

  String _getBlockTypeLabel(String type) {
    switch (type) {
      case 'counter': return '#'.toUpperCase();
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

  String _getBlockTypeName(Translations t, String type) {
    switch (type) {
      case 'counter': return t.dashboard.edit.blockTypes.counter;
      case 'streak': return t.dashboard.edit.blockTypes.streak;
      case 'chart': return t.dashboard.edit.blockTypes.chart;
      default: return type;
    }
  }
}
