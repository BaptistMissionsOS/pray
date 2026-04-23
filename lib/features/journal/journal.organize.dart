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
              'Organize Categories',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 8),
            Text(
              'Drag to reorder categories. Tap to edit or delete.',
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
                        'Long press and drag the handle to reorder categories',
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
                title: Text(category['name'] as String),
                subtitle: Text('${category['count']} entries'),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.edit, size: 20),
                      onPressed: () => _showEditCategoryDialog(context, category),
                    ),
                    if (category['name'] != 'Uncategorized')
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
        label: const Text('New Category'),
      ),
    );
  }

  void _showAddCategoryDialog(BuildContext context) {
    final textController = TextEditingController();
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Add New Category'),
        content: TextField(
          controller: textController,
          decoration: const InputDecoration(
            labelText: 'Category Name',
            border: OutlineInputBorder(),
            hintText: 'e.g., Spiritual Growth',
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              if (textController.text.isNotEmpty) {
                setState(() {
                  categories.add({
                    'name': textController.text,
                    'count': 0,
                    'color': Colors.blue,
                    'icon': Icons.folder,
                  });
                });
              }
              Navigator.pop(context);
            },
            child: const Text('Add'),
          ),
        ],
      ),
    );
  }

  void _showEditCategoryDialog(BuildContext context, Map<String, dynamic> category) {
    final textController = TextEditingController(text: category['name'] as String);
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Edit Category'),
        content: TextField(
          controller: textController,
          decoration: const InputDecoration(
            labelText: 'Category Name',
            border: OutlineInputBorder(),
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

  void _showDeleteCategoryDialog(BuildContext context, Map<String, dynamic> category) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Delete Category?'),
        content: Text(
          'Are you sure you want to delete "${category['name']}"?\n\nEntries in this category will be moved to "Uncategorized".',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              setState(() {
                categories.removeWhere((c) => c['name'] == category['name']);
              });
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
