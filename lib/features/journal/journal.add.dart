import 'package:flutter/material.dart';
import 'package:drift/drift.dart';
import '../../app/i18n/strings.g.dart';
import '../../core/db/db_provider.dart';
import '../../core/db/database.dart' show Prayer, JournalEntriesCompanion;

class JournalAdd extends StatefulWidget {
  final int? relatedPrayerId;
  const JournalAdd({super.key, this.relatedPrayerId});

  @override
  State<JournalAdd> createState() => _JournalAddState();
}

class _JournalAddState extends State<JournalAdd> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _contentController = TextEditingController();
  String _selectedCategory = 'Answered Prayers';
  int? _selectedPrayerId;
  String? _selectedMood;
  List<Prayer> _prayers = [];
  DateTime _selectedDate = DateTime.now();

  @override
  void initState() {
    super.initState();
    _selectedPrayerId = widget.relatedPrayerId;
    _loadPrayers();
  }

  Future<void> _loadPrayers() async {
    final db = DatabaseProvider.instance;
    final prayers = await db.getAllPrayers();
    setState(() {
      _prayers = prayers;
    });
  }

  Widget _buildMoodChip(IconData icon, Color color, String translatedLabel, String value) {
    final isSelected = _selectedMood == value;
    return ChoiceChip(
      avatar: Icon(
        icon,
        color: color,
        size: 18,
      ),
      label: Text(translatedLabel),
      selected: isSelected,
      onSelected: (selected) {
        setState(() {
          _selectedMood = selected ? value : null;
        });
      },
    );
  }

  @override
  void dispose() {
    _titleController.dispose();
    _contentController.dispose();
    super.dispose();
  }

  Future<void> _saveEntry() async {
    if (_formKey.currentState!.validate()) {
      final db = DatabaseProvider.instance;

      await db.insertJournalEntry(
        JournalEntriesCompanion(
          title: Value(_titleController.text),
          content: Value(_contentController.text),
          category: Value(_selectedCategory),
          mood: Value(_selectedMood),
          relatedPrayerId: Value(_selectedPrayerId),
          createdAt: Value(_selectedDate),
          updatedAt: Value(_selectedDate),
        ),
      );

      if (mounted) {
        Navigator.pop(context, true);
      }
    }
  }

  Future<void> _selectDate() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final t = Translations.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(t.titles.journalAdd),
        actions: [
          TextButton(
            onPressed: _saveEntry,
            child: Text(t.common.save),
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
              decoration: InputDecoration(
                labelText: t.journal.form.title,
                hintText: t.journal.form.titleHint,
                prefixIcon: const Icon(Icons.title),
                border: const OutlineInputBorder(),
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
              decoration: InputDecoration(
                labelText: t.journal.form.content,
                hintText: t.journal.form.contentHint,
                prefixIcon: const Icon(Icons.notes),
                border: const OutlineInputBorder(),
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
              decoration: InputDecoration(
                labelText: t.journal.form.category,
                prefixIcon: const Icon(Icons.folder),
                border: const OutlineInputBorder(),
              ),
              items: [
                DropdownMenuItem(value: 'Answered Prayers', child: Text(t.journal.categories.answeredPrayers)),
                DropdownMenuItem(value: 'Daily Devotion', child: Text(t.journal.categories.dailyDevotion)),
                DropdownMenuItem(value: 'Health', child: Text(t.journal.categories.health)),
                DropdownMenuItem(value: 'Missions', child: Text(t.journal.categories.missions)),
                DropdownMenuItem(value: 'Family', child: Text(t.journal.categories.family)),
                DropdownMenuItem(value: 'Spiritual Growth', child: Text(t.journal.categories.spiritualGrowth)),
                DropdownMenuItem(value: 'Other', child: Text(t.journal.categories.other)),
              ],
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
              decoration: InputDecoration(
                labelText: t.journal.form.relatedPrayer,
                prefixIcon: const Icon(Icons.link),
                border: const OutlineInputBorder(),
                hintText: t.journal.form.relatedPrayerHint,
              ),
              items: [
                DropdownMenuItem(
                  value: null,
                  child: Text(t.common.none),
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
            ListTile(
              leading: const Icon(Icons.calendar_today),
              title: Text(t.journal.form.date),
              subtitle: Text(
                '${_selectedDate.year}-${_selectedDate.month.toString().padLeft(2, '0')}-${_selectedDate.day.toString().padLeft(2, '0')}',
              ),
              trailing: const Icon(Icons.chevron_right),
              onTap: _selectDate,
            ),
            const Divider(),
            const SizedBox(height: 8),
            Text(
              t.journal.form.mood,
              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 12),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                _buildMoodChip(Icons.sentiment_very_satisfied, Colors.green, t.moods.grateful, 'Grateful'),
                _buildMoodChip(Icons.spa, Colors.blue, t.moods.peaceful, 'Peaceful'),
                _buildMoodChip(Icons.wb_sunny, Colors.orange, t.moods.hopeful, 'Hopeful'),
                _buildMoodChip(Icons.celebration, Colors.purple, t.moods.excited, 'Excited'),
                _buildMoodChip(Icons.cloud, Colors.grey, t.moods.anxious, 'Anxious'),
                _buildMoodChip(Icons.sentiment_dissatisfied, Colors.indigo, t.moods.sad, 'Sad'),
              ],
            ),
            const SizedBox(height: 24),
            Card(
              color: Theme.of(context).colorScheme.primaryContainer,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    const Icon(Icons.lightbulb_outline),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(t.hints.journalTip),
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
