import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';
import 'package:slang_flutter/slang_flutter.dart';
import 'app/assets/i18n/strings.g.dart';
import 'core/db/db_provider.dart';
import 'features/home/dashboard.dart';
import 'features/home/dashboard.add.dart';
import 'features/home/dashboard.edit.dart';
import 'features/home/dashboard.layout.dart';
import 'features/prayers/prayers.dart';
import 'features/prayers/prayers.add.dart';
import 'features/prayers/prayers.edit.dart';
import 'features/prayers/prayers.share.dart';
import 'features/journal/journal.dart';
import 'features/journal/journal.add.dart';
import 'features/journal/journal.edit.dart';
import 'features/journal/journal.organize.dart';
import 'about.dart';
import 'settings.dart';
import 'support.dart';

const String localePrefKey = 'app_locale';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final db = DatabaseProvider.instance;
  final savedLocale = await db.getPreference(localePrefKey);

  if (savedLocale != null) {
    final locale = AppLocale.values.firstWhere(
      (l) => l.name == savedLocale,
      orElse: () => AppLocale.en,
    );
    LocaleSettings.setLocale(locale);
  } else {
    LocaleSettings.useDeviceLocale();
  }

  runApp(
    TranslationProvider(
      child: const LocaleAwareApp(),
    ),
  );
}

class LocaleAwareApp extends StatefulWidget {
  const LocaleAwareApp({super.key});

  @override
  State<LocaleAwareApp> createState() => _LocaleAwareAppState();
}

class _LocaleAwareAppState extends State<LocaleAwareApp> {
  Stream<AppLocale>? _stream;

  @override
  void initState() {
    super.initState();
    _stream = LocaleSettings.getLocaleStream();
    _stream!.listen((_) {
      if (mounted) {
        setState(() {});
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return PrayerApp(key: ValueKey(LocaleSettings.currentLocale));
  }
}

class PrayerApp extends StatelessWidget {
  const PrayerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: t.appTitle,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      locale: LocaleSettings.currentLocale.flutterLocale,
      supportedLocales: AppLocaleUtils.supportedLocales,
      localizationsDelegates: GlobalMaterialLocalizations.delegates,
      home: const MainNavigation(),
    );
  }
}

class MainNavigation extends StatefulWidget {
  const MainNavigation({super.key});

  @override
  State<MainNavigation> createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  int _currentIndex = 0;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  final List<Widget> _pages = const [
    Dashboard(),
    Prayers(),
    Journal(),
  ];

  void _onTap(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  void _openMenu() {
    _scaffoldKey.currentState?.openEndDrawer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        actions: [
          IconButton(
            icon: const Icon(Icons.menu),
            onPressed: _openMenu,
          ),
        ],
      ),
      endDrawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(
                color: Color(0xFF8B0000),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    t.drawer.menu,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                    ),
                  ),
                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.info, color: Colors.white),
                        onPressed: () {
                          Navigator.pop(context);
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const About()),
                          );
                        },
                      ),
                      IconButton(
                        icon: const Icon(Icons.settings, color: Colors.white),
                        onPressed: () {
                          Navigator.pop(context);
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const Settings()),
                          );
                        },
                      ),
                      IconButton(
                        icon: const Icon(Icons.help, color: Colors.white),
                        onPressed: () {
                          Navigator.pop(context);
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const Support()),
                          );
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
            ExpansionTile(
              leading: const Icon(Icons.home),
              title: Text(t.drawer.categories.dashboard),
              children: [
                ListTile(
                  leading: const Icon(Icons.add),
                  title: Text(t.drawer.actions.add),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const DashboardAdd()),
                    );
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.edit),
                  title: Text(t.drawer.actions.edit),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const DashboardEdit()),
                    );
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.grid_view),
                  title: Text(t.drawer.actions.layout),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const DashboardLayout()),
                    );
                  },
                ),
              ],
            ),
            ExpansionTile(
              leading: const Icon(Symbols.folded_hands),
              title: Text(t.drawer.categories.prayers),
              children: [
                ListTile(
                  leading: const Icon(Icons.add),
                  title: Text(t.drawer.actions.add),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const PrayersAdd()),
                    );
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.edit),
                  title: Text(t.drawer.actions.edit),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const PrayersEdit()),
                    );
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.share),
                  title: Text(t.drawer.actions.share),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const PrayersShare()),
                    );
                  },
                ),
              ],
            ),
            ExpansionTile(
              leading: const Icon(Icons.book),
              title: Text(t.drawer.categories.journal),
              children: [
                ListTile(
                  leading: const Icon(Icons.add),
                  title: Text(t.drawer.actions.add),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const JournalAdd()),
                    );
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.edit),
                  title: Text(t.drawer.actions.edit),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const JournalEdit()),
                    );
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.folder),
                  title: Text(t.drawer.actions.organize),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const JournalOrganize()),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onTap,
        items: [
          BottomNavigationBarItem(
            icon: const Icon(Icons.home),
            label: t.bottomNav.home,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Symbols.folded_hands),
            label: t.bottomNav.prayers,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.book),
            label: t.bottomNav.journal,
          ),
        ],
      ),
    );
  }
}
