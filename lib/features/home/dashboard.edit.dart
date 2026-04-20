import 'package:flutter/material.dart';
import '../../app/assets/i18n/strings.g.dart';

class DashboardEdit extends StatelessWidget {
  const DashboardEdit({super.key});

  @override
  Widget build(BuildContext context) {
    final t = Translations.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(t.titles.dashboardEdit),
      ),
      body: Center(
        child: Text(t.titles.dashboardEdit),
      ),
    );
  }
}
