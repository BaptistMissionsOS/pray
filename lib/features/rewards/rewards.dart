import 'package:flutter/material.dart';
import 'package:confetti/confetti.dart';
import '../../app/i18n/strings.g.dart';
import '../../core/db/db_provider.dart';

enum RewardLevel {
  seeker,
  disciple,
  watchman,
  intercessor,
  warrior,
}

class RewardLevelInfo {
  final RewardLevel level;
  final String name;
  final String description;
  final int minDays;
  final Color color;
  final IconData icon;

  RewardLevelInfo({
    required this.level,
    required this.name,
    required this.description,
    required this.minDays,
    required this.color,
    required this.icon,
  });
}

class DailyStreak {
  final DateTime date;
  final bool prayed;
  final int streakCount;

  DailyStreak({
    required this.date,
    required this.prayed,
    required this.streakCount,
  });
}

class Rewards extends StatefulWidget {
  const Rewards({super.key});

  @override
  State<Rewards> createState() => _RewardsState();
}

class _RewardsState extends State<Rewards> {
  final db = DatabaseProvider.instance;
  int _currentStreak = 0;
  int _longestStreak = 0;
  int _totalPrayerDays = 0;
  List<DailyStreak> _streakHistory = [];
  RewardLevel _currentLevel = RewardLevel.seeker;
  bool _isLoading = true;
  late ConfettiController _confettiController;
  RewardLevel? _previousLevel;

  @override
  void initState() {
    super.initState();
    _confettiController = ConfettiController(duration: const Duration(seconds: 3));
    _loadRewardsData();
  }

  @override
  void dispose() {
    _confettiController.dispose();
    super.dispose();
  }

  Future<void> _loadRewardsData() async {
    setState(() => _isLoading = true);

    final currentStreak = await db.getCurrentStreak();
    final longestStreak = await db.getLongestStreak();
    final totalDays = await db.getTotalPrayerDays();
    
    // Get last 30 days of streak history
    final now = DateTime.now();
    final history = await db.getPrayerActivityForRange(
      now.subtract(const Duration(days: 29)),
      now,
    );

    final streakHistory = history.map((h) => DailyStreak(
      date: h.date,
      prayed: h.prayed,
      streakCount: h.prayed ? 1 : 0,
    )).toList();

    // Sort by date descending
    streakHistory.sort((a, b) => b.date.compareTo(a.date));

    final level = _calculateLevel(currentStreak);
    final previousLevel = _currentLevel;

    if (mounted) {
      setState(() {
        _currentStreak = currentStreak;
        _longestStreak = longestStreak;
        _totalPrayerDays = totalDays;
        _streakHistory = streakHistory;
        _currentLevel = level;
        _isLoading = false;
      });

      // Play confetti if level changed or on first load with level above seeker
      if (previousLevel != level || (previousLevel == RewardLevel.seeker && level != RewardLevel.seeker)) {
        if (level != RewardLevel.seeker) {
          _confettiController.play();
        }
      }
    }
  }

  RewardLevel _calculateLevel(int streak) {
    if (streak >= 90) return RewardLevel.warrior;
    if (streak >= 60) return RewardLevel.intercessor;
    if (streak >= 30) return RewardLevel.watchman;
    if (streak >= 7) return RewardLevel.disciple;
    return RewardLevel.seeker;
  }

  RewardLevelInfo _getLevelInfo(RewardLevel level) {
    final t = Translations.of(context);
    switch (level) {
      case RewardLevel.seeker:
        return RewardLevelInfo(
          level: level,
          name: t.rewards.levels.seeker,
          description: t.rewards.levels.seekerDesc,
          minDays: 0,
          color: Colors.grey,
          icon: Icons.search,
        );
      case RewardLevel.disciple:
        return RewardLevelInfo(
          level: level,
          name: t.rewards.levels.disciple,
          description: t.rewards.levels.discipleDesc,
          minDays: 7,
          color: Colors.green,
          icon: Icons.school,
        );
      case RewardLevel.watchman:
        return RewardLevelInfo(
          level: level,
          name: t.rewards.levels.watchman,
          description: t.rewards.levels.watchmanDesc,
          minDays: 30,
          color: Colors.blue,
          icon: Icons.visibility,
        );
      case RewardLevel.intercessor:
        return RewardLevelInfo(
          level: level,
          name: t.rewards.levels.intercessor,
          description: t.rewards.levels.intercessorDesc,
          minDays: 60,
          color: Colors.purple,
          icon: Icons.favorite,
        );
      case RewardLevel.warrior:
        return RewardLevelInfo(
          level: level,
          name: t.rewards.levels.warrior,
          description: t.rewards.levels.warriorDesc,
          minDays: 90,
          color: Colors.orange,
          icon: Icons.local_fire_department,
        );
    }
  }

