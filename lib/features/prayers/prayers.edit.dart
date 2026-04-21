import 'package:flutter/material.dart';
import '../../app/i18n/strings.g.dart';

class PrayersEdit extends StatelessWidget {
  const PrayersEdit({super.key});

  @override
  Widget build(BuildContext context) {
    final t = Translations.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(t.titles.prayersEdit),
      ),
      body: Center(
        child: Text(t.titles.prayersEdit),
      ),
    );
  }
}
