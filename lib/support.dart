import 'package:flutter/material.dart';
import 'app/i18n/strings.g.dart';

class Support extends StatelessWidget {
  const Support({super.key});

  @override
  Widget build(BuildContext context) {
    final t = Translations.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(t.pages.support),
      ),
      body: Center(
        child: Text(t.pages.support),
      ),
    );
  }
}
