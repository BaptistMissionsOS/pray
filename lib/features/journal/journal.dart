import 'package:flutter/material.dart';
import '../../app/i18n/strings.g.dart';

class Journal extends StatelessWidget {
  const Journal({super.key});

  final List<Map<String, dynamic>> journalEntries = const [
    {
      'id': 1,
      'title': 'Answered Prayer - Job Offer!',
      'content': 'Today I received the job offer I have been praying about for months. God is faithful! The position is exactly what I asked for, and the salary is even better than expected.',
      'date': 'Today, 10:30 AM',
      'category': 'Answered Prayers',
      'relatedPrayer': 'Job Interview',
      'mood': 'Grateful',
    },
    {
      'id': 2,
      'title': 'Morning Reflection',
      'content': 'Spent time in prayer this morning. Feeling peaceful about the upcoming decisions. God reminded me of His promise in Philippians 4:6-7.',
      'date': 'Yesterday, 8:00 AM',
      'category': 'Daily Devotion',
      'relatedPrayer': 'Daily Devotion',
      'mood': 'Peaceful',
    },
    {
      'id': 3,
      'title': 'Praying for Mom\'s Healing',
      'content': 'Visited mom at the hospital today. She is in good spirits despite the surgery. The doctors are optimistic about her recovery. Thank you, Lord, for your healing touch.',
      'date': '3 days ago',
      'category': 'Health',
      'relatedPrayer': 'Healing for Mom',
      'mood': 'Hopeful',
    },
    {
      'id': 4,
      'title': 'Mission Trip Preparation',
      'content': 'Met with the team today to plan the summer mission trip. We have raised 70% of our goal! God is providing through the generosity of our church family.',
      'date': '1 week ago',
      'category': 'Missions',
      'relatedPrayer': 'Mission Trip',
      'mood': 'Excited',
    },
  ];

  @override
  Widget build(BuildContext context) {
    final t = Translations.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(t.drawer.categories.journal),
        actions: [
          IconButton(
            icon: const Icon(Icons.filter_list),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
          ),
        ],
      ),
      body: journalEntries.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.book_outlined,
                    size: 64,
                    color: Theme.of(context).colorScheme.onSurfaceVariant.withOpacity(0.5),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'No journal entries yet',
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: Theme.of(context).colorScheme.onSurfaceVariant,
                        ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Start journaling your prayers!',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Theme.of(context).colorScheme.onSurfaceVariant.withOpacity(0.7),
                        ),
                  ),
                ],
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: journalEntries.length,
              itemBuilder: (context, index) {
                final entry = journalEntries[index];
                return _buildJournalCard(context, entry);
              },
            ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        icon: const Icon(Icons.add),
        label: const Text('New Entry'),
      ),
    );
  }

  Widget _buildJournalCard(BuildContext context, Map<String, dynamic> entry) {
    final colorScheme = Theme.of(context).colorScheme;

    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      elevation: 2,
      child: InkWell(
        onTap: () {},
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(
                      entry['title'] as String,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ),
                  PopupMenuButton(
                    itemBuilder: (context) => [
                      const PopupMenuItem(
                        value: 'edit',
                        child: Row(
                          children: [
                            Icon(Icons.edit, size: 20),
                            SizedBox(width: 8),
                            Text('Edit'),
                          ],
                        ),
                      ),
                      const PopupMenuItem(
                        value: 'move',
                        child: Row(
                          children: [
                            Icon(Icons.folder, size: 20),
                            SizedBox(width: 8),
                            Text('Move to Category'),
                          ],
                        ),
                      ),
                      const PopupMenuItem(
                        value: 'delete',
                        child: Row(
                          children: [
                            Icon(Icons.delete, size: 20, color: Colors.red),
                            SizedBox(width: 8),
                            Text('Delete', style: TextStyle(color: Colors.red)),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Text(
                entry['content'] as String,
                style: Theme.of(context).textTheme.bodyMedium,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 12),
              Divider(color: colorScheme.outlineVariant),
              const SizedBox(height: 8),
              Row(
                children: [
                  Icon(
                    Icons.calendar_today,
                    size: 16,
                    color: colorScheme.onSurfaceVariant,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    entry['date'] as String,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: colorScheme.onSurfaceVariant,
                        ),
                  ),
                  const SizedBox(width: 16),
                  if (entry['relatedPrayer'] != null) ...[
                    Icon(
                      Icons.link,
                      size: 16,
                      color: colorScheme.primary,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      entry['relatedPrayer'] as String,
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: colorScheme.primary,
                          ),
                    ),
                  ],
                ],
              ),
              const SizedBox(height: 12),
              Wrap(
                spacing: 8,
                children: [
                  Chip(
                    label: Text(
                      entry['category'] as String,
                      style: const TextStyle(fontSize: 11),
                    ),
                    padding: EdgeInsets.zero,
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    backgroundColor: colorScheme.primaryContainer,
                    side: BorderSide.none,
                  ),
                  if (entry['mood'] != null)
                    Chip(
                      label: Text(
                        entry['mood'] as String,
                        style: const TextStyle(fontSize: 11),
                      ),
                      padding: EdgeInsets.zero,
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      backgroundColor: colorScheme.secondaryContainer,
                      side: BorderSide.none,
                    ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
