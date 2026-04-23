import 'package:flutter/material.dart';
import '../../app/i18n/strings.g.dart';

class JournalAdd extends StatefulWidget {
  const JournalAdd({super.key});

  @override
  State<JournalAdd> createState() => _JournalAddState();
}

class _JournalAddState extends State<JournalAdd> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _contentController = TextEditingController();
  String _selectedCategory = 'Answered Prayers';
  String? _selectedPrayer;
  String? _selectedMood;

  final List<String> _categories = [
    'Answered Prayers',
    'Daily Devotion',
    'Health',
    'Missions',
    'Family',
    'Spiritual Growth',
    'Other',
  ];

  final List<String> _prayers = [
    'Family Salvation',
    'Job Interview',
    'Healing for Mom',
    'Daily Devotion',
    'Mission Trip',
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
  void dispose() {
    _titleController.dispose();
    _contentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final t = Translations.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(t.titles.journalAdd),
        actions: [
          TextButton(
            onPressed: () {},
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
            DropdownButtonFormField<String?>(
              value: _selectedPrayer,
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
                    value: prayer,
                    child: Text(prayer),
                  );
                }),
              ],
              onChanged: (value) {
                setState(() {
                  _selectedPrayer = value;
                });
              },
            ),
            const SizedBox(height: 16),
            ListTile(
              leading: const Icon(Icons.calendar_today),
              title: const Text('Date'),
              subtitle: const Text('Today'),
              trailing: const Icon(Icons.chevron_right),
              onTap: () {},
            ),
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
            const SizedBox(height: 24),
            Card(
              color: Theme.of(context).colorScheme.primaryContainer,
              child: const Padding(
                padding: EdgeInsets.all(16),
                child: Row(
                  children: [
                    Icon(Icons.lightbulb_outline),
                    SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        'Journaling helps you reflect on your spiritual journey and see how God is working in your life.',
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
