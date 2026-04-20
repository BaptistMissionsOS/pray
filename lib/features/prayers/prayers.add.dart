import 'package:flutter/material.dart';
import '../../app/assets/i18n/strings.g.dart';

class PrayersAdd extends StatelessWidget {
  const PrayersAdd({super.key});

  @override
  Widget build(BuildContext context) {
    final t = Translations.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(t.titles.prayersAdd),
      ),
      body: Center(
        child: Text(t.titles.prayersAdd),
      ),
    );
  }
}
