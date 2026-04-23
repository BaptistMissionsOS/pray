import 'package:flutter/material.dart';
import 'package:drift/drift.dart' as drift;
import '../../app/i18n/strings.g.dart';
import '../../core/db/db_provider.dart';
import '../../core/db/database.dart' show DashboardBlocksCompanion;

class DashboardAdd extends StatelessWidget {
  const DashboardAdd({super.key});

  final List<Map<String, dynamic>> blockTypes = const [
    {
      'nameKey': 'counter',
      'icon': Icons.format_list_numbered,
    },
    {
      'nameKey': 'streak',
      'icon': Icons.local_fire_department,
    },
    {
      'nameKey': 'chart',
      'icon': Icons.pie_chart,
    },
    {
      'nameKey': 'list',
      'icon': Icons.list,
    },
    {
      'nameKey': 'category',
      'icon': Icons.category,
    },
    {
      'nameKey': 'rate',
      'icon': Icons.percent,
    },
  ];

  @override
  Widget build(BuildContext context) {
    final t = Translations.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(t.titles.dashboardAdd),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Text(
            t.dashboard.add.selectBlockType,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(height: 8),
          Text(
            t.dashboard.add.selectBlockTypeSubtitle,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                ),
          ),
          const SizedBox(height: 16),
          ...blockTypes.map((type) => Card(
                margin: const EdgeInsets.only(bottom: 12),
                child: ListTile(
                  leading: Container(
                    width: 48,
                    height: 48,
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primaryContainer,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Icon(
                      type['icon'] as IconData,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  title: Text(_getBlockName(t, type['nameKey'] as String)),
                  subtitle: Text(_getBlockDesc(t, type['nameKey'] as String)),
                  trailing: const Icon(Icons.add_circle_outline),
                  onTap: () async {
                    final db = DatabaseProvider.instance;
                    final existingBlocks = await db.getAllDashboardBlocks();
                    await db.insertDashboardBlock(
                      DashboardBlocksCompanion(
                        type: drift.Value(type['nameKey'] as String),
                        position: drift.Value(existingBlocks.length),
                      ),
                    );
                    if (context.mounted) {
                      Navigator.pop(context, true);
                    }
                  },
                ),
              )),
          const SizedBox(height: 24),
          Card(
            color: Theme.of(context).colorScheme.primaryContainer,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.lightbulb_outline),
                      const SizedBox(width: 8),
                      Text(
                        t.common.tip,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(t.dashboard.add.tipRearrange),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  String _getBlockName(Translations t, String key) {
    switch (key) {
      case 'counter': return t.dashboard.blockTypes.counter;
      case 'streak': return t.dashboard.blockTypes.streak;
      case 'chart': return t.dashboard.blockTypes.chart;
      case 'list': return t.dashboard.blockTypes.list;
      case 'category': return t.dashboard.blockTypes.category;
      case 'rate': return t.dashboard.blockTypes.rate;
      default: return key;
    }
  }

  String _getBlockDesc(Translations t, String key) {
    switch (key) {
      case 'counter': return t.dashboard.blockTypes.counterDesc;
      case 'streak': return t.dashboard.blockTypes.streakDesc;
      case 'chart': return t.dashboard.blockTypes.chartDesc;
      case 'list': return t.dashboard.blockTypes.listDesc;
      case 'category': return t.dashboard.blockTypes.categoryDesc;
      case 'rate': return t.dashboard.blockTypes.rateDesc;
      default: return key;
    }
  }
}
