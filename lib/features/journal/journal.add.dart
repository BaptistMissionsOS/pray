import 'package:flutter/material.dart';
import '../../app/i18n/strings.g.dart';

class JournalAdd extends StatelessWidget {
  const JournalAdd({super.key});

  @override
  Widget build(BuildContext context) {
    final t = Translations.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(t.titles.journalAdd),
      ),
      body: Center(
        child: Text(t.titles.journalAdd),
      ),
    );
  }
}
