import 'package:flutter/material.dart';
import '../../app/i18n/strings.g.dart';

class JournalOrganize extends StatefulWidget {
  const JournalOrganize({super.key});

  @override
  State<JournalOrganize> createState() => _JournalOrganizeState();
}

class _JournalOrganizeState extends State<JournalOrganize> {
  final List<Map<String, dynamic>> categories = [
    {
      'name': 'Answered Prayers',
      'count': 5,
      'color': Colors.green,
      'icon': Icons.check_circle,
    },
    {
      'name': 'Daily Devotion',
      'count': 12,
      'color': Colors.blue,
      'icon': Icons.book,
    },
    {
      'name': 'Health',
      'count': 3,
      'color': Colors.red,
      'icon': Icons.favorite,
    },
    {
      'name': 'Missions',
      'count': 2,
      'color': Colors.purple,
      'icon': Icons.public,
    },
    {
      'name': 'Family',
      'count': 8,
      'color': Colors.orange,
      'icon': Icons.family_restroom,
    },
    {
      'name': 'Uncategorized',
      'count': 4,
      'color': Colors.grey,
      'icon': Icons.folder_open,
    },
  ];

  @override
  Widget build(BuildContext context) {
    final t = Translations.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(t.titles.journalOrganize),
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
              t.journal.categories.organizeTitle,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 8),
            Text(
              t.journal.categories.organizeSubtitle,
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
                        t.hints.reorderCategories,
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
            final category = categories.removeAt(oldIndex);
            categories.insert(newIndex, category);
          });
        },
        children: categories.map((category) => Card(
              key: ValueKey(category['name']),
              margin: const EdgeInsets.only(bottom: 8),
              child: ListTile(
                leading: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: (category['color'] as Color).withOpacity(0.2),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Icon(
                    category['icon'] as IconData,
                    color: category['color'] as Color,
                    size: 20,
                  ),
                ),
                title: Text(_getCategoryLabel(t, category['name'] as String)),
                subtitle: Text(t.journal.categories.entriesCount(count: category['count'])),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.edit, size: 20),
                      onPressed: () => _showEditCategoryDialog(context, category),
                    ),
                    if (category['name'] != t.journal.categories.uncategorized)
                      IconButton(
                        icon: const Icon(Icons.delete_outline, size: 20, color: Colors.red),
                        onPressed: () => _showDeleteCategoryDialog(context, category),
                      ),
                    const Icon(Icons.drag_handle),
                  ],
                ),
              ),
            )).toList(),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => _showAddCategoryDialog(context),
        icon: const Icon(Icons.add),
        label: Text(t.journal.categories.addNew),
      ),
    );
  }

  void _showAddCategoryDialog(BuildContext context) {
    final textController = TextEditingController();
    final t = Translations.of(context);
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(t.journal.categories.addNew),
        content: TextField(
          controller: textController,
          decoration: InputDecoration(
            labelText: t.journal.categories.categoryNameLabel,
            hintText: t.journal.categories.categoryNameHint,
            border: const OutlineInputBorder(),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(t.common.cancel),
          ),
          ElevatedButton(
            onPressed: () {
              if (textController.text.isNotEmpty) {
                setState(() {
                  categories.add({
                    'id': DateTime.now().millisecondsSinceEpoch.toString(),
                    'name': textController.text,
                    'order': categories.length,
                  });
                });
              }
              Navigator.pop(context);
            },
            child: Text(t.common.add),
          ),
        ],
      ),
    );
  }

  void _showEditCategoryDialog(BuildContext context, Map<String, dynamic> category) {
    final textController = TextEditingController(text: category['name'] as String);
    final t = Translations.of(context);
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(t.journal.actions.edit),
        content: TextField(
          controller: textController,
          decoration: InputDecoration(
            labelText: t.journal.categories.categoryNameLabel,
            border: const OutlineInputBorder(),
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

  void _showDeleteCategoryDialog(BuildContext context, Map<String, dynamic> category) {
    final t = Translations.of(context);
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(t.common.deleteConfirmTitle),
        content: Text(
          t.journal.categories.deleteConfirm(
            name: category['name'],
            fallback: t.journal.categories.uncategorized,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(t.common.cancel),
          ),
          TextButton(
            onPressed: () {
              setState(() {
                categories.removeWhere((c) => c['name'] == category['name']);
              });
              Navigator.pop(context);
            },
            style: TextButton.styleFrom(foregroundColor: Colors.red),
            child: Text(t.common.delete),
          ),
        ],
      ),
    );
  }

  String _getCategoryLabel(Translations t, String name) {
    switch (name) {
      case 'Answered Prayers': return t.journal.categories.answeredPrayers;
      case 'Daily Devotion': return t.journal.categories.dailyDevotion;
      case 'Health': return t.journal.categories.health;
      case 'Missions': return t.journal.categories.missions;
      case 'Family': return t.journal.categories.family;
      case 'Uncategorized': return t.journal.categories.uncategorized;
      default: return name;
    }
  }
}
