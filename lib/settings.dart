import 'package:flutter/material.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';
import 'app/i18n/strings.g.dart';
import 'core/db/db_provider.dart';
import 'main.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  // Preference keys
  static const String _themeKey = 'theme';
  static const String _defaultViewKey = 'default_view';
  static const String _dailyReminderKey = 'daily_reminder';
  static const String _defaultFilterKey = 'default_filter';
  static const String _autoArchiveKey = 'auto_archive';
  static const String _defaultCategoryKey = 'default_category';
  static const String _privateModeKey = 'private_mode';

  // State
  String _theme = 'system';
  String _defaultView = 'dashboard';
  bool _dailyReminder = false;
  String _defaultFilter = 'all';
  bool _autoArchive = false;
  String _defaultCategory = 'Daily Devotion';
  bool _privateMode = false;
  bool _isLoading = true;

  final List<String> _themes = ['light', 'dark', 'system'];
  final List<String> _views = ['dashboard', 'prayers', 'journal'];
  final List<String> _filters = ['all', 'active', 'answered', 'archived'];
  final List<String> _categories = [
    'Answered Prayers',
    'Daily Devotion',
    'Health',
    'Missions',
    'Family',
    'Spiritual Growth',
    'Other',
  ];

  @override
  void initState() {
    super.initState();
    _loadPreferences();
  }

  Future<void> _loadPreferences() async {
    final db = DatabaseProvider.instance;
    final theme = await db.getPreference(_themeKey);
    final view = await db.getPreference(_defaultViewKey);
    final reminder = await db.getPreference(_dailyReminderKey);
    final filter = await db.getPreference(_defaultFilterKey);
    final archive = await db.getPreference(_autoArchiveKey);
    final category = await db.getPreference(_defaultCategoryKey);
    final private = await db.getPreference(_privateModeKey);

    if (mounted) {
      setState(() {
        _theme = theme ?? 'system';
        _defaultView = view ?? 'dashboard';
        _dailyReminder = reminder == 'true';
        _defaultFilter = filter ?? 'all';
        _autoArchive = archive == 'true';
        _defaultCategory = category ?? 'Daily Devotion';
        _privateMode = private == 'true';
        _isLoading = false;
      });
    }
  }

  Future<void> _setPreference(String key, String value) async {
    await DatabaseProvider.instance.setPreference(key, value);
  }

  void _setLocale(AppLocale locale) {
    LocaleSettings.setLocale(locale);
    DatabaseProvider.instance.setPreference(localePrefKey, locale.name);
  }

  String _getThemeLabel(String theme, Translations t) {
    switch (theme) {
      case 'light':
        return t.settings.options.themeLight;
      case 'dark':
        return t.settings.options.themeDark;
      default:
        return t.settings.options.themeSystem;
    }
  }

  String _getViewLabel(String view) {
    switch (view) {
      case 'dashboard':
        return 'Dashboard';
      case 'prayers':
        return 'Prayers';
      case 'journal':
        return 'Journal';
      default:
        return 'Dashboard';
    }
  }

  String _getFilterLabel(String filter) {
    switch (filter) {
      case 'all':
        return 'All Prayers';
      case 'active':
        return 'Active Only';
      case 'answered':
        return 'Answered';
      case 'archived':
        return 'Archived';
      default:
        return 'All Prayers';
    }
  }

  void _showThemeDialog(BuildContext context, Translations t) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(t.settings.options.theme),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: _themes.map((theme) => ListTile(
            title: Text(_getThemeLabel(theme, t)),
            trailing: _theme == theme
                ? const Icon(Icons.check, color: Colors.green)
                : null,
            onTap: () async {
              await _setPreference(_themeKey, theme);
              setState(() => _theme = theme);
              if (mounted) Navigator.pop(context);
            },
          )).toList(),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(t.common.cancel),
          ),
        ],
      ),
    );
  }

  void _showDefaultViewDialog(BuildContext context, Translations t) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(t.settings.options.defaultView),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: _views.map((view) => ListTile(
            title: Text(_getViewLabel(view)),
            trailing: _defaultView == view
                ? const Icon(Icons.check, color: Colors.green)
                : null,
            onTap: () async {
              await _setPreference(_defaultViewKey, view);
              setState(() => _defaultView = view);
              if (mounted) Navigator.pop(context);
            },
          )).toList(),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(t.common.cancel),
          ),
        ],
      ),
    );
  }

  void _showDefaultFilterDialog(BuildContext context, Translations t) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(t.settings.options.defaultFilter),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: _filters.map((filter) => ListTile(
            title: Text(_getFilterLabel(filter)),
            trailing: _defaultFilter == filter
                ? const Icon(Icons.check, color: Colors.green)
                : null,
            onTap: () async {
              await _setPreference(_defaultFilterKey, filter);
              setState(() => _defaultFilter = filter);
              if (mounted) Navigator.pop(context);
            },
          )).toList(),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(t.common.cancel),
          ),
        ],
      ),
    );
  }

  void _showDefaultCategoryDialog(BuildContext context, Translations t) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(t.journal.categories.defaultCategory),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: _categories.map((category) => ListTile(
            title: Text(category),
            trailing: _defaultCategory == category
                ? const Icon(Icons.check, color: Colors.green)
                : null,
            onTap: () async {
              await _setPreference(_defaultCategoryKey, category);
              setState(() => _defaultCategory = category);
              if (mounted) Navigator.pop(context);
            },
          )).toList(),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(t.common.cancel),
          ),
        ],
      ),
    );
  }

  void _showBackupRestoreDialog(BuildContext context, Translations t) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(t.settings.options.backupRestore),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(Icons.upload),
              title: const Text('Export Data'),
              subtitle: const Text('Save to file'),
              onTap: () {
                Navigator.pop(context);
                _showComingSoonSnackBar(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.download),
              title: const Text('Import Data'),
              subtitle: const Text('Load from file'),
              onTap: () {
                Navigator.pop(context);
                _showComingSoonSnackBar(context);
              },
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(t.common.cancel),
          ),
        ],
      ),
    );
  }

  void _showComingSoonSnackBar(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Coming soon!')),
    );
  }

  void _showLanguageDialog(BuildContext context, Translations t) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(t.settings.language),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(Icons.language),
              title: Text(t.settings.english),
              trailing: LocaleSettings.currentLocale == AppLocale.en
                  ? const Icon(Icons.check, color: Colors.green)
                  : null,
              onTap: () {
                _setLocale(AppLocale.en);
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.language),
              title: Text(t.settings.spanish),
              trailing: LocaleSettings.currentLocale == AppLocale.es
                  ? const Icon(Icons.check, color: Colors.green)
                  : null,
              onTap: () {
                _setLocale(AppLocale.es);
                Navigator.pop(context);
              },
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(t.common.cancel),
          ),
        ],
      ),
    );
  }

  void _showClearDataDialog(BuildContext context) {
    final t = Translations.of(context);
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(t.common.clearConfirmTitle),
        content: Text(t.settings.options.clearDataConfirm),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(t.common.cancel),
          ),
          TextButton(
            onPressed: () async {
              Navigator.pop(context);
              await DatabaseProvider.instance.clearAllData();
              if (context.mounted) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(t.common.dataCleared)),
              );
              }
            },
            style: TextButton.styleFrom(foregroundColor: Colors.red),
            child: Text(t.common.delete),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(BuildContext context, String title) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
      child: Text(
        title,
        style: Theme.of(context).textTheme.titleSmall?.copyWith(
              color: Theme.of(context).colorScheme.primary,
              fontWeight: FontWeight.bold,
            ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final t = Translations.of(context);

    if (_isLoading) {
      return Scaffold(
        appBar: AppBar(title: Text(t.pages.settings)),
        body: const Center(child: CircularProgressIndicator()),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(t.pages.settings),
      ),
      body: ListView(
        children: [
          _buildSectionHeader(context, t.settings.sections.appearance),
          ListTile(
            leading: const Icon(Icons.language),
            title: Text(t.settings.language),
            subtitle: Text(LocaleSettings.currentLocale == AppLocale.en ? t.settings.english : t.settings.spanish),
            trailing: const Icon(Icons.chevron_right),
            onTap: () => _showLanguageDialog(context, t),
          ),
          ListTile(
            leading: const Icon(Icons.palette),
            title: Text(t.settings.options.theme),
            subtitle: Text(_getThemeLabel(_theme, t)),
            trailing: const Icon(Icons.chevron_right),
            onTap: () => _showThemeDialog(context, t),
          ),
          const Divider(),
          _buildSectionHeader(context, t.settings.sections.dashboard),
          ListTile(
            leading: const Icon(Icons.dashboard),
            title: Text(t.settings.options.defaultView),
            subtitle: Text(_getViewLabel(_defaultView)),
            trailing: const Icon(Icons.chevron_right),
            onTap: () => _showDefaultViewDialog(context, t),
          ),
          SwitchListTile(
            secondary: const Icon(Icons.notifications_active),
            title: Text(t.settings.options.dailyReminder),
            subtitle: Text(t.settings.options.dailyReminderSubtitle),
            value: _dailyReminder,
            onChanged: (value) async {
              await _setPreference(_dailyReminderKey, value.toString());
              setState(() => _dailyReminder = value);
            },
          ),
          const Divider(),
          _buildSectionHeader(context, t.settings.sections.prayers),
          ListTile(
            leading: const Icon(Symbols.folded_hands),
            title: Text(t.settings.options.defaultFilter),
            subtitle: Text(_getFilterLabel(_defaultFilter)),
            trailing: const Icon(Icons.chevron_right),
            onTap: () => _showDefaultFilterDialog(context, t),
          ),
          SwitchListTile(
            secondary: const Icon(Icons.archive),
            title: Text(t.settings.options.autoArchive),
            subtitle: Text(t.settings.options.autoArchiveSubtitle),
            value: _autoArchive,
            onChanged: (value) async {
              await _setPreference(_autoArchiveKey, value.toString());
              setState(() => _autoArchive = value);
            },
          ),
          const Divider(),
          _buildSectionHeader(context, t.settings.sections.journal),
          ListTile(
            leading: const Icon(Icons.book),
            title: Text(t.journal.categories.defaultCategory),
            subtitle: Text(_defaultCategory),
            trailing: const Icon(Icons.chevron_right),
            onTap: () => _showDefaultCategoryDialog(context, t),
          ),
          SwitchListTile(
            secondary: const Icon(Icons.lock),
            title: Text(t.settings.options.privateMode),
            subtitle: Text(t.settings.options.privateModeSubtitle),
            value: _privateMode,
            onChanged: (value) async {
              await _setPreference(_privateModeKey, value.toString());
              setState(() => _privateMode = value);
            },
          ),
          const Divider(),
          _buildSectionHeader(context, t.settings.sections.data),
          ListTile(
            leading: const Icon(Icons.backup),
            title: Text(t.settings.options.backupRestore),
            subtitle: Text(t.settings.options.backupRestoreSubtitle),
            trailing: const Icon(Icons.chevron_right),
            onTap: () => _showBackupRestoreDialog(context, t),
          ),
          ListTile(
            leading: const Icon(Icons.delete_outline, color: Colors.red),
            title: Text(t.settings.options.clearData, style: const TextStyle(color: Colors.red)),
            onTap: () => _showClearDataDialog(context),
          ),
          const SizedBox(height: 32),
          Center(
            child: Text(
              '${t.about.version} 1.0.0',
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                  ),
            ),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}

