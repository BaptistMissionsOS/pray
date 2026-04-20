import 'package:flutter/material.dart';

class DashboardLayout extends StatelessWidget {
  const DashboardLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard Layout'),
      ),
      body: const Center(
        child: Text('Dashboard Layout'),
      ),
    );
  }
}
