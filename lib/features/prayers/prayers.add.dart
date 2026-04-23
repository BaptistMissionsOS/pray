import 'package:flutter/material.dart';
import 'package:drift/drift.dart';
import '../../app/i18n/strings.g.dart';
import '../../core/db/db_provider.dart';
import '../../core/db/database.dart' show PrayersCompanion;

class PrayersAdd extends StatefulWidget {
  const PrayersAdd({super.key});

  @override
  State<PrayersAdd> createState() => _PrayersAddState();
}

class _PrayersAddState extends State<PrayersAdd> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  String _selectedCategory = 'Personal';
  String _selectedStatus = 'unanswered';

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  Future<void> _savePrayer() async {
    if (_formKey.currentState!.validate()) {
      final db = DatabaseProvider.instance;
      final answeredAt = _selectedStatus == 'answered' ? DateTime.now() : null;
      
      await db.insertPrayer(
        PrayersCompanion(
          title: Value(_titleController.text),
          description: Value(_descriptionController.text.isEmpty ? null : _descriptionController.text),
          category: Value(_selectedCategory),
          status: Value(_selectedStatus),
          answeredAt: Value(answeredAt),
        ),
      );
      
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
        title: Text(t.titles.prayersAdd),
        actions: [
          TextButton(
            onPressed: _savePrayer,
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
                labelText: t.prayers.form.title,
                hintText: 'What are you praying for?',
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
              controller: _descriptionController,
              decoration: InputDecoration(
                labelText: t.prayers.form.description,
                hintText: 'Add details about your prayer request...',
                prefixIcon: const Icon(Icons.description),
                border: const OutlineInputBorder(),
                alignLabelWithHint: true,
              ),
              maxLines: 5,
            ),
            const SizedBox(height: 16),
            DropdownButtonFormField<String>(
              value: _selectedCategory,
              decoration: InputDecoration(
                labelText: t.prayers.form.category,
                prefixIcon: const Icon(Icons.category),
                border: const OutlineInputBorder(),
              ),
              items: [
                DropdownMenuItem(value: 'Personal', child: Text(t.prayers.categories.family)),
                DropdownMenuItem(value: 'Family', child: Text(t.prayers.categories.family)),
                DropdownMenuItem(value: 'Health', child: Text(t.prayers.categories.health)),
                DropdownMenuItem(value: 'Work', child: Text(t.prayers.categories.work)),
                DropdownMenuItem(value: 'Spiritual', child: Text(t.prayers.categories.spiritual)),
                DropdownMenuItem(value: 'Missions', child: Text(t.prayers.categories.missions)),
                DropdownMenuItem(value: 'Provision', child: Text(t.prayers.categories.finances)),
                DropdownMenuItem(value: 'Other', child: Text(t.prayers.categories.other)),
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
            DropdownButtonFormField<String>(
              value: _selectedStatus,
              decoration: InputDecoration(
                labelText: t.prayers.form.status,
                prefixIcon: const Icon(Icons.flag),
                border: const OutlineInputBorder(),
              ),
              items: [
                DropdownMenuItem(
                  value: 'unanswered',
                  child: Row(
                    children: [
                      const Icon(Icons.pending, color: Colors.orange, size: 20),
                      const SizedBox(width: 8),
                      Text(t.status.unanswered),
                    ],
                  ),
                ),
                DropdownMenuItem(
                  value: 'active',
                  child: Row(
                    children: [
                      const Icon(Icons.favorite, color: Colors.red, size: 20),
                      const SizedBox(width: 8),
                      Text(t.status.active),
                    ],
                  ),
                ),
                DropdownMenuItem(
                  value: 'answered',
                  child: Row(
                    children: [
                      const Icon(Icons.check_circle, color: Colors.green, size: 20),
                      const SizedBox(width: 8),
                      Text(t.status.answered),
                    ],
                  ),
                ),
              ],
              onChanged: (value) {
                if (value != null) {
                  setState(() {
                    _selectedStatus = value;
                  });
                }
              },
            ),
            const SizedBox(height: 16),
            ListTile(
              leading: const Icon(Icons.calendar_today),
              title: Text(t.prayers.form.date),
              subtitle: Text(t.common.today),
              trailing: const Icon(Icons.chevron_right),
              onTap: () {},
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.tag),
              title: Text(t.prayers.form.tags),
              subtitle: const Text('Add tags for organization'),
              trailing: const Icon(Icons.chevron_right),
              onTap: () {},
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
                      child: Text(t.hints.prayerTip),
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
