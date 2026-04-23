import 'package:flutter/material.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';
import 'app/i18n/strings.g.dart';
import 'core/db/db_provider.dart';
import 'main.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  void _setLocale(AppLocale locale) {
    LocaleSettings.setLocale(locale);
    DatabaseProvider.instance.setPreference(localePrefKey, locale.name);
  }

  @override
  Widget build(BuildContext context) {
    final t = Translations.of(context);

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
            subtitle: Text(t.settings.options.themeSubtitle),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {},
          ),
          const Divider(),
          _buildSectionHeader(context, t.settings.sections.dashboard),
          ListTile(
            leading: const Icon(Icons.dashboard),
            title: Text(t.settings.options.defaultView),
            subtitle: Text(t.settings.options.defaultViewSubtitle),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {},
          ),
          SwitchListTile(
            secondary: const Icon(Icons.notifications_active),
            title: Text(t.settings.options.dailyReminder),
            subtitle: Text(t.settings.options.dailyReminderSubtitle),
            value: false,
            onChanged: (value) {},
          ),
          const Divider(),
          _buildSectionHeader(context, t.settings.sections.prayers),
          ListTile(
            leading: const Icon(Symbols.folded_hands),
            title: Text(t.settings.options.defaultFilter),
            subtitle: Text(t.settings.options.defaultFilterSubtitle),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {},
          ),
          SwitchListTile(
            secondary: const Icon(Icons.archive),
            title: Text(t.settings.options.autoArchive),
            subtitle: Text(t.settings.options.autoArchiveSubtitle),
            value: false,
            onChanged: (value) {},
          ),
          const Divider(),
          _buildSectionHeader(context, t.settings.sections.journal),
          ListTile(
            leading: const Icon(Icons.book),
            title: Text(t.journal.categories.defaultCategory),
            subtitle: Text(t.journal.categories.uncategorized),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {},
          ),
          SwitchListTile(
            secondary: const Icon(Icons.lock),
            title: Text(t.settings.options.privateMode),
            subtitle: Text(t.settings.options.privateModeSubtitle),
            value: false,
            onChanged: (value) {},
          ),
          const Divider(),
          _buildSectionHeader(context, t.settings.sections.data),
          ListTile(
            leading: const Icon(Icons.backup),
            title: Text(t.settings.options.backupRestore),
            subtitle: Text(t.settings.options.backupRestoreSubtitle),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {},
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
}
