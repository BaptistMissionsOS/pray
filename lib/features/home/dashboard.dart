import 'package:flutter/material.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';
import '../../app/i18n/strings.g.dart';
import '../../core/db/db_provider.dart';
import '../../core/db/database.dart' show PrayerActivityData, DashboardBlock;

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final db = DatabaseProvider.instance;
  Map<String, int> _stats = {'total': 0, 'answered': 0, 'unanswered': 0, 'active': 0};
  int _streak = 0;
  int _activeReminders = 0;
  int _activeGoals = 0;
  List<PrayerActivityData> _weekActivity = [];
  List<DashboardBlock> _blocks = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    final stats = await db.getPrayerStats();
    final streak = await db.getCurrentStreak();
    final blocks = await db.getAllDashboardBlocks();
    final activeReminders = await db.getActiveReminderCount();
    final activeGoals = await db.getActiveGoalCount();
    final now = DateTime.now();
    final weekStart = now.subtract(Duration(days: now.weekday - 1));
    final weekEnd = weekStart.add(const Duration(days: 6));
    final activity = await db.getPrayerActivityForRange(weekStart, weekEnd);

    if (mounted) {
      setState(() {
        _stats = stats;
        _streak = streak;
        _activeReminders = activeReminders;
        _activeGoals = activeGoals;
        _blocks = blocks;
        _weekActivity = activity;
        _isLoading = false;
      });
    }
  }

  bool _isDayPrayed(DateTime date) {
    final dateOnly = DateTime(date.year, date.month, date.day);
    return _weekActivity.any((a) => 
      a.date.year == dateOnly.year && 
      a.date.month == dateOnly.month && 
      a.date.day == dateOnly.day && 
      a.prayed
    );
  }

  @override
  Widget build(BuildContext context) {
    final t = Translations.of(context);
    final colorScheme = Theme.of(context).colorScheme;

    if (_isLoading) {
      return Scaffold(
        appBar: AppBar(title: Text(t.content.dashboard)),
        body: const Center(child: CircularProgressIndicator()),
      );
    }

    final now = DateTime.now();
    final weekDays = [
      ('M', now.subtract(Duration(days: now.weekday - 1))),
      ('T', now.subtract(Duration(days: now.weekday - 2))),
      ('W', now.subtract(Duration(days: now.weekday - 3))),
      ('T', now.subtract(Duration(days: now.weekday - 4))),
      ('F', now.subtract(Duration(days: now.weekday - 5))),
      ('S', now.subtract(Duration(days: now.weekday - 6))),
      ('S', now.subtract(Duration(days: now.weekday - 7))),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(t.content.dashboard),
      ),
      body: RefreshIndicator(
        onRefresh: _loadData,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // User Created Blocks (First)
              if (_blocks.isNotEmpty) ...[
                ..._blocks.map((block) => Column(
                  children: [
                    _buildBlock(context, block),
                    const SizedBox(height: 12),
                  ],
                )),
                const Divider(height: 32, thickness: 1),
              ],

              // Default Blocks (Second)
              _buildStatBlock(
                context,
                icon: Symbols.folded_hands,
                title: t.dashboard.stats.totalPrayers,
                value: _stats['total'].toString(),
                subtitle: t.dashboard.stats.allTimePrayers,
                color: colorScheme.primary,
              ),
              const SizedBox(height: 12),
              _buildStatBlock(
                context,
                icon: Icons.check_circle,
                title: t.dashboard.stats.answered,
                value: _stats['answered'].toString(),
                subtitle: t.dashboard.stats.prayersAnswered,
                color: Colors.green,
              ),
              const SizedBox(height: 12),
              _buildStatBlock(
                context,
                icon: Icons.pending,
                title: t.dashboard.stats.unanswered,
                value: _stats['unanswered'].toString(),
                subtitle: t.dashboard.stats.stillPraying,
                color: Colors.orange,
              ),
              const Divider(height: 32, thickness: 1),

              // Milestones (Third)
              _buildStatBlock(
                context,
                icon: Icons.local_fire_department,
                title: t.dashboard.stats.streak,
                value: _streak.toString(),
                subtitle: t.dashboard.stats.dayPrayerStreak,
                color: Colors.red,
              ),
              const SizedBox(height: 12),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        t.dashboard.stats.thisWeek,
                        style: Theme.of(context).textTheme.titleMedium?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      const SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: weekDays.map((day) =>
                          _buildDayIndicator(context, day.$1, _isDayPrayed(day.$2))
                        ).toList(),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 24),

              // Quick Actions (Last)
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        t.dashboard.quickActions,
                        style: Theme.of(context).textTheme.titleMedium?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      const SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          _buildQuickAction(
                            context,
                            icon: Symbols.folded_hands,
                            label: t.dashboard.iPrayedToday,
                            onTap: () async {
                              await db.recordPrayerActivity(DateTime.now(), prayed: true);
                              _loadData();
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStatBlock(
    BuildContext context, {
    required IconData icon,
    required String title,
    required String value,
    required String subtitle,
    required Color color,
  }) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Container(
              width: 56,
              height: 56,
              decoration: BoxDecoration(
                color: color.withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(icon, color: color, size: 28),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Theme.of(context).colorScheme.onSurfaceVariant,
                        ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    value,
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: color,
                        ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    subtitle,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: Theme.of(context).colorScheme.onSurfaceVariant,
                        ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDayIndicator(BuildContext context, String day, bool completed) {
    return Column(
      children: [
        Container(
          width: 36,
          height: 36,
          decoration: BoxDecoration(
            color: completed
                ? Theme.of(context).colorScheme.primary
                : Theme.of(context).colorScheme.surfaceContainerHighest,
            shape: BoxShape.circle,
          ),
          child: Icon(
            completed ? Icons.check : null,
            color: Colors.white,
            size: 20,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          day,
          style: Theme.of(context).textTheme.bodySmall,
        ),
      ],
    );
  }

  Widget _buildQuickAction(
    BuildContext context, {
    required IconData icon,
    required String label,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primaryContainer,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          children: [
            Icon(icon, color: Theme.of(context).colorScheme.primary, size: 32),
            const SizedBox(height: 8),
            Text(
              label,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                    fontWeight: FontWeight.w600,
                  ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBlock(BuildContext context, DashboardBlock block) {
    final t = Translations.of(context);
    final colorScheme = Theme.of(context).colorScheme;

    IconData icon;
    String title;
    String value;
    String subtitle;
    Color color;

    switch (block.type) {
      case 'counter':
        icon = Icons.format_list_numbered;
        title = t.dashboard.edit.blockNames.totalPrayers;
        value = _stats['total'].toString();
        subtitle = t.dashboard.edit.blockTypes.counter;
        color = colorScheme.primary;
      case 'chart':
        icon = Icons.pie_chart;
        title = t.dashboard.edit.blockNames.weeklyActivity;
        value = _weekActivity.where((a) => a.prayed).length.toString();
        subtitle = t.dashboard.edit.blockTypes.chart;
        color = Colors.blue;
      case 'list':
        icon = Icons.list;
        title = t.dashboard.blockTypes.list;
        value = _stats['active'].toString();
        subtitle = t.dashboard.edit.blockTypes.counter;
        color = Colors.purple;
      case 'category':
        icon = Icons.category;
        title = t.dashboard.blockTypes.category;
        value = _stats['answered'].toString();
        subtitle = t.dashboard.edit.blockTypes.counter;
        color = Colors.green;
      case 'rate':
        icon = Icons.percent;
        final rate = _stats['total']! > 0
            ? ((_stats['answered']! / _stats['total']!) * 100).round()
            : 0;
        title = t.dashboard.blockTypes.rate;
        value = '$rate%';
        subtitle = t.dashboard.edit.blockTypes.counter;
        color = Colors.orange;
      case 'reminder':
        icon = Icons.notifications_active;
        title = t.dashboard.blockTypes.reminder;
        value = _activeReminders.toString();
        subtitle = t.dashboard.blockTypes.reminderDesc;
        color = Colors.teal;
      case 'goals':
        icon = Icons.flag;
        title = t.dashboard.blockTypes.goals;
        value = _activeGoals.toString();
        subtitle = t.dashboard.blockTypes.goalsDesc;
        color = Colors.indigo;
      default:
        icon = Icons.dashboard;
        title = block.type;
        value = '';
        subtitle = '';
        color = colorScheme.primary;
    }

    return _buildStatBlock(
      context,
      icon: icon,
      title: title,
      value: value,
      subtitle: subtitle,
      color: color,
    );
  }
}
