import 'package:flutter/material.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';
import '../../app/i18n/strings.g.dart';
import '../../core/db/db_provider.dart';
import '../../core/db/database.dart' show Prayer;
import 'prayers.add.dart';
import '../journal/journal.add.dart';

class Prayers extends StatefulWidget {
  const Prayers({super.key});

  @override
  State<Prayers> createState() => _PrayersState();
}

class _PrayersState extends State<Prayers> {
  final db = DatabaseProvider.instance;

  void _navigateToAdd() async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const PrayersAdd()),
    );
    if (result == true && mounted) {
      setState(() {}); // Refresh
    }
  }

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
        body: TabBarView(
          children: [
            _PrayerList(tab: 'unanswered', onRefresh: () => setState(() {})),
            _PrayerList(tab: 'active', onRefresh: () => setState(() {})),
            _PrayerList(tab: 'answered', onRefresh: () => setState(() {})),
          ],
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: _navigateToAdd,
          icon: const Icon(Icons.add),
          label: const Text('New Prayer'),
        ),
      ),
    );
  }
}

class _PrayerList extends StatefulWidget {
  final String tab;
  final VoidCallback onRefresh;

  const _PrayerList({required this.tab, required this.onRefresh});

  @override
  State<_PrayerList> createState() => _PrayerListState();
}

class _PrayerListState extends State<_PrayerList> {
  final db = DatabaseProvider.instance;
  List<Prayer> _prayers = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadPrayers();
  }

  @override
  void didUpdateWidget(covariant _PrayerList oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.tab != widget.tab) {
      _loadPrayers();
    }
  }

  Future<void> _loadPrayers() async {
    setState(() => _isLoading = true);
    final prayers = await db.getPrayersByStatus(widget.tab);
    if (mounted) {
      setState(() {
        _prayers = prayers;
        _isLoading = false;
      });
    }
  }

  Future<void> _markAsAnswered(Prayer prayer) async {
    await db.markPrayerAnswered(prayer.id);
    _loadPrayers();
    widget.onRefresh();
  }

  Future<void> _deletePrayer(Prayer prayer) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Delete Prayer?'),
        content: Text('Are you sure you want to delete "${prayer.title}"?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            style: TextButton.styleFrom(foregroundColor: Colors.red),
            child: const Text('Delete'),
          ),
        ],
      ),
    );

    if (confirmed == true) {
      await db.deletePrayer(prayer.id);
      _loadPrayers();
      widget.onRefresh();
    }
  }

  void _addToJournal(Prayer prayer) async {
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => JournalAdd(relatedPrayerId: prayer.id),
      ),
    );
  }

  String _formatDate(DateTime date) {
    final now = DateTime.now();
    final diff = now.difference(date);
    if (diff.inDays == 0) return 'Today';
    if (diff.inDays == 1) return 'Yesterday';
    if (diff.inDays < 7) return '${diff.inDays} days ago';
    if (diff.inDays < 30) return '${diff.inDays ~/ 7} weeks ago';
    if (diff.inDays < 365) return '${diff.inDays ~/ 30} months ago';
    return '${diff.inDays ~/ 365} years ago';
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (_prayers.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              widget.tab == 'answered' ? Icons.check_circle_outline : Icons.inbox,
              size: 64,
              color: Theme.of(context).colorScheme.onSurfaceVariant.withOpacity(0.5),
            ),
            const SizedBox(height: 16),
            Text(
              widget.tab == 'unanswered'
                  ? 'No unanswered prayers'
                  : widget.tab == 'active'
                      ? 'No active prayers'
                      : 'No answered prayers yet',
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                  ),
            ),
            const SizedBox(height: 8),
            Text(
              widget.tab == 'answered'
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

    return RefreshIndicator(
      onRefresh: _loadPrayers,
      child: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: _prayers.length,
        itemBuilder: (context, index) {
          final prayer = _prayers[index];
          return Card(
            margin: const EdgeInsets.only(bottom: 12),
            child: ListTile(
              contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              title: Text(
                prayer.title,
                style: const TextStyle(fontWeight: FontWeight.w600),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 4),
                  if (prayer.description != null)
                    Text(
                      prayer.description!,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  const SizedBox(height: 8),
                  Wrap(
                    spacing: 8,
                    children: [
                      Chip(
                        label: Text(
                          prayer.category,
                          style: const TextStyle(fontSize: 11),
                        ),
                        padding: EdgeInsets.zero,
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
                      ),
                      Chip(
                        label: Text(
                          _formatDate(prayer.createdAt),
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
                  if (widget.tab != 'answered')
                    IconButton(
                      icon: const Icon(Symbols.folded_hands),
                      onPressed: () => _markAsAnswered(prayer),
                      tooltip: 'Mark Answered',
                    ),
                  if (widget.tab != 'answered')
                    IconButton(
                      icon: const Icon(Icons.bookmark_border),
                      onPressed: () => _addToJournal(prayer),
                      tooltip: 'Add to Journal',
                    ),
                  PopupMenuButton<String>(
                    onSelected: (value) {
                      switch (value) {
                        case 'edit':
                          // TODO: Navigate to edit
                          break;
                        case 'mark':
                          _markAsAnswered(prayer);
                          break;
                        case 'delete':
                          _deletePrayer(prayer);
                          break;
                      }
                    },
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
                      if (widget.tab != 'answered')
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
                      PopupMenuItem(
                        value: 'delete',
                        child: Row(
                          children: [
                            Icon(Icons.delete, size: 20, color: Colors.red),
                            const SizedBox(width: 8),
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
      ),
    );
  }
}
