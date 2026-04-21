import 'package:flutter/material.dart';
import '../../app/i18n/strings.g.dart';

class JournalEdit extends StatelessWidget {
  const JournalEdit({super.key});

  @override
  Widget build(BuildContext context) {
    final t = Translations.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(t.titles.journalEdit),
      ),
      body: Center(
        child: Text(t.titles.journalEdit),
      ),
    );
  }
}
