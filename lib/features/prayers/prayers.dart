import 'package:flutter/material.dart';
import '../../app/i18n/strings.g.dart';

class Prayers extends StatelessWidget {
  const Prayers({super.key});

  @override
  Widget build(BuildContext context) {
    final t = Translations.of(context);
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text(t.drawer.categories.prayers),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Unanswered', icon: Icon(Icons.pending)),
              Tab(text: 'Active', icon: Icon(Icons.favorite)),
              Tab(text: 'Answered', icon: Icon(Icons.check_circle)),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            _PrayerList(tab: 'unanswered'),
            _PrayerList(tab: 'active'),
            _PrayerList(tab: 'answered'),
          ],
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {},
          icon: const Icon(Icons.add),
          label: const Text('New Prayer'),
        ),
      ),
    );
  }
}

class _PrayerList extends StatelessWidget {
  final String tab;

  const _PrayerList({required this.tab});

  @override
  Widget build(BuildContext context) {
    final samplePrayers = _getSamplePrayers(tab);

    if (samplePrayers.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              tab == 'answered' ? Icons.check_circle_outline : Icons.inbox,
              size: 64,
              color: Theme.of(context).colorScheme.onSurfaceVariant.withOpacity(0.5),
            ),
            const SizedBox(height: 16),
            Text(
              tab == 'unanswered'
                  ? 'No unanswered prayers'
                  : tab == 'active'
                      ? 'No active prayers'
                      : 'No answered prayers yet',
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                  ),
            ),
            const SizedBox(height: 8),
            Text(
              tab == 'answered'
                  ? 'Keep praying! God answers in His time.'
                  : 'Tap + to add a new prayer',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Theme.of(context).colorScheme.onSurfaceVariant.withOpacity(0.7),
                  ),
            ),
          ],
        ),
      );
    }

    return ListView.builder(
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
                Text(
                  prayer['description'] as String,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 8),
                Wrap(
                  spacing: 8,
                  children: [
                    if (prayer['category'] != null)
                      Chip(
                        label: Text(
                          prayer['category'] as String,
                          style: const TextStyle(fontSize: 11),
                        ),
                        padding: EdgeInsets.zero,
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
                      ),
                    Chip(
                      label: Text(
                        prayer['date'] as String,
                        style: const TextStyle(fontSize: 11),
                      ),
                      padding: EdgeInsets.zero,
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    ),
                  ],
                ),
              ],
            ),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (tab != 'answered')
                  IconButton(
                    icon: const Icon(Icons.bookmark_border),
                    onPressed: () {},
                    tooltip: 'Add to Journal',
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
                    if (tab != 'answered')
                      const PopupMenuItem(
                        value: 'mark',
                        child: Row(
                          children: [
                            Icon(Icons.check_circle, size: 20, color: Colors.green),
                            SizedBox(width: 8),
                            Text('Mark Answered'),
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
            onTap: () {},
          ),
        );
      },
    );
  }

  List<Map<String, dynamic>> _getSamplePrayers(String tab) {
    if (tab == 'unanswered') {
      return [
        {
          'title': 'Family Salvation',
          'description': 'Praying for my brother to come to know Christ. He has been resistant to the gospel for many years.',
          'category': 'Family',
          'date': '3 days ago',
        },
        {
          'title': 'Job Interview',
          'description': 'Upcoming interview next week. Praying for wisdom and favor.',
          'category': 'Work',
          'date': '1 week ago',
        },
        {
          'title': 'Healing for Mom',
          'description': 'She is recovering from surgery. Praying for complete healing and strength.',
          'category': 'Health',
          'date': '2 weeks ago',
        },
      ];
    } else if (tab == 'active') {
      return [
        {
          'title': 'Daily Devotion',
          'description': 'Consistent morning prayer and Bible reading time.',
          'category': 'Spiritual',
          'date': 'Daily',
        },
        {
          'title': 'Mission Trip',
          'description': 'Preparing for the summer mission trip to rural communities.',
          'category': 'Missions',
          'date': 'Ongoing',
        },
      ];
    } else {
      return [
        {
          'title': 'Car Repair',
          'description': 'The car was fixed at a reasonable price. Thank God!',
          'category': 'Provision',
          'date': 'Last month',
        },
        {
          'title': 'Sisters Reconciliation',
          'description': 'They were able to talk and restore their relationship.',
          'category': 'Family',
          'date': '2 months ago',
        },
      ];
    }
  }
}
