import 'package:flutter/material.dart';
import '../../app/i18n/strings.g.dart';

class PrayersEdit extends StatefulWidget {
  const PrayersEdit({super.key});

  @override
  State<PrayersEdit> createState() => _PrayersEditState();
}

class _PrayersEditState extends State<PrayersEdit> {
  final samplePrayers = [
    {
      'id': 1,
      'title': 'Family Salvation',
      'description': 'Praying for my brother to come to know Christ.',
      'category': 'Family',
      'status': 'unanswered',
      'date': '2024-01-15',
    },
    {
      'id': 2,
      'title': 'Job Interview',
      'description': 'Upcoming interview next week.',
      'category': 'Work',
      'status': 'unanswered',
      'date': '2024-01-10',
    },
    {
      'id': 3,
      'title': 'Healing for Mom',
      'description': 'Recovering from surgery.',
      'category': 'Health',
      'status': 'active',
      'date': '2024-01-05',
    },
  ];

  @override
  Widget build(BuildContext context) {
    final t = Translations.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(t.titles.prayersEdit),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: samplePrayers.length,
        itemBuilder: (context, index) {
          final prayer = samplePrayers[index];
          return Card(
            margin: const EdgeInsets.only(bottom: 12),
            child: ListTile(
              contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              title: Text(
                prayer['title'] as String,
                style: const TextStyle(fontWeight: FontWeight.w600),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 4),
                  Text(prayer['description'] as String),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Chip(
                        label: Text(
                          prayer['category'] as String,
                          style: const TextStyle(fontSize: 11),
                        ),
                        padding: EdgeInsets.zero,
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
                      ),
                      const SizedBox(width: 8),
                      Chip(
                        label: Text(
                          prayer['status'] as String,
                          style: const TextStyle(fontSize: 11),
                        ),
                        padding: EdgeInsets.zero,
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        backgroundColor: _getStatusColor(prayer['status'] as String),
                      ),
                    ],
                  ),
                ],
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: const Icon(Icons.edit),
                    onPressed: () => _showEditDialog(context, prayer),
                  ),
                  IconButton(
                    icon: const Icon(Icons.delete_outline, color: Colors.red),
                    onPressed: () => _showDeleteDialog(context, prayer),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Color _getStatusColor(String status) {
    switch (status) {
      case 'answered':
        return Colors.green.withOpacity(0.2);
      case 'active':
        return Colors.red.withOpacity(0.2);
      default:
        return Colors.orange.withOpacity(0.2);
    }
  }

  void _showEditDialog(BuildContext context, Map<String, dynamic> prayer) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Edit Prayer'),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: TextEditingController(text: prayer['title'] as String),
                decoration: const InputDecoration(
                  labelText: 'Title',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: TextEditingController(text: prayer['description'] as String),
                decoration: const InputDecoration(
                  labelText: 'Description',
                  border: OutlineInputBorder(),
                ),
                maxLines: 3,
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Save'),
          ),
        ],
      ),
    );
  }

  void _showDeleteDialog(BuildContext context, Map<String, dynamic> prayer) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Delete Prayer?'),
        content: Text('Are you sure you want to delete "${prayer['title']}"?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            style: TextButton.styleFrom(foregroundColor: Colors.red),
            child: const Text('Delete'),
          ),
        ],
      ),
    );
  }
}
