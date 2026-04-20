import 'package:flutter/material.dart';
import 'app/assets/i18n/strings.g.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

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
              LocaleSettings.setLocale(AppLocale.en);
            },
          ),
          ListTile(
            leading: const Icon(Icons.language),
            title: Text(t.settings.spanish),
            trailing: LocaleSettings.currentLocale == AppLocale.es
                ? const Icon(Icons.check, color: Colors.green)
                : null,
            onTap: () {
              LocaleSettings.setLocale(AppLocale.es);
            },
          ),
        ],
      ),
    );
  }
}
