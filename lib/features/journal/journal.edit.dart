import 'package:flutter/material.dart';
import 'package:drift/drift.dart';
import '../../app/i18n/strings.g.dart';
import '../../core/db/db_provider.dart';
import '../../core/db/database.dart' show Prayer, JournalEntry;

class JournalEdit extends StatefulWidget {
  final JournalEntry entry;
  const JournalEdit({super.key, required this.entry});

  @override
  State<JournalEdit> createState() => _JournalEditState();
}

class _JournalEditState extends State<JournalEdit> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _titleController;
  late final TextEditingController _contentController;
  late String _selectedCategory;
  int? _selectedPrayerId;
  String? _selectedMood;
  List<Prayer> _prayers = [];

  final List<String> _categories = [
    'Answered Prayers',
    'Daily Devotion',
    'Health',
    'Missions',
    'Family',
    'Spiritual Growth',
    'Other',
  ];

  final List<Map<String, dynamic>> _moods = [
    {'name': 'Grateful', 'icon': Icons.sentiment_very_satisfied, 'color': Colors.green},
    {'name': 'Peaceful', 'icon': Icons.spa, 'color': Colors.blue},
    {'name': 'Hopeful', 'icon': Icons.wb_sunny, 'color': Colors.orange},
    {'name': 'Excited', 'icon': Icons.celebration, 'color': Colors.purple},
    {'name': 'Anxious', 'icon': Icons.cloud, 'color': Colors.grey},
    {'name': 'Sad', 'icon': Icons.sentiment_dissatisfied, 'color': Colors.indigo},
  ];

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController(text: widget.entry.title);
    _contentController = TextEditingController(text: widget.entry.content);
    _selectedCategory = widget.entry.category;
    _selectedPrayerId = widget.entry.relatedPrayerId;
    _selectedMood = widget.entry.mood;
    _loadPrayers();
  }

  @override
  void dispose() {
    _titleController.dispose();
    _contentController.dispose();
    super.dispose();
  }

  Future<void> _loadPrayers() async {
    final db = DatabaseProvider.instance;
    final prayers = await db.getAllPrayers();
    setState(() {
      _prayers = prayers;
    });
  }

  Future<void> _saveEntry() async {
    if (_formKey.currentState!.validate()) {
      final db = DatabaseProvider.instance;
      
      final updatedEntry = widget.entry.copyWith(
        title: _titleController.text,
        content: _contentController.text,
        category: _selectedCategory,
        mood: Value(_selectedMood),
        relatedPrayerId: Value(_selectedPrayerId),
        updatedAt: DateTime.now(),
      );
      
      await db.updateJournalEntry(updatedEntry);
      
      if (mounted) {
        Navigator.pop(context, true);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final t = Translations.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(t.titles.journalEdit),
        actions: [
          TextButton(
            onPressed: _saveEntry,
            child: const Text('Save'),
          ),
        ],
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            TextFormField(
              controller: _titleController,
              decoration: const InputDecoration(
                labelText: 'Title',
                hintText: 'Give your entry a title...',
                prefixIcon: Icon(Icons.title),
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a title';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _contentController,
              decoration: const InputDecoration(
                labelText: 'Content',
                hintText: 'Write about your prayer experience, thoughts, or answered prayers...',
                prefixIcon: Icon(Icons.notes),
                border: OutlineInputBorder(),
                alignLabelWithHint: true,
              ),
              maxLines: 8,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some content';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),
            DropdownButtonFormField<String>(
              value: _selectedCategory,
              decoration: const InputDecoration(
                labelText: 'Category',
                prefixIcon: Icon(Icons.folder),
                border: OutlineInputBorder(),
              ),
              items: _categories.map((category) {
                return DropdownMenuItem(
                  value: category,
                  child: Text(category),
                );
              }).toList(),
              onChanged: (value) {
                if (value != null) {
                  setState(() {
                    _selectedCategory = value;
                  });
                }
              },
            ),
            const SizedBox(height: 16),
            DropdownButtonFormField<int?>(
              value: _selectedPrayerId,
              decoration: const InputDecoration(
                labelText: 'Related Prayer (Optional)',
                prefixIcon: Icon(Icons.link),
                border: OutlineInputBorder(),
                hintText: 'Select a prayer this entry relates to',
              ),
              items: [
                const DropdownMenuItem(
                  value: null,
                  child: Text('None'),
                ),
                ..._prayers.map((prayer) {
                  return DropdownMenuItem(
                    value: prayer.id,
                    child: Text(prayer.title),
                  );
                }),
              ],
              onChanged: (value) {
                setState(() {
                  _selectedPrayerId = value;
                });
              },
            ),
            const SizedBox(height: 16),
            const Divider(),
            const SizedBox(height: 8),
            Text(
              'How are you feeling?',
              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 12),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: _moods.map((mood) {
                final isSelected = _selectedMood == mood['name'];
                return ChoiceChip(
                  avatar: Icon(
                    mood['icon'] as IconData,
                    color: mood['color'] as Color,
                    size: 18,
                  ),
                  label: Text(mood['name'] as String),
                  selected: isSelected,
                  onSelected: (selected) {
                    setState(() {
                      _selectedMood = selected ? mood['name'] as String : null;
                    });
                  },
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
