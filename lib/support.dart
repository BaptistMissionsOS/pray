import 'package:flutter/material.dart';
import 'app/i18n/strings.g.dart';

class Support extends StatelessWidget {
  const Support({super.key});

  final List<Map<String, dynamic>> supportChannels = const [
    {
      'name': 'Email',
      'icon': Icons.email,
      'url': 'mailto:baptist.missions.os@gmail.com',
      'color': Colors.red,
    },
    {
      'name': 'Discord',
      'icon': Icons.chat,
      'url': 'https://discord.gg/mhK8XGZtgV',
      'color': Color(0xFF5865F2),
    },
    {
      'name': 'Facebook',
      'icon': Icons.facebook,
      'url': 'https://www.facebook.com/profile.php?id=61580588046678',
      'color': Color(0xFF1877F2),
    },
    {
      'name': 'Gab',
      'icon': Icons.forum,
      'url': 'https://gab.com/groups/87068',
      'color': Color(0xFF00D26A),
    },
    {
      'name': 'GitHub',
      'icon': Icons.code,
      'url': 'https://github.com/BaptistMissionsOS',
      'color': Colors.black,
    },
    {
      'name': 'Matrix',
      'icon': Icons.grid_view,
      'url': 'https://matrix.to/#/#BaptistMissionsOS:matrix.org',
      'color': Color(0xFF0DBD8B),
    },
    {
      'name': 'IRC Libera.Chat',
      'icon': Icons.terminal,
      'url': 'https://web.libera.chat/',
      'color': Color(0xFFEE6600),
    },
  ];

  @override
  Widget build(BuildContext context) {
    final t = Translations.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(t.pages.support),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    Icon(
                      Icons.help_outline,
                      size: 48,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Need Help?',
                      style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'If you need assistance with Baptist Missions OS, please reach out through our support channels:',
                      style: Theme.of(context).textTheme.bodyMedium,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),
            Text(
              'Support Channels',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 8),
            ...supportChannels.map((channel) => Card(
                  margin: const EdgeInsets.only(bottom: 8),
                  child: ListTile(
                    leading: Icon(
                      channel['icon'] as IconData,
                      color: channel['color'] as Color,
                    ),
                    title: Text(channel['name'] as String),
                    subtitle: Text(
                      channel['url'] as String,
                      style: const TextStyle(fontSize: 12),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    trailing: const Icon(Icons.open_in_new, size: 18),
                    onTap: () {},
                  ),
                )),
            const SizedBox(height: 24),
            Card(
              color: Theme.of(context).colorScheme.primaryContainer,
              child: const Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.info_outline),
                        SizedBox(width: 8),
                        Text(
                          'Quick Tips',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    SizedBox(height: 8),
                    Text('• Check the About page for app information'),
                    Text('• Visit our GitHub for technical issues'),
                    Text('• Join Discord for community support'),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            Center(
              child: Text(
                '© 2026 Baptist Missions OS Project',
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
