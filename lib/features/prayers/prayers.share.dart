import 'package:flutter/material.dart';
import '../../app/i18n/strings.g.dart';

class PrayersShare extends StatelessWidget {
  const PrayersShare({super.key});

  @override
  Widget build(BuildContext context) {
    final t = Translations.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(t.titles.prayersShare),
      ),
      body: Center(
        child: Text(t.titles.prayersShare),
      ),
    );
  }
}
