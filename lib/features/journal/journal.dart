import 'package:flutter/material.dart';
import '../../app/i18n/strings.g.dart';

class Journal extends StatelessWidget {
  const Journal({super.key});

  @override
  Widget build(BuildContext context) {
    final t = Translations.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(t.drawer.categories.journal),
      ),
      body: Center(
        child: Text(t.content.journal),
      ),
    );
  }
}
