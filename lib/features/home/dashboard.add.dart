import 'package:flutter/material.dart';
import '../../app/i18n/strings.g.dart';

class DashboardAdd extends StatelessWidget {
  const DashboardAdd({super.key});

  @override
  Widget build(BuildContext context) {
    final t = Translations.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(t.titles.dashboardAdd),
      ),
      body: Center(
        child: Text(t.titles.dashboardAdd),
      ),
    );
  }
}
