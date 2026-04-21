import 'package:flutter/material.dart';
import '../../app/i18n/strings.g.dart';

class DashboardAdd extends StatelessWidget {
  const DashboardAdd({super.key});

  final List<Map<String, dynamic>> blockTypes = const [
    {
      'name': 'Counter Block',
      'description': 'Display a simple count of prayers',
      'icon': Icons.format_list_numbered,
    },
    {
      'name': 'Streak Block',
      'description': 'Show your prayer streak',
      'icon': Icons.local_fire_department,
    },
    {
      'name': 'Chart Block',
      'description': 'Visual chart of prayer statistics',
      'icon': Icons.pie_chart,
    },
    {
      'name': 'Recent List',
      'description': 'List of recent prayers',
      'icon': Icons.list,
    },
    {
      'name': 'Category Breakdown',
      'description': 'Prayers grouped by category',
      'icon': Icons.category,
    },
    {
      'name': 'Answered Rate',
      'description': 'Percentage of answered prayers',
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
            'Select Block Type',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(height: 8),
          Text(
            'Choose a statistics block to add to your dashboard',
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
                  title: Text(type['name'] as String),
                  subtitle: Text(type['description'] as String),
                  trailing: const Icon(Icons.add_circle_outline),
                  onTap: () {},
                ),
              )),
          const SizedBox(height: 24),
          Card(
            color: Theme.of(context).colorScheme.primaryContainer,
            child: const Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.lightbulb_outline),
                      SizedBox(width: 8),
                      Text(
                        'Tip',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  Text('You can rearrange blocks later using the Layout option in the menu.'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
