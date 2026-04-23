import 'package:flutter/material.dart';
import '../../app/i18n/strings.g.dart';

class DashboardEdit extends StatelessWidget {
  const DashboardEdit({super.key});

  final List<Map<String, dynamic>> existingBlocks = const [
    {
      'name': 'Total Prayers',
      'type': 'Counter',
      'value': '24',
    },
    {
      'name': 'Answered Prayers',
      'type': 'Counter',
      'value': '8',
    },
    {
      'name': 'Unanswered',
      'type': 'Counter',
      'value': '12',
    },
    {
      'name': 'Prayer Streak',
      'type': 'Streak',
      'value': '5 days',
    },
    {
      'name': 'Weekly Activity',
      'type': 'Chart',
      'value': 'Chart view',
    },
  ];

  @override
  Widget build(BuildContext context) {
    final t = Translations.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(t.titles.dashboardEdit),
        actions: [
          TextButton(
            onPressed: () {},
            child: const Text('Save'),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Text(
            'Edit Dashboard Blocks',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(height: 8),
          Text(
            'Tap a block to edit its settings or remove it',
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
                        block['type'] as String,
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).colorScheme.onSecondaryContainer,
                        ),
                      ),
                    ),
                  ),
                  title: Text(block['name'] as String),
                  subtitle: Text('Type: ${block['type']}'),
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
            label: const Text('Add New Block'),
          ),
        ],
      ),
    );
  }
}