  int _getDaysToNextLevel() {
    switch (_currentLevel) {
      case RewardLevel.seeker:
        return 7 - _currentStreak;
      case RewardLevel.disciple:
        return 30 - _currentStreak;
      case RewardLevel.watchman:
        return 60 - _currentStreak;
      case RewardLevel.intercessor:
        return 90 - _currentStreak;
      case RewardLevel.warrior:
        return 0;
    }
  }

  RewardLevel? _getNextLevel() {
    switch (_currentLevel) {
      case RewardLevel.seeker:
        return RewardLevel.disciple;
      case RewardLevel.disciple:
        return RewardLevel.watchman;
      case RewardLevel.watchman:
        return RewardLevel.intercessor;
      case RewardLevel.intercessor:
        return RewardLevel.warrior;
      case RewardLevel.warrior:
        return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    final t = Translations.of(context);
    final colorScheme = Theme.of(context).colorScheme;
    final currentLevelInfo = _getLevelInfo(_currentLevel);
    final nextLevel = _getNextLevel();
    final daysToNext = _getDaysToNextLevel();

    return Scaffold(
      appBar: AppBar(
        title: Text(t.rewards.title),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            tooltip: t.rewards.refresh,
            onPressed: _loadRewardsData,
          ),
        ],
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : Stack(
              children: [
                RefreshIndicator(
                  onRefresh: _loadRewardsData,
                  child: SingleChildScrollView(
                    physics: const AlwaysScrollableScrollPhysics(),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Current Level Card
                          _buildLevelCard(currentLevelInfo),
                          
                          const SizedBox(height: 16),
                          
                          // Streak Stats
                          _buildStreakStats(t, colorScheme),
                          
                          const SizedBox(height: 16),
                          
                          // Progress to Next Level
                          if (nextLevel != null && daysToNext > 0)
                            _buildProgressCard(t, nextLevel, daysToNext),
                          
                          if (nextLevel != null && daysToNext > 0)
                            const SizedBox(height: 16),
                          
                          // Daily Streak Calendar
                          _buildStreakCalendar(t),
                          
                          const SizedBox(height: 16),
                          
                          // All Levels
                          _buildAllLevels(t),
                        ],
                      ),
                    ),
                  ),
                ),
                // Confetti overlay
                Align(
                  alignment: Alignment.topCenter,
                  child: ConfettiWidget(
                    confettiController: _confettiController,
                    blastDirectionality: BlastDirectionality.explosive,
                    shouldLoop: false,
                    colors: const [
                      Colors.green,
                      Colors.blue,
                      Colors.pink,
                      Colors.orange,
                      Colors.purple,
                      Colors.red,
                      Colors.yellow,
                      Colors.teal,
                    ],
                    emissionFrequency: 0.05,
                    numberOfParticles: 30,
                    maxBlastForce: 20,
                    minBlastForce: 5,
                    gravity: 0.3,
                    particleDrag: 0.05,
                  ),
                ),
              ],
            ),
    );
  }

  Widget _buildLevelCard(RewardLevelInfo levelInfo) {
    return Card(
      elevation: 4,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              levelInfo.color.withOpacity(0.2),
              levelInfo.color.withOpacity(0.05),
            ],
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          children: [
            Icon(
              levelInfo.icon,
              size: 64,
              color: levelInfo.color,
            ),
            const SizedBox(height: 12),
            Text(
              levelInfo.name,
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: levelInfo.color,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              levelInfo.description,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 14,
              ),
            ),
            const SizedBox(height: 12),
            Chip(
              label: Text(
                '${levelInfo.minDays}+ ${Translations.of(context).rewards.days}',
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              backgroundColor: levelInfo.color.withOpacity(0.2),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStreakStats(Translations t, ColorScheme colorScheme) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              t.rewards.statsTitle,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildStatItem(
                  Icons.local_fire_department,
                  '$_currentStreak',
                  t.rewards.currentStreak,
                  Colors.orange,
                ),
                _buildStatItem(
                  Icons.emoji_events,
                  '$_longestStreak',
                  t.rewards.longestStreak,
                  Colors.amber,
                ),
                _buildStatItem(
                  Icons.calendar_today,
                  '$_totalPrayerDays',
                  t.rewards.totalDays,
                  Colors.green,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatItem(IconData icon, String value, String label, Color color) {
    return Column(
      children: [
        Icon(icon, color: color, size: 32),
        const SizedBox(height: 8),
        Text(
          value,
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: color,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: const TextStyle(fontSize: 12),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget _buildProgressCard(Translations t, RewardLevel nextLevel, int daysToNext) {
    final nextLevelInfo = _getLevelInfo(nextLevel);
    final progress = (_currentStreak - nextLevelInfo.minDays + daysToNext) / 
                     (nextLevelInfo.minDays - (_currentLevel == RewardLevel.seeker ? 0 : 
                      _getLevelInfo(_currentLevel).minDays));

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(nextLevelInfo.icon, color: nextLevelInfo.color),
                const SizedBox(width: 8),
                Text(
                  t.rewards.nextLevel(level: nextLevelInfo.name),
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            LinearProgressIndicator(
              value: 1 - (daysToNext / (nextLevelInfo.minDays - _getLevelInfo(_currentLevel).minDays)),
              backgroundColor: Colors.grey.shade200,
              valueColor: AlwaysStoppedAnimation<Color>(nextLevelInfo.color),
              minHeight: 8,
            ),
            const SizedBox(height: 8),
            Text(
              t.rewards.daysToNextLevel(days: daysToNext),
              style: TextStyle(
                color: Colors.grey.shade600,
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStreakCalendar(Translations t) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              t.rewards.recentActivity,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            Wrap(
              spacing: 4,
              runSpacing: 4,
              children: _streakHistory.map((streak) {
                final isToday = DateTime.now().day == streak.date.day &&
                    DateTime.now().month == streak.date.month;
                return Container(
                  width: 36,
                  height: 36,
                  decoration: BoxDecoration(
                    color: streak.prayed
                        ? Colors.green
                        : Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(8),
                    border: isToday
                        ? Border.all(color: Colors.orange, width: 2)
                        : null,
                  ),
                  child: Center(
                    child: Text(
                      '${streak.date.day}',
                      style: TextStyle(
                        color: streak.prayed ? Colors.white : Colors.grey.shade600,
                        fontSize: 12,
                        fontWeight: isToday ? FontWeight.bold : null,
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Container(
                  width: 12,
                  height: 12,
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
                const SizedBox(width: 4),
                Text(t.rewards.prayed, style: const TextStyle(fontSize: 12)),
                const SizedBox(width: 16),
                Container(
                  width: 12,
                  height: 12,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
                const SizedBox(width: 4),
                Text(t.rewards.missed, style: const TextStyle(fontSize: 12)),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAllLevels(Translations t) {
    final levels = [
      RewardLevel.seeker,
      RewardLevel.disciple,
      RewardLevel.watchman,
      RewardLevel.intercessor,
      RewardLevel.warrior,
    ];

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              t.rewards.allLevels,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            ...levels.map((level) {
              final info = _getLevelInfo(level);
              final isCurrent = level == _currentLevel;
              final isUnlocked = _currentStreak >= info.minDays;

              return ListTile(
                leading: CircleAvatar(
                  backgroundColor: isUnlocked ? info.color : Colors.grey,
                  child: Icon(
                    info.icon,
                    color: Colors.white,
                    size: 20,
                  ),
                ),
                title: Text(
                  info.name,
                  style: TextStyle(
                    fontWeight: isCurrent ? FontWeight.bold : null,
                    color: isUnlocked ? null : Colors.grey,
                  ),
                ),
                subtitle: Text(
                  '${info.minDays}+ ${t.rewards.days}',
                  style: TextStyle(
                    color: isUnlocked ? null : Colors.grey,
                  ),
                ),
                trailing: isCurrent
                    ? Icon(Icons.star, color: Colors.amber)
                    : isUnlocked
                        ? Icon(Icons.check_circle, color: Colors.green)
                        : Icon(Icons.lock, color: Colors.grey),
              );
            }).toList(),
          ],
        ),
      ),
    );
  }
}
