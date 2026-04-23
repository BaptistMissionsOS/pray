import 'package:flutter/material.dart';
import '../../app/i18n/strings.g.dart';

class DashboardEdit extends StatelessWidget {
  const DashboardEdit({super.key});

  final List<Map<String, dynamic>> existingBlocks = const [];

  @override
  Widget build(BuildContext context) {
    final t = Translations.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(t.titles.dashboardEdit),
        actions: [
          TextButton(
            onPressed: () {},
            child: Text(t.common.save),
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
          ...existingBlocks.map((block) => Card(
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
                        _getBlockType(t, block['typeKey'] as String),
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).colorScheme.onSecondaryContainer,
                        ),
                      ),
                    ),
                  ),
                  title: Text(_getBlockName(t, block['nameKey'] as String)),
                  subtitle: Text('${t.dashboard.edit.typeLabel}: ${_getBlockType(t, block['typeKey'] as String)}'),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.edit),
                        onPressed: () {},
                      ),
                      IconButton(
                        icon: const Icon(Icons.delete_outline, color: Colors.red),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
              )),
          const SizedBox(height: 24),
          OutlinedButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.add),
            label: Text(t.drawer.actions.add),
          ),
        ],
      ),
    );
  }

  String _getBlockName(Translations t, String key) {
    switch (key) {
      case 'totalPrayers': return t.dashboard.edit.blockNames.totalPrayers;
      case 'answeredPrayers': return t.dashboard.edit.blockNames.answeredPrayers;
      case 'unanswered': return t.dashboard.edit.blockNames.unanswered;
      case 'prayerStreak': return t.dashboard.edit.blockNames.prayerStreak;
      case 'weeklyActivity': return t.dashboard.edit.blockNames.weeklyActivity;
      default: return key;
    }
  }

  String _getBlockType(Translations t, String key) {
    switch (key) {
      case 'counter': return t.dashboard.edit.blockTypes.counter;
      case 'streak': return t.dashboard.edit.blockTypes.streak;
      case 'chart': return t.dashboard.edit.blockTypes.chart;
      default: return key;
    }
  }
}
