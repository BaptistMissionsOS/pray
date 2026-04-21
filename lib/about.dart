import 'package:flutter/material.dart';
import 'app/i18n/strings.g.dart';

class About extends StatelessWidget {
  const About({super.key});

  @override
  Widget build(BuildContext context) {
    final t = Translations.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(t.pages.about),
      ),
      body: Center(
        child: Text(t.pages.about),
      ),
    );
  }
}
