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
          _buildSectionHeader(context, 'Appearance'),
          ListTile(
            leading: const Icon(Icons.language),
            title: Text(t.settings.language),
            subtitle: Text(LocaleSettings.currentLocale == AppLocale.en ? 'English' : 'Español'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () => _showLanguageDialog(context, t),
          ),
          ListTile(
            leading: const Icon(Icons.palette),
            title: const Text('Theme'),
            subtitle: const Text('System default'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {},
          ),
          const Divider(),
          _buildSectionHeader(context, 'Dashboard'),
          ListTile(
            leading: const Icon(Icons.dashboard),
            title: const Text('Default View'),
            subtitle: const Text('Show all statistics'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {},
          ),
          SwitchListTile(
            secondary: const Icon(Icons.notifications_active),
            title: const Text('Daily Reminder'),
            subtitle: const Text('Remind me to pray daily'),
            value: false,
            onChanged: (value) {},
          ),
          const Divider(),
          _buildSectionHeader(context, 'Prayers'),
          ListTile(
            leading: const Icon(Symbols.folded_hands),
            title: const Text('Default Filter'),
            subtitle: const Text('Show active prayers'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {},
          ),
          SwitchListTile(
            secondary: const Icon(Icons.archive),
            title: const Text('Auto-archive Answered'),
            subtitle: const Text('Move answered prayers to archive after 7 days'),
            value: false,
            onChanged: (value) {},
          ),
          const Divider(),
          _buildSectionHeader(context, 'Journal'),
          ListTile(
            leading: const Icon(Icons.book),
            title: const Text('Default Category'),
            subtitle: const Text('Uncategorized'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {},
          ),
          SwitchListTile(
            secondary: const Icon(Icons.lock),
            title: const Text('Private Mode'),
            subtitle: const Text('Require authentication to view journal'),
            value: false,
            onChanged: (value) {},
          ),
          const Divider(),
          _buildSectionHeader(context, 'Data'),
          ListTile(
            leading: const Icon(Icons.backup),
            title: const Text('Backup & Restore'),
            subtitle: const Text('Export or import your data'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.delete_outline, color: Colors.red),
            title: const Text('Clear All Data', style: TextStyle(color: Colors.red)),
            onTap: () => _showClearDataDialog(context),
          ),
          const SizedBox(height: 32),
          Center(
            child: Text(
              'Version 1.0.0',
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
            child: const Text('Cancel'),
          ),
        ],
      ),
    );
  }

  void _showClearDataDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Clear All Data?'),
        content: const Text('This will permanently delete all your prayers and journal entries. This action cannot be undone.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            style: TextButton.styleFrom(foregroundColor: Colors.red),
            child: const Text('Clear'),
          ),
        ],
      ),
    );
  }
}
