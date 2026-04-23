import 'package:flutter/material.dart';
import '../../app/i18n/strings.g.dart';

class DashboardLayout extends StatefulWidget {
  const DashboardLayout({super.key});

  @override
  State<DashboardLayout> createState() => _DashboardLayoutState();
}

class _DashboardLayoutState extends State<DashboardLayout> {
  final List<Map<String, dynamic>> blocks = [
    {'name': 'Total Prayers', 'type': 'Counter', 'icon': Icons.format_list_numbered},
    {'name': 'Answered', 'type': 'Counter', 'icon': Icons.check_circle},
    {'name': 'Unanswered', 'type': 'Counter', 'icon': Icons.pending},
    {'name': 'Streak', 'type': 'Streak', 'icon': Icons.local_fire_department},
    {'name': 'Weekly', 'type': 'Chart', 'icon': Icons.pie_chart},
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
            child: const Text('Save'),
          ),
        ],
      ),
      body: ReorderableListView(
        padding: const EdgeInsets.all(16),
        header: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Arrange Blocks',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 8),
            Text(
              'Drag and drop to reorder your dashboard blocks',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                  ),
            ),
            const SizedBox(height: 16),
            Card(
              color: Theme.of(context).colorScheme.primaryContainer,
              child: const Padding(
                padding: EdgeInsets.all(12),
                child: Row(
                  children: [
                    Icon(Icons.info_outline, size: 20),
                    SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        'Long press and drag the handle to reorder',
                        style: TextStyle(fontSize: 13),
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
                title: Text(block['name'] as String),
                subtitle: Text(block['type'] as String),
                trailing: const Icon(Icons.drag_handle),
              ),
            )).toList(),
      ),
    );
  }
}
