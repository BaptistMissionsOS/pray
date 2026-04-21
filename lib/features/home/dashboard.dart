import 'package:flutter/material.dart';
import '../../app/i18n/strings.g.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    final t = Translations.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(t.titles.home),
      ),
      body: Center(
        child: Text(t.content.dashboard),
      ),
    );
  }
}
