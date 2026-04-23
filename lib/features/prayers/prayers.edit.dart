import 'package:flutter/material.dart';
import '../../app/i18n/strings.g.dart';

class PrayersEdit extends StatefulWidget {
  const PrayersEdit({super.key});

  @override
  State<PrayersEdit> createState() => _PrayersEditState();
}

class _PrayersEditState extends State<PrayersEdit> {
  final samplePrayers = [];

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
                          _getCategoryLabel(t, prayer['category'] as String),
                          style: const TextStyle(fontSize: 11),
                        ),
                        padding: EdgeInsets.zero,
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
                      ),
                      const SizedBox(width: 8),
                      Chip(
                        label: Text(
                          _getStatusLabel(t, prayer['status'] as String),
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
    final t = Translations.of(context);
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(t.prayers.edit.title),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: TextEditingController(text: prayer['title'] as String),
                decoration: InputDecoration(
                  labelText: t.prayers.form.title,
                  border: const OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: TextEditingController(text: prayer['description'] as String),
                decoration: InputDecoration(
                  labelText: t.prayers.form.description,
                  border: const OutlineInputBorder(),
                ),
                maxLines: 3,
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(t.common.cancel),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text(t.common.save),
          ),
        ],
      ),
    );
  }

  void _showDeleteDialog(BuildContext context, Map<String, dynamic> prayer) {
    final t = Translations.of(context);
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(t.prayers.delete.title),
        content: Text(t.prayers.delete.confirm(title: prayer['title'] as String)),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(t.common.cancel),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            style: TextButton.styleFrom(foregroundColor: Colors.red),
            child: Text(t.common.delete),
          ),
        ],
      ),
    );
  }

  String _getCategoryLabel(Translations t, String category) {
    switch (category) {
      case 'Family': return t.prayers.categories.family;
      case 'Work': return t.prayers.categories.work;
      case 'Health': return t.prayers.categories.health;
      default: return category;
    }
  }

  String _getStatusLabel(Translations t, String status) {
    switch (status) {
      case 'unanswered': return t.status.unanswered;
      case 'active': return t.status.active;
      case 'answered': return t.status.answered;
      default: return status;
    }
  }
}
