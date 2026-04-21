import 'package:flutter/material.dart';
import 'app/assets/i18n/strings.g.dart';
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
          ListTile(
            title: Text(
              t.settings.language,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.language),
            title: Text(t.settings.english),
            trailing: LocaleSettings.currentLocale == AppLocale.en
                ? const Icon(Icons.check, color: Colors.green)
                : null,
            onTap: () {
              _setLocale(AppLocale.en);
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
            },
          ),
        ],
      ),
    );
  }
}
