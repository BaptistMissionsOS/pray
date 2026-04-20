import 'package:flutter/material.dart';
import '../../app/assets/i18n/strings.g.dart';

class DashboardLayout extends StatelessWidget {
  const DashboardLayout({super.key});

  @override
  Widget build(BuildContext context) {
    final t = Translations.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(t.titles.dashboardLayout),
      ),
      body: Center(
        child: Text(t.titles.dashboardLayout),
      ),
    );
  }
}
