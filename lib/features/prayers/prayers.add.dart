import 'package:flutter/material.dart';
import 'package:drift/drift.dart' hide Column;
import '../../app/i18n/strings.g.dart';
import '../../core/db/db_provider.dart';
import '../../core/db/database.dart' show PrayersCompanion, PrayerTag, PrayerTagsCompanion;

class PrayersAdd extends StatefulWidget {
  const PrayersAdd({super.key});

  @override
  State<PrayersAdd> createState() => _PrayersAddState();
}

class _PrayersAddState extends State<PrayersAdd> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _tagNameController = TextEditingController();
  String _selectedCategory = 'Personal';
  String _selectedStatus = 'unanswered';
  DateTime _selectedDate = DateTime.now();
  List<PrayerTag> _allTags = [];
  List<int> _selectedTagIds = [];
  bool _isLoadingTags = true;

  @override
  void initState() {
    super.initState();
    _loadTags();
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    _tagNameController.dispose();
    super.dispose();
  }

  Future<void> _loadTags() async {
    final db = DatabaseProvider.instance;
    final tags = await db.getAllTags();
    if (mounted) {
      setState(() {
        _allTags = tags;
        _isLoadingTags = false;
      });
    }
  }

  Future<void> _savePrayer() async {
    if (_formKey.currentState!.validate()) {
      final db = DatabaseProvider.instance;
      final answeredAt = _selectedStatus == 'answered' ? DateTime.now() : null;

      final prayerId = await db.insertPrayer(
        PrayersCompanion(
          title: Value(_titleController.text),
          description: Value(_descriptionController.text.isEmpty ? null : _descriptionController.text),
          category: Value(_selectedCategory),
          status: Value(_selectedStatus),
          answeredAt: Value(answeredAt),
          createdAt: Value(_selectedDate),
          updatedAt: Value(_selectedDate),
        ),
      );

      // Save selected tags
      if (_selectedTagIds.isNotEmpty) {
        await db.setPrayerTags(prayerId, _selectedTagIds);
      }

      if (mounted) {
        Navigator.pop(context, true);
      }
    }
  }

  Future<void> _createNewTag() async {
    if (_tagNameController.text.trim().isEmpty) return;

    final db = DatabaseProvider.instance;
    final tagName = _tagNameController.text.trim();

    try {
      final newTagId = await db.insertTag(
        PrayerTagsCompanion(
          name: Value(tagName),
          color: Value(_getRandomColor()),
        ),
      );

      // Reload tags and select the new one
      await _loadTags();
      setState(() {
        _selectedTagIds.add(newTagId);
      });

      _tagNameController.clear();
      if (mounted) {
        Navigator.pop(context);
      }
    } catch (e) {
      // Tag might already exist, show error
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Tag "$tagName" already exists')),
        );
      }
    }
  }

  String _getRandomColor() {
    final colors = [
      '#FF5733', '#33FF57', '#3357FF', '#FF33F6', '#F6FF33',
      '#33FFF6', '#FF8C33', '#8C33FF', '#33FF8C', '#FF338C',
    ];
    return colors[DateTime.now().millisecond % colors.length];
  }

  void _showTagPicker() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) => StatefulBuilder(
        builder: (context, setModalState) => Container(
          padding: const EdgeInsets.all(16),
          constraints: BoxConstraints(
            maxHeight: MediaQuery.of(context).size.height * 0.7,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Select Tags',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text('Done'),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              if (_allTags.isEmpty)
                Center(
                  child: Text(
                    'No tags yet. Create your first tag!',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                    ),
                  ),
                )
              else
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: _allTags.map((tag) {
                    final isSelected = _selectedTagIds.contains(tag.id);
                    return FilterChip(
                      label: Text(tag.name),
                      selected: isSelected,
                      onSelected: (selected) {
                        setModalState(() {
                          if (selected) {
                            _selectedTagIds.add(tag.id);
                          } else {
                            _selectedTagIds.remove(tag.id);
                          }
                        });
                        setState(() {});
                      },
                      backgroundColor: _parseColor(tag.color)?.withOpacity(0.2),
                      selectedColor: _parseColor(tag.color)?.withOpacity(0.4),
                      checkmarkColor: _parseColor(tag.color),
                    );
                  }).toList(),
                ),
              const SizedBox(height: 16),
              const Divider(),
              const SizedBox(height: 8),
              Text(
                'Create New Tag',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _tagNameController,
                      decoration: const InputDecoration(
                        hintText: 'Tag name',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  ElevatedButton(
                    onPressed: _createNewTag,
                    child: const Text('Add'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Color? _parseColor(String? colorStr) {
    if (colorStr == null) return null;
    try {
      return Color(int.parse(colorStr.replaceFirst('#', ''), radix: 16) + 0xFF000000);
    } catch (e) {
      return null;
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
              subtitle: Text(
                '${_selectedDate.year}-${_selectedDate.month.toString().padLeft(2, '0')}-${_selectedDate.day.toString().padLeft(2, '0')}',
              ),
              trailing: const Icon(Icons.chevron_right),
              onTap: _selectDate,
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.tag),
              title: Text(t.prayers.form.tags),
              subtitle: _selectedTagIds.isEmpty
                  ? const Text('Tap to add tags')
                  : Wrap(
                      spacing: 4,
                      runSpacing: 4,
                      children: _selectedTagIds.map((tagId) {
                        final tag = _allTags.firstWhere(
                          (t) => t.id == tagId,
                          orElse: () => PrayerTag(id: tagId, name: 'Unknown', createdAt: DateTime.now()),
                        );
                        return Chip(
                          label: Text(tag.name, style: const TextStyle(fontSize: 12)),
                          backgroundColor: _parseColor(tag.color)?.withOpacity(0.2),
                          side: BorderSide.none,
                          visualDensity: VisualDensity.compact,
                        );
                      }).toList(),
                    ),
              trailing: const Icon(Icons.chevron_right),
              onTap: _showTagPicker,
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
