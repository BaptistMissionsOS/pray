import 'package:flutter/material.dart';
import '../../app/i18n/strings.g.dart';

class DashboardLayout extends StatefulWidget {
  const DashboardLayout({super.key});

  @override
  State<DashboardLayout> createState() => _DashboardLayoutState();
}

class _DashboardLayoutState extends State<DashboardLayout> {
  final List<Map<String, dynamic>> blocks = [
    {'nameKey': 'totalPrayers', 'type': 'Counter', 'icon': Icons.format_list_numbered},
    {'nameKey': 'answered', 'type': 'Counter', 'icon': Icons.check_circle},
    {'nameKey': 'unanswered', 'type': 'Counter', 'icon': Icons.pending},
    {'nameKey': 'streak', 'type': 'Streak', 'icon': Icons.local_fire_department},
    {'nameKey': 'weekly', 'type': 'Chart', 'icon': Icons.pie_chart},
  ];

  @override
  Widget build(BuildContext context) {
    final t = Translations.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(t.titles.dashboardLayout),
        actions: [
          TextButton(
            onPressed: () {},
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
            final block = blocks.removeAt(oldIndex);
            blocks.insert(newIndex, block);
          });
        },
        children: blocks.map((block) => Card(
              key: ValueKey(block['name']),
              margin: const EdgeInsets.only(bottom: 8),
              child: ListTile(
                leading: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primaryContainer,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Icon(
                    block['icon'] as IconData,
                    size: 20,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                title: Text(_getBlockName(t, block['nameKey'] as String)),
                subtitle: Text(block['type'] as String),
                trailing: const Icon(Icons.drag_handle),
              ),
            )).toList(),
      ),
    );
  }

  String _getBlockName(Translations t, String key) {
    switch (key) {
      case 'totalPrayers': return t.dashboard.layout.blockNames.totalPrayers;
      case 'answered': return t.dashboard.layout.blockNames.answered;
      case 'unanswered': return t.dashboard.layout.blockNames.unanswered;
      case 'streak': return t.dashboard.layout.blockNames.streak;
      case 'weekly': return t.dashboard.layout.blockNames.weekly;
      default: return key;
    }
  }
}
