import 'package:flutter/material.dart';
import '../../app/i18n/strings.g.dart';

class JournalOrganize extends StatelessWidget {
  const JournalOrganize({super.key});

  @override
  Widget build(BuildContext context) {
    final t = Translations.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(t.titles.journalOrganize),
      ),
      body: Center(
        child: Text(t.titles.journalOrganize),
      ),
    );
  }
}
