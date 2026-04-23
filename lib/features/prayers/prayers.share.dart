import 'package:flutter/material.dart';
import '../../app/i18n/strings.g.dart';

class PrayersShare extends StatefulWidget {
  const PrayersShare({super.key});

  @override
  State<PrayersShare> createState() => _PrayersShareState();
}

class _PrayersShareState extends State<PrayersShare> {
  final List<Map<String, dynamic>> prayers = [
    {'id': 1, 'title': 'Family Salvation', 'selected': true},
    {'id': 2, 'title': 'Job Interview', 'selected': true},
    {'id': 3, 'title': 'Healing for Mom', 'selected': false},
    {'id': 4, 'title': 'Daily Devotion', 'selected': false},
    {'id': 5, 'title': 'Mission Trip', 'selected': false},
  ];

  String _selectedFormat = 'text';

  @override
  Widget build(BuildContext context) {
    final t = Translations.of(context);
    final selectedCount = prayers.where((p) => p['selected'] as bool).length;

    return Scaffold(
      appBar: AppBar(
        title: Text(t.titles.prayersShare),
        actions: [
          if (selectedCount > 0)
            TextButton(
              onPressed: () {},
              child: Text('Share ($selectedCount)'),
            ),
        ],
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            color: Theme.of(context).colorScheme.surfaceContainerHighest,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Checkbox(
                      value: prayers.every((p) => p['selected'] as bool),
                      onChanged: (value) {
                        setState(() {
                          for (var prayer in prayers) {
                            prayer['selected'] = value ?? false;
                          }
                        });
                      },
                    ),
                    const Text('Select All'),
                    const Spacer(),
                    Text(
                      '$selectedCount selected',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: Theme.of(context).colorScheme.primary,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Text(
                  'Export Format',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
                const SizedBox(height: 8),
                SegmentedButton<String>(
                  segments: const [
                    ButtonSegment(
                      value: 'text',
                      label: Text('Text'),
                      icon: Icon(Icons.text_snippet),
                    ),
                    ButtonSegment(
                      value: 'json',
                      label: Text('JSON'),
                      icon: Icon(Icons.code),
                    ),
                    ButtonSegment(
                      value: 'csv',
                      label: Text('CSV'),
                      icon: Icon(Icons.table_chart),
                    ),
                  ],
                  selected: {_selectedFormat},
                  onSelectionChanged: (value) {
                    setState(() {
                      _selectedFormat = value.first;
                    });
                  },
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: prayers.length,
              itemBuilder: (context, index) {
                final prayer = prayers[index];
                return Card(
                  margin: const EdgeInsets.only(bottom: 8),
                  child: ListTile(
                    leading: Checkbox(
                      value: prayer['selected'] as bool,
                      onChanged: (value) {
                        setState(() {
                          prayer['selected'] = value ?? false;
                        });
                      },
                    ),
                    title: Text(prayer['title'] as String),
                    trailing: IconButton(
                      icon: const Icon(Icons.share, size: 20),
                      onPressed: () {},
                    ),
                  ),
                );
              },
            ),
          ),
          if (selectedCount > 0)
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surface,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 4,
                    offset: const Offset(0, -2),
                  ),
                ],
              ),
              child: SafeArea(
                child: Row(
                  children: [
                    Expanded(
                      child: OutlinedButton.icon(
                        onPressed: () {},
                        icon: const Icon(Icons.copy),
                        label: const Text('Copy'),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: ElevatedButton.icon(
                        onPressed: () {},
                        icon: const Icon(Icons.share),
                        label: const Text('Share'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}
