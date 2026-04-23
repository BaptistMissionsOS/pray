import 'package:flutter/material.dart';
import '../../app/i18n/strings.g.dart';
import '../../core/db/db_provider.dart';
import '../../core/db/database.dart' show Prayer, JournalEntry;

class Reminders extends StatefulWidget {
  const Reminders({super.key});

  @override
  State<Reminders> createState() => _RemindersState();
}

enum CalendarView { month, week, schedule }
enum ReminderFilterType { both, prayers, journals }

class ReminderItem {
  final int id;
  final String title;
  final String? description;
  final DateTime date;
  final ReminderType type;
  final String? category;

  ReminderItem({
    required this.id,
    required this.title,
    this.description,
    required this.date,
    required this.type,
    this.category,
  });
}

enum ReminderType { prayer, journal }

class _RemindersState extends State<Reminders> {
  CalendarView _currentView = CalendarView.month;
  ReminderFilterType _filterType = ReminderFilterType.both;
  DateTime _selectedDate = DateTime.now();
  DateTime _focusedMonth = DateTime.now();
  List<ReminderItem> _allReminders = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadReminders();
  }

  Future<void> _loadReminders() async {
    setState(() => _isLoading = true);

    final db = DatabaseProvider.instance;
    final now = DateTime.now();
    final startOfToday = DateTime(now.year, now.month, now.day);

    List<ReminderItem> allReminders = [];

    // Get prayers with future dates if filter allows
    if (_filterType == ReminderFilterType.both || _filterType == ReminderFilterType.prayers) {
      final prayers = await db.getFuturePrayers(startOfToday);
      final prayerReminders = prayers.map((p) => ReminderItem(
        id: p.id,
        title: p.title,
        description: p.description,
        date: p.createdAt,
        type: ReminderType.prayer,
        category: p.status,
      )).toList();
      allReminders.addAll(prayerReminders);
    }

    // Get journal entries with future dates if filter allows
    if (_filterType == ReminderFilterType.both || _filterType == ReminderFilterType.journals) {
      final journals = await db.getFutureJournalEntries(startOfToday);
      final journalReminders = journals.map((j) => ReminderItem(
        id: j.id,
        title: j.title,
        description: j.content,
        date: j.createdAt,
        type: ReminderType.journal,
        category: j.category,
      )).toList();
      allReminders.addAll(journalReminders);
    }

    allReminders.sort((a, b) => a.date.compareTo(b.date));

    setState(() {
      _allReminders = allReminders;
      _isLoading = false;
    });
  }

  List<ReminderItem> get _reminders => _allReminders;

  void _previousPeriod() {
    setState(() {
      switch (_currentView) {
        case CalendarView.month:
          _focusedMonth = DateTime(_focusedMonth.year, _focusedMonth.month - 1);
          break;
        case CalendarView.week:
          _selectedDate = _selectedDate.subtract(const Duration(days: 7));
          break;
        case CalendarView.schedule:
          _selectedDate = _selectedDate.subtract(const Duration(days: 1));
          break;
      }
    });
  }

  void _nextPeriod() {
    setState(() {
      switch (_currentView) {
        case CalendarView.month:
          _focusedMonth = DateTime(_focusedMonth.year, _focusedMonth.month + 1);
          break;
        case CalendarView.week:
          _selectedDate = _selectedDate.add(const Duration(days: 7));
          break;
        case CalendarView.schedule:
          _selectedDate = _selectedDate.add(const Duration(days: 1));
          break;
      }
    });
  }

  void _goToToday() {
    setState(() {
      _selectedDate = DateTime.now();
      _focusedMonth = DateTime.now();
    });
  }

  String _getAppBarTitle() {
    final t = Translations.of(context);
    switch (_currentView) {
      case CalendarView.month:
        return '${_getMonthName(_focusedMonth)} ${_focusedMonth.year}';
      case CalendarView.week:
        final startOfWeek = _selectedDate.subtract(Duration(days: _selectedDate.weekday - 1));
        final endOfWeek = startOfWeek.add(const Duration(days: 6));
        return '${_getMonthName(startOfWeek).substring(0, 3)} ${startOfWeek.day} - ${_getMonthName(endOfWeek).substring(0, 3)} ${endOfWeek.day}';
      case CalendarView.schedule:
        return '${_getFullWeekday(_selectedDate)}, ${_getMonthName(_selectedDate)} ${_selectedDate.day}';
    }
  }

  @override
  Widget build(BuildContext context) {
    final t = Translations.of(context);
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: Text(_getAppBarTitle()),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.today),
            tooltip: t.reminders.today,
            onPressed: _goToToday,
          ),
          PopupMenuButton<ReminderFilterType>(
            icon: Icon(
              Icons.filter_list,
              color: _filterType != ReminderFilterType.both ? colorScheme.primary : null,
            ),
            onSelected: (filter) {
              setState(() {
                _filterType = filter;
              });
              _loadReminders();
            },
            itemBuilder: (context) => [
              PopupMenuItem(
                value: ReminderFilterType.both,
                child: Row(
                  children: [
                    Icon(Icons.all_inclusive,
                        color: _filterType == ReminderFilterType.both ? colorScheme.primary : null),
                    const SizedBox(width: 8),
                    Text(t.reminders.filters.both),
                    if (_filterType == ReminderFilterType.both)
                      const Icon(Icons.check, color: Colors.green, size: 18),
                  ],
                ),
              ),
              PopupMenuItem(
                value: ReminderFilterType.prayers,
                child: Row(
                  children: [
                    Icon(Icons.favorite,
                        color: _filterType == ReminderFilterType.prayers ? Colors.blue : null),
                    const SizedBox(width: 8),
                    Text(t.reminders.filters.prayersOnly),
                    if (_filterType == ReminderFilterType.prayers)
                      const Icon(Icons.check, color: Colors.green, size: 18),
                  ],
                ),
              ),
              PopupMenuItem(
                value: ReminderFilterType.journals,
                child: Row(
                  children: [
                    Icon(Icons.book,
                        color: _filterType == ReminderFilterType.journals ? Colors.green : null),
                    const SizedBox(width: 8),
                    Text(t.reminders.filters.journalsOnly),
                    if (_filterType == ReminderFilterType.journals)
                      const Icon(Icons.check, color: Colors.green, size: 18),
                  ],
                ),
              ),
            ],
          ),
          PopupMenuButton<CalendarView>(
            icon: const Icon(Icons.view_agenda),
            onSelected: (view) => setState(() => _currentView = view),
            itemBuilder: (context) => [
              PopupMenuItem(
                value: CalendarView.month,
                child: Row(
                  children: [
                    Icon(Icons.calendar_view_month,
                        color: _currentView == CalendarView.month ? colorScheme.primary : null),
                    const SizedBox(width: 8),
                    Text(t.reminders.views.month),
                  ],
                ),
              ),
              PopupMenuItem(
                value: CalendarView.week,
                child: Row(
                  children: [
                    Icon(Icons.view_week,
                        color: _currentView == CalendarView.week ? colorScheme.primary : null),
                    const SizedBox(width: 8),
                    Text(t.reminders.views.week),
                  ],
                ),
              ),
              PopupMenuItem(
                value: CalendarView.schedule,
                child: Row(
                  children: [
                    Icon(Icons.view_list,
                        color: _currentView == CalendarView.schedule ? colorScheme.primary : null),
                    const SizedBox(width: 8),
                    Text(t.reminders.views.schedule),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
      body: Column(
        children: [
          // Navigation Bar
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
            decoration: BoxDecoration(
              color: colorScheme.surfaceContainerHighest,
              border: Border(
                bottom: BorderSide(color: colorScheme.outlineVariant),
              ),
            ),
            child: Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.chevron_left),
                  onPressed: _previousPeriod,
                ),
                Expanded(
                  child: Center(
                    child: Text(
                      _getNavLabel(t),
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.chevron_right),
                  onPressed: _nextPeriod,
                ),
              ],
            ),
          ),
          // View Content
          Expanded(
            child: _isLoading
                ? const Center(child: CircularProgressIndicator())
                : _buildView(),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _loadReminders,
        icon: const Icon(Icons.refresh),
        label: Text(t.reminders.refresh),
      ),
    );
  }

  String _getNavLabel(Translations t) {
    switch (_currentView) {
      case CalendarView.month:
        return '${_getMonthName(_focusedMonth)} ${_focusedMonth.year}';
      case CalendarView.week:
        return t.reminders.weekOf;
      case CalendarView.schedule:
        return _getFullWeekday(_selectedDate);
    }
  }

  Widget _buildView() {
    switch (_currentView) {
      case CalendarView.month:
        return _buildMonthView();
      case CalendarView.week:
        return _buildWeekView();
      case CalendarView.schedule:
        return _buildScheduleView();
    }
  }

  Widget _buildMonthView() {
    final firstDayOfMonth = DateTime(_focusedMonth.year, _focusedMonth.month, 1);
    final daysInMonth = DateTime(_focusedMonth.year, _focusedMonth.month + 1, 0).day;
    final firstWeekday = firstDayOfMonth.weekday;
    final daysBefore = firstWeekday - 1;

    return Column(
      children: [
        // Weekday headers
        Container(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              t.reminders.weekdays.short.mon,
              t.reminders.weekdays.short.tue,
              t.reminders.weekdays.short.wed,
              t.reminders.weekdays.short.thu,
              t.reminders.weekdays.short.fri,
              t.reminders.weekdays.short.sat,
              t.reminders.weekdays.short.sun,
            ]
                .map((day) => Expanded(
                      child: Center(
                        child: Text(
                          day,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                        ),
                      ),
                    ))
                .toList(),
          ),
        ),
        const Divider(height: 1),
        // Calendar grid
        Expanded(
          child: GridView.builder(
            padding: const EdgeInsets.all(8),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 7,
              childAspectRatio: 0.8,
            ),
            itemCount: daysBefore + daysInMonth,
            itemBuilder: (context, index) {
              if (index < daysBefore) {
                return const SizedBox.shrink();
              }

              final day = index - daysBefore + 1;
              final date = DateTime(_focusedMonth.year, _focusedMonth.month, day);
              final dayReminders = _remindersForDate(date);
              final isToday = _isToday(date);
              final isSelected = _isSameDay(date, _selectedDate);

              return InkWell(
                onTap: () {
                  setState(() {
                    _selectedDate = date;
                  });
                  _showDayPopup(date, dayReminders);
                },
                child: Container(
                  margin: const EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    color: isSelected
                        ? Theme.of(context).colorScheme.primaryContainer
                        : isToday
                            ? Theme.of(context).colorScheme.secondaryContainer
                            : null,
                    borderRadius: BorderRadius.circular(8),
                    border: isToday
                        ? Border.all(color: Theme.of(context).colorScheme.primary)
                        : null,
                  ),
                  child: Column(
                    children: [
                      Text(
                        '$day',
                        style: TextStyle(
                          fontWeight: isToday || isSelected ? FontWeight.bold : null,
                          color: isToday
                              ? Theme.of(context).colorScheme.primary
                              : null,
                        ),
                      ),
                      if (dayReminders.isNotEmpty)
                        Expanded(
                          child: ListView.builder(
                            itemCount: dayReminders.length.clamp(0, 3),
                            itemBuilder: (context, i) {
                              final reminder = dayReminders[i];
                              return Container(
                                margin: const EdgeInsets.symmetric(vertical: 1, horizontal: 2),
                                padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 1),
                                decoration: BoxDecoration(
                                  color: reminder.type == ReminderType.prayer
                                      ? Colors.blue.shade200
                                      : Colors.green.shade200,
                                  borderRadius: BorderRadius.circular(2),
                                ),
                                child: Text(
                                  reminder.title,
                                  style: const TextStyle(fontSize: 8),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                ),
                              );
                            },
                          ),
                        ),
                      if (dayReminders.length > 3)
                        Text(
                          '+${dayReminders.length - 3}',
                          style: const TextStyle(fontSize: 8, color: Colors.grey),
                        ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildWeekView() {
    final t = Translations.of(context);
    final startOfWeek = _selectedDate.subtract(Duration(days: _selectedDate.weekday - 1));

    return ListView.builder(
      itemCount: 7,
      itemBuilder: (context, index) {
        final date = startOfWeek.add(Duration(days: index));
        final dayReminders = _remindersForDate(date);
        final isToday = _isToday(date);

        return Card(
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
          color: isToday ? Theme.of(context).colorScheme.primaryContainer : null,
          child: ExpansionTile(
            leading: CircleAvatar(
              backgroundColor: isToday
                  ? Theme.of(context).colorScheme.primary
                  : Theme.of(context).colorScheme.surfaceContainerHighest,
              child: Text(
                '${date.day}',
                style: TextStyle(
                  color: isToday
                      ? Theme.of(context).colorScheme.onPrimary
                      : null,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            title: Text(
              _getFullWeekday(date),
              style: TextStyle(
                fontWeight: isToday ? FontWeight.bold : null,
              ),
            ),
            subtitle: Text(t.reminders.items(count: dayReminders.length)),
            children: dayReminders.isEmpty
                ? [
                    ListTile(
                      title: Text(
                        t.reminders.noReminders,
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.onSurfaceVariant,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ),
                  ]
                : dayReminders.map((reminder) => _buildReminderTile(reminder)).toList(),
          ),
        );
      },
    );
  }

  Widget _buildScheduleView() {
    final t = Translations.of(context);
    final dayReminders = _remindersForDate(_selectedDate);

    if (dayReminders.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.event_available,
              size: 64,
              color: Theme.of(context).colorScheme.onSurfaceVariant.withOpacity(0.5),
            ),
            const SizedBox(height: 16),
            Text(
              t.reminders.noRemindersForDay,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                  ),
            ),
          ],
        ),
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: dayReminders.length,
      itemBuilder: (context, index) {
        final reminder = dayReminders[index];
        return _buildReminderTile(reminder);
      },
    );
  }

  Widget _buildReminderTile(ReminderItem reminder) {
    final colorScheme = Theme.of(context).colorScheme;
    final isPrayer = reminder.type == ReminderType.prayer;

    return Card(
      margin: const EdgeInsets.only(bottom: 8),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: isPrayer ? Colors.blue.shade100 : Colors.green.shade100,
          child: Icon(
            isPrayer ? Icons.favorite : Icons.book,
            color: isPrayer ? Colors.blue : Colors.green,
          ),
        ),
        title: Text(
          reminder.title,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (reminder.description != null && reminder.description!.isNotEmpty)
              Text(
                reminder.description!,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            const SizedBox(height: 4),
            Row(
              children: [
                Icon(
                  Icons.access_time,
                  size: 14,
                  color: colorScheme.onSurfaceVariant,
                ),
                const SizedBox(width: 4),
                Text(
                  '${reminder.date.hour % 12 == 0 ? 12 : reminder.date.hour % 12}:${reminder.date.minute.toString().padLeft(2, '0')} ${reminder.date.hour >= 12 ? 'PM' : 'AM'}',
                  style: TextStyle(
                    fontSize: 12,
                    color: colorScheme.onSurfaceVariant,
                  ),
                ),
                const SizedBox(width: 16),
                if (reminder.category != null)
                  Chip(
                    label: Text(
                      reminder.category!,
                      style: const TextStyle(fontSize: 10),
                    ),
                    padding: EdgeInsets.zero,
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    backgroundColor: isPrayer
                        ? Colors.blue.shade50
                        : Colors.green.shade50,
                  ),
              ],
            ),
          ],
        ),
        isThreeLine: reminder.description != null && reminder.description!.isNotEmpty,
      ),
    );
  }

  List<ReminderItem> _remindersForDate(DateTime date) {
    return _reminders.where((r) => _isSameDay(r.date, date)).toList();
  }

  bool _isSameDay(DateTime a, DateTime b) {
    return a.year == b.year && a.month == b.month && a.day == b.day;
  }

  bool _isToday(DateTime date) {
    final now = DateTime.now();
    return _isSameDay(date, now);
  }

  String _getFullWeekday(DateTime date) {
    final t = Translations.of(context);
    switch (date.weekday) {
      case DateTime.monday:
        return t.reminders.weekdays.full.monday;
      case DateTime.tuesday:
        return t.reminders.weekdays.full.tuesday;
      case DateTime.wednesday:
        return t.reminders.weekdays.full.wednesday;
      case DateTime.thursday:
        return t.reminders.weekdays.full.thursday;
      case DateTime.friday:
        return t.reminders.weekdays.full.friday;
      case DateTime.saturday:
        return t.reminders.weekdays.full.saturday;
      case DateTime.sunday:
        return t.reminders.weekdays.full.sunday;
      default:
        return '';
    }
  }

  String _getMonthName(DateTime date) {
    final t = Translations.of(context);
    switch (date.month) {
      case DateTime.january:
        return t.reminders.months.january;
      case DateTime.february:
        return t.reminders.months.february;
      case DateTime.march:
        return t.reminders.months.march;
      case DateTime.april:
        return t.reminders.months.april;
      case DateTime.may:
        return t.reminders.months.may;
      case DateTime.june:
        return t.reminders.months.june;
      case DateTime.july:
        return t.reminders.months.july;
      case DateTime.august:
        return t.reminders.months.august;
      case DateTime.september:
        return t.reminders.months.september;
      case DateTime.october:
        return t.reminders.months.october;
      case DateTime.november:
        return t.reminders.months.november;
      case DateTime.december:
        return t.reminders.months.december;
      default:
        return '';
    }
  }

  void _showDayPopup(DateTime date, List<ReminderItem> dayReminders) {
    final t = Translations.of(context);
    final colorScheme = Theme.of(context).colorScheme;

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Row(
          children: [
            Icon(
              Icons.calendar_today,
              color: colorScheme.primary,
            ),
            const SizedBox(width: 8),
            Text(
              '${_getFullWeekday(date)}, ${_getMonthName(date).substring(0, 3)} ${date.day}, ${date.year}',
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
        content: SizedBox(
          width: double.maxFinite,
          child: dayReminders.isEmpty
              ? Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.event_busy,
                      size: 48,
                      color: colorScheme.onSurfaceVariant.withOpacity(0.5),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      t.reminders.noRemindersForDay,
                      style: TextStyle(
                        color: colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ],
                )
              : ListView.builder(
                  shrinkWrap: true,
                  itemCount: dayReminders.length,
                  itemBuilder: (context, index) {
                    final reminder = dayReminders[index];
                    return _buildReminderTile(reminder);
                  },
                ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(t.common.close),
          ),
        ],
      ),
    );
  }
}
