import 'package:flutter/material.dart';
import '../../app/assets/i18n/strings.g.dart';

class Prayers extends StatelessWidget {
  const Prayers({super.key});

  @override
  Widget build(BuildContext context) {
    final t = Translations.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(t.drawer.categories.prayers),
      ),
      body: Center(
        child: Text(t.content.prayers),
      ),
    );
  }
}
