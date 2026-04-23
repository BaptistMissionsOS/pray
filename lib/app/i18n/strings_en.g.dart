///
/// Generated file. Do not edit.
///
// coverage:ignore-file
// ignore_for_file: type=lint, unused_import
// dart format off

part of 'strings.g.dart';

// Path: <root>
typedef TranslationsEn = Translations; // ignore: unused_element
class Translations with BaseTranslations<AppLocale, Translations> {
	/// Returns the current translations of the given [context].
	///
	/// Usage:
	/// final t = Translations.of(context);
	static Translations of(BuildContext context) => InheritedLocaleData.of<AppLocale, Translations>(context).translations;

	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	Translations({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: AppLocale.en,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <en>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	dynamic operator[](String key) => $meta.getTranslation(key);

	late final Translations _root = this; // ignore: unused_field

	Translations $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => Translations(meta: meta ?? this.$meta);

	// Translations

	/// en: 'Prayer App'
	String get appTitle => 'Prayer App';

	late final TranslationsBottomNavEn bottomNav = TranslationsBottomNavEn.internal(_root);
	late final TranslationsDrawerEn drawer = TranslationsDrawerEn.internal(_root);
	late final TranslationsPagesEn pages = TranslationsPagesEn.internal(_root);
	late final TranslationsSettingsEn settings = TranslationsSettingsEn.internal(_root);
	late final TranslationsTitlesEn titles = TranslationsTitlesEn.internal(_root);
	late final TranslationsContentEn content = TranslationsContentEn.internal(_root);
	late final TranslationsRemindersEn reminders = TranslationsRemindersEn.internal(_root);
	late final TranslationsAboutEn about = TranslationsAboutEn.internal(_root);
	late final TranslationsSupportEn support = TranslationsSupportEn.internal(_root);
	late final TranslationsDashboardEn dashboard = TranslationsDashboardEn.internal(_root);
	late final TranslationsPrayersEn prayers = TranslationsPrayersEn.internal(_root);
	late final TranslationsJournalEn journal = TranslationsJournalEn.internal(_root);
	late final TranslationsCommonEn common = TranslationsCommonEn.internal(_root);
	late final TranslationsHintsEn hints = TranslationsHintsEn.internal(_root);
	late final TranslationsMoodsEn moods = TranslationsMoodsEn.internal(_root);
	late final TranslationsStatusEn status = TranslationsStatusEn.internal(_root);
}

// Path: bottomNav
class TranslationsBottomNavEn {
	TranslationsBottomNavEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Home'
	String get home => 'Home';

	/// en: 'Prayers'
	String get prayers => 'Prayers';

	/// en: 'Journal'
	String get journal => 'Journal';
}

// Path: drawer
class TranslationsDrawerEn {
	TranslationsDrawerEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Menu'
	String get menu => 'Menu';

	late final TranslationsDrawerCategoriesEn categories = TranslationsDrawerCategoriesEn.internal(_root);
	late final TranslationsDrawerActionsEn actions = TranslationsDrawerActionsEn.internal(_root);
}

// Path: pages
class TranslationsPagesEn {
	TranslationsPagesEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'About'
	String get about => 'About';

	/// en: 'Settings'
	String get settings => 'Settings';

	/// en: 'Support'
	String get support => 'Support';
}

// Path: settings
class TranslationsSettingsEn {
	TranslationsSettingsEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Language'
	String get language => 'Language';

	/// en: 'English'
	String get english => 'English';

	/// en: 'Spanish'
	String get spanish => 'Spanish';

	late final TranslationsSettingsSectionsEn sections = TranslationsSettingsSectionsEn.internal(_root);
	late final TranslationsSettingsOptionsEn options = TranslationsSettingsOptionsEn.internal(_root);
}

// Path: titles
class TranslationsTitlesEn {
	TranslationsTitlesEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Home'
	String get home => 'Home';

	/// en: 'Add Dashboard Block'
	String get dashboardAdd => 'Add Dashboard Block';

	/// en: 'Edit Dashboard Block'
	String get dashboardEdit => 'Edit Dashboard Block';

	/// en: 'Arrange Dashboard'
	String get dashboardLayout => 'Arrange Dashboard';

	/// en: 'Add Prayer'
	String get prayersAdd => 'Add Prayer';

	/// en: 'Edit Prayer'
	String get prayersEdit => 'Edit Prayer';

	/// en: 'Share Prayers'
	String get prayersShare => 'Share Prayers';

	/// en: 'Add Journal Entry'
	String get journalAdd => 'Add Journal Entry';

	/// en: 'Edit Journal Entry'
	String get journalEdit => 'Edit Journal Entry';

	/// en: 'Organize Journal'
	String get journalOrganize => 'Organize Journal';
}

// Path: content
class TranslationsContentEn {
	TranslationsContentEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Dashboard'
	String get dashboard => 'Dashboard';

	/// en: 'Prayers'
	String get prayers => 'Prayers';

	/// en: 'Journal'
	String get journal => 'Journal';
}

// Path: reminders
class TranslationsRemindersEn {
	TranslationsRemindersEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Today'
	String get today => 'Today';

	/// en: 'Refresh'
	String get refresh => 'Refresh';

	/// en: 'Week of'
	String get weekOf => 'Week of';

	late final TranslationsRemindersViewsEn views = TranslationsRemindersViewsEn.internal(_root);
	late final TranslationsRemindersFiltersEn filters = TranslationsRemindersFiltersEn.internal(_root);
	late final TranslationsRemindersWeekdaysEn weekdays = TranslationsRemindersWeekdaysEn.internal(_root);
	late final TranslationsRemindersMonthsEn months = TranslationsRemindersMonthsEn.internal(_root);

	/// en: '{count} items'
	String items({required Object count}) => '${count} items';

	/// en: 'No reminders'
	String get noReminders => 'No reminders';

	/// en: 'No reminders for this day'
	String get noRemindersForDay => 'No reminders for this day';
}

// Path: about
class TranslationsAboutEn {
	TranslationsAboutEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'A Flutter Prayer Journal App'
	String get title => 'A Flutter Prayer Journal App';

	/// en: 'by Baptist Missions OS'
	String get by => 'by Baptist Missions OS';

	/// en: 'A personal prayer journal to track your prayers, see answered prayers, and grow in your faith journey.'
	String get description => 'A personal prayer journal to track your prayers, see answered prayers, and grow in your faith journey.';

	/// en: 'Version'
	String get version => 'Version';

	/// en: 'Open Source'
	String get openSource => 'Open Source';

	/// en: '© 2026 Baptist Missions OS'
	String get copyright => '© 2026 Baptist Missions OS';
}

// Path: support
class TranslationsSupportEn {
	TranslationsSupportEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Need Help?'
	String get title => 'Need Help?';

	/// en: 'If you need assistance with Baptist Missions OS, please reach out through our support channels:'
	String get description => 'If you need assistance with Baptist Missions OS, please reach out through our support channels:';

	late final TranslationsSupportChannelsEn channels = TranslationsSupportChannelsEn.internal(_root);

	/// en: 'Quick Tips'
	String get quickTips => 'Quick Tips';
}

// Path: dashboard
class TranslationsDashboardEn {
	TranslationsDashboardEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	late final TranslationsDashboardStatsEn stats = TranslationsDashboardStatsEn.internal(_root);

	/// en: 'No statistics yet. Add blocks to see your prayer stats.'
	String get empty => 'No statistics yet. Add blocks to see your prayer stats.';

	/// en: 'Quick Actions'
	String get quickActions => 'Quick Actions';

	/// en: 'I Prayed Today'
	String get iPrayedToday => 'I Prayed Today';

	late final TranslationsDashboardAddEn add = TranslationsDashboardAddEn.internal(_root);
	late final TranslationsDashboardEditEn edit = TranslationsDashboardEditEn.internal(_root);
	late final TranslationsDashboardLayoutEn layout = TranslationsDashboardLayoutEn.internal(_root);
	late final TranslationsDashboardBlockTypesEn blockTypes = TranslationsDashboardBlockTypesEn.internal(_root);
}

// Path: prayers
class TranslationsPrayersEn {
	TranslationsPrayersEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	late final TranslationsPrayersTabsEn tabs = TranslationsPrayersTabsEn.internal(_root);

	/// en: 'New Prayer'
	String get newPrayer => 'New Prayer';

	/// en: 'Add to Journal'
	String get addToJournal => 'Add to Journal';

	/// en: 'Mark Answered'
	String get markAnswered => 'Mark Answered';

	late final TranslationsPrayersEmptyEn empty = TranslationsPrayersEmptyEn.internal(_root);
	late final TranslationsPrayersDeleteEn delete = TranslationsPrayersDeleteEn.internal(_root);
	late final TranslationsPrayersFormEn form = TranslationsPrayersFormEn.internal(_root);
	late final TranslationsPrayersEditEn edit = TranslationsPrayersEditEn.internal(_root);
	late final TranslationsPrayersCategoriesEn categories = TranslationsPrayersCategoriesEn.internal(_root);
	late final TranslationsPrayersShareEn share = TranslationsPrayersShareEn.internal(_root);
}

// Path: journal
class TranslationsJournalEn {
	TranslationsJournalEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'No journal entries yet. Start journaling your prayers!'
	String get empty => 'No journal entries yet. Start journaling your prayers!';

	/// en: 'New Entry'
	String get newEntry => 'New Entry';

	late final TranslationsJournalCategoriesEn categories = TranslationsJournalCategoriesEn.internal(_root);
	late final TranslationsJournalFormEn form = TranslationsJournalFormEn.internal(_root);
	late final TranslationsJournalActionsEn actions = TranslationsJournalActionsEn.internal(_root);
}

// Path: common
class TranslationsCommonEn {
	TranslationsCommonEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Save'
	String get save => 'Save';

	/// en: 'Done'
	String get done => 'Done';

	/// en: 'Cancel'
	String get cancel => 'Cancel';

	/// en: 'Delete'
	String get delete => 'Delete';

	/// en: 'Edit'
	String get edit => 'Edit';

	/// en: 'Add'
	String get add => 'Add';

	/// en: 'Remove'
	String get remove => 'Remove';

	/// en: 'Move'
	String get move => 'Move';

	/// en: 'Search'
	String get search => 'Search';

	/// en: 'Filter'
	String get filter => 'Filter';

	/// en: 'Sort'
	String get sort => 'Sort';

	/// en: 'Close'
	String get close => 'Close';

	/// en: 'Confirm'
	String get confirm => 'Confirm';

	/// en: 'Yes'
	String get yes => 'Yes';

	/// en: 'No'
	String get no => 'No';

	/// en: 'Tip'
	String get tip => 'Tip';

	/// en: 'None'
	String get none => 'None';

	/// en: 'Today'
	String get today => 'Today';

	/// en: 'Yesterday'
	String get yesterday => 'Yesterday';

	/// en: '{count} days ago'
	String daysAgo({required Object count}) => '${count} days ago';

	/// en: '{count} weeks ago'
	String weeksAgo({required Object count}) => '${count} weeks ago';

	/// en: '{count} months ago'
	String monthsAgo({required Object count}) => '${count} months ago';

	/// en: '{count} years ago'
	String yearsAgo({required Object count}) => '${count} years ago';

	/// en: 'Delete?'
	String get deleteConfirmTitle => 'Delete?';

	/// en: 'Clear All Data?'
	String get clearConfirmTitle => 'Clear All Data?';

	/// en: 'All data cleared'
	String get dataCleared => 'All data cleared';
}

// Path: hints
class TranslationsHintsEn {
	TranslationsHintsEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'You can change the status to "Answered" anytime to track how God moves!'
	String get prayerTip => 'You can change the status to "Answered" anytime to track how God moves!';

	/// en: 'Journaling helps you reflect on your spiritual journey and see how God is working in your life.'
	String get journalTip => 'Journaling helps you reflect on your spiritual journey and see how God is working in your life.';

	/// en: 'Long press and drag the handle to reorder'
	String get reorder => 'Long press and drag the handle to reorder';

	/// en: 'Long press and drag the handle to reorder categories'
	String get reorderCategories => 'Long press and drag the handle to reorder categories';
}

// Path: moods
class TranslationsMoodsEn {
	TranslationsMoodsEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Grateful'
	String get grateful => 'Grateful';

	/// en: 'Peaceful'
	String get peaceful => 'Peaceful';

	/// en: 'Hopeful'
	String get hopeful => 'Hopeful';

	/// en: 'Excited'
	String get excited => 'Excited';

	/// en: 'Anxious'
	String get anxious => 'Anxious';

	/// en: 'Sad'
	String get sad => 'Sad';
}

// Path: status
class TranslationsStatusEn {
	TranslationsStatusEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Unanswered'
	String get unanswered => 'Unanswered';

	/// en: 'Active'
	String get active => 'Active';

	/// en: 'Answered'
	String get answered => 'Answered';
}

// Path: drawer.categories
class TranslationsDrawerCategoriesEn {
	TranslationsDrawerCategoriesEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Dashboard'
	String get dashboard => 'Dashboard';

	/// en: 'Prayers'
	String get prayers => 'Prayers';

	/// en: 'Journal'
	String get journal => 'Journal';

	/// en: 'Reminders'
	String get reminders => 'Reminders';
}

// Path: drawer.actions
class TranslationsDrawerActionsEn {
	TranslationsDrawerActionsEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Add'
	String get add => 'Add';

	/// en: 'Edit'
	String get edit => 'Edit';

	/// en: 'Layout'
	String get layout => 'Layout';

	/// en: 'Share'
	String get share => 'Share';

	/// en: 'Organize'
	String get organize => 'Organize';
}

// Path: settings.sections
class TranslationsSettingsSectionsEn {
	TranslationsSettingsSectionsEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Appearance'
	String get appearance => 'Appearance';

	/// en: 'Dashboard'
	String get dashboard => 'Dashboard';

	/// en: 'Prayers'
	String get prayers => 'Prayers';

	/// en: 'Journal'
	String get journal => 'Journal';

	/// en: 'Data'
	String get data => 'Data';
}

// Path: settings.options
class TranslationsSettingsOptionsEn {
	TranslationsSettingsOptionsEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Theme'
	String get theme => 'Theme';

	/// en: 'System default'
	String get themeSubtitle => 'System default';

	/// en: 'Light'
	String get themeLight => 'Light';

	/// en: 'Dark'
	String get themeDark => 'Dark';

	/// en: 'System'
	String get themeSystem => 'System';

	/// en: 'Daily Reminder'
	String get dailyReminder => 'Daily Reminder';

	/// en: 'Remind me to pray daily'
	String get dailyReminderSubtitle => 'Remind me to pray daily';

	/// en: 'Default View'
	String get defaultView => 'Default View';

	/// en: 'Show all statistics'
	String get defaultViewSubtitle => 'Show all statistics';

	/// en: 'Auto-archive Answered'
	String get autoArchive => 'Auto-archive Answered';

	/// en: 'Move answered prayers to archive after 7 days'
	String get autoArchiveSubtitle => 'Move answered prayers to archive after 7 days';

	/// en: 'Default Filter'
	String get defaultFilter => 'Default Filter';

	/// en: 'Show active prayers'
	String get defaultFilterSubtitle => 'Show active prayers';

	/// en: 'Private Mode'
	String get privateMode => 'Private Mode';

	/// en: 'Require authentication to view journal'
	String get privateModeSubtitle => 'Require authentication to view journal';

	/// en: 'Backup & Restore'
	String get backupRestore => 'Backup & Restore';

	/// en: 'Export or import your data'
	String get backupRestoreSubtitle => 'Export or import your data';

	/// en: 'Clear All Data'
	String get clearData => 'Clear All Data';

	/// en: 'This will permanently delete all your prayers and journal entries. This action cannot be undone.'
	String get clearDataConfirm => 'This will permanently delete all your prayers and journal entries. This action cannot be undone.';
}

// Path: reminders.views
class TranslationsRemindersViewsEn {
	TranslationsRemindersViewsEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Month'
	String get month => 'Month';

	/// en: 'Week'
	String get week => 'Week';

	/// en: 'Schedule'
	String get schedule => 'Schedule';
}

// Path: reminders.filters
class TranslationsRemindersFiltersEn {
	TranslationsRemindersFiltersEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Both'
	String get both => 'Both';

	/// en: 'Prayers Only'
	String get prayersOnly => 'Prayers Only';

	/// en: 'Journals Only'
	String get journalsOnly => 'Journals Only';
}

// Path: reminders.weekdays
class TranslationsRemindersWeekdaysEn {
	TranslationsRemindersWeekdaysEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	late final TranslationsRemindersWeekdaysShortEn short = TranslationsRemindersWeekdaysShortEn.internal(_root);
	late final TranslationsRemindersWeekdaysFullEn full = TranslationsRemindersWeekdaysFullEn.internal(_root);
}

// Path: reminders.months
class TranslationsRemindersMonthsEn {
	TranslationsRemindersMonthsEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'January'
	String get january => 'January';

	/// en: 'February'
	String get february => 'February';

	/// en: 'March'
	String get march => 'March';

	/// en: 'April'
	String get april => 'April';

	/// en: 'May'
	String get may => 'May';

	/// en: 'June'
	String get june => 'June';

	/// en: 'July'
	String get july => 'July';

	/// en: 'August'
	String get august => 'August';

	/// en: 'September'
	String get september => 'September';

	/// en: 'October'
	String get october => 'October';

	/// en: 'November'
	String get november => 'November';

	/// en: 'December'
	String get december => 'December';
}

// Path: support.channels
class TranslationsSupportChannelsEn {
	TranslationsSupportChannelsEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Email'
	String get email => 'Email';

	/// en: 'Discord'
	String get discord => 'Discord';

	/// en: 'Facebook'
	String get facebook => 'Facebook';

	/// en: 'Gab'
	String get gab => 'Gab';

	/// en: 'GitHub'
	String get github => 'GitHub';

	/// en: 'Matrix'
	String get matrix => 'Matrix';

	/// en: 'IRC Libera.Chat'
	String get irc => 'IRC Libera.Chat';
}

// Path: dashboard.stats
class TranslationsDashboardStatsEn {
	TranslationsDashboardStatsEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Total Prayers'
	String get totalPrayers => 'Total Prayers';

	/// en: 'All time prayers'
	String get allTimePrayers => 'All time prayers';

	/// en: 'Answered'
	String get answered => 'Answered';

	/// en: 'Prayers answered'
	String get prayersAnswered => 'Prayers answered';

	/// en: 'Unanswered'
	String get unanswered => 'Unanswered';

	/// en: 'Still praying'
	String get stillPraying => 'Still praying';

	/// en: 'Day Streak'
	String get streak => 'Day Streak';

	/// en: 'Day prayer streak'
	String get dayPrayerStreak => 'Day prayer streak';

	/// en: 'This Week'
	String get thisWeek => 'This Week';

	/// en: 'This Month'
	String get thisMonth => 'This Month';
}

// Path: dashboard.add
class TranslationsDashboardAddEn {
	TranslationsDashboardAddEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Select Block Type'
	String get selectBlockType => 'Select Block Type';

	/// en: 'Choose a statistics block to add to your dashboard'
	String get selectBlockTypeSubtitle => 'Choose a statistics block to add to your dashboard';

	/// en: 'You can rearrange blocks later using the Layout option in the menu.'
	String get tipRearrange => 'You can rearrange blocks later using the Layout option in the menu.';
}

// Path: dashboard.edit
class TranslationsDashboardEditEn {
	TranslationsDashboardEditEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Edit Dashboard Blocks'
	String get title => 'Edit Dashboard Blocks';

	/// en: 'Tap a block to edit its settings or remove it'
	String get subtitle => 'Tap a block to edit its settings or remove it';

	/// en: 'Type'
	String get typeLabel => 'Type';

	late final TranslationsDashboardEditBlockNamesEn blockNames = TranslationsDashboardEditBlockNamesEn.internal(_root);
	late final TranslationsDashboardEditBlockTypesEn blockTypes = TranslationsDashboardEditBlockTypesEn.internal(_root);
}

// Path: dashboard.layout
class TranslationsDashboardLayoutEn {
	TranslationsDashboardLayoutEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Arrange Blocks'
	String get title => 'Arrange Blocks';

	/// en: 'Drag and drop to reorder your dashboard blocks'
	String get subtitle => 'Drag and drop to reorder your dashboard blocks';

	/// en: 'No blocks yet. Add your first block!'
	String get empty => 'No blocks yet. Add your first block!';

	/// en: 'Order saved'
	String get orderSaved => 'Order saved';

	late final TranslationsDashboardLayoutBlockNamesEn blockNames = TranslationsDashboardLayoutBlockNamesEn.internal(_root);
}

// Path: dashboard.blockTypes
class TranslationsDashboardBlockTypesEn {
	TranslationsDashboardBlockTypesEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Counter Block'
	String get counter => 'Counter Block';

	/// en: 'Display a simple count of prayers'
	String get counterDesc => 'Display a simple count of prayers';

	/// en: 'Chart Block'
	String get chart => 'Chart Block';

	/// en: 'Visual chart of prayer statistics'
	String get chartDesc => 'Visual chart of prayer statistics';

	/// en: 'Recent List'
	String get list => 'Recent List';

	/// en: 'List of recent prayers'
	String get listDesc => 'List of recent prayers';

	/// en: 'Category Breakdown'
	String get category => 'Category Breakdown';

	/// en: 'Prayers grouped by category'
	String get categoryDesc => 'Prayers grouped by category';

	/// en: 'Answered Rate'
	String get rate => 'Answered Rate';

	/// en: 'Percentage of answered prayers'
	String get rateDesc => 'Percentage of answered prayers';

	/// en: 'Prayer Reminders'
	String get reminder => 'Prayer Reminders';

	/// en: 'Active prayer reminders'
	String get reminderDesc => 'Active prayer reminders';

	/// en: 'Prayer Goals'
	String get goals => 'Prayer Goals';

	/// en: 'Your prayer goals and targets'
	String get goalsDesc => 'Your prayer goals and targets';
}

// Path: prayers.tabs
class TranslationsPrayersTabsEn {
	TranslationsPrayersTabsEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Unanswered'
	String get unanswered => 'Unanswered';

	/// en: 'Active'
	String get active => 'Active';

	/// en: 'Answered'
	String get answered => 'Answered';
}

// Path: prayers.empty
class TranslationsPrayersEmptyEn {
	TranslationsPrayersEmptyEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'No unanswered prayers'
	String get unanswered => 'No unanswered prayers';

	/// en: 'No active prayers'
	String get active => 'No active prayers';

	/// en: 'No answered prayers yet'
	String get answered => 'No answered prayers yet';

	/// en: 'Keep praying! God answers in His time.'
	String get keepPraying => 'Keep praying! God answers in His time.';

	/// en: 'Tap + to add a new prayer'
	String get tapToAdd => 'Tap + to add a new prayer';
}

// Path: prayers.delete
class TranslationsPrayersDeleteEn {
	TranslationsPrayersDeleteEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Delete Prayer?'
	String get title => 'Delete Prayer?';

	/// en: 'Are you sure you want to delete "{title}"?'
	String confirm({required Object title}) => 'Are you sure you want to delete "${title}"?';
}

// Path: prayers.form
class TranslationsPrayersFormEn {
	TranslationsPrayersFormEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Title'
	String get title => 'Title';

	/// en: 'Description'
	String get description => 'Description';

	/// en: 'Category'
	String get category => 'Category';

	/// en: 'Status'
	String get status => 'Status';

	/// en: 'Date'
	String get date => 'Date';

	/// en: 'Tags'
	String get tags => 'Tags';

	/// en: 'Save Prayer'
	String get save => 'Save Prayer';

	/// en: 'Cancel'
	String get cancel => 'Cancel';

	/// en: 'Please enter a title'
	String get titleRequired => 'Please enter a title';

	/// en: 'Please enter a description'
	String get descriptionRequired => 'Please enter a description';
}

// Path: prayers.edit
class TranslationsPrayersEditEn {
	TranslationsPrayersEditEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Edit Prayer'
	String get title => 'Edit Prayer';
}

// Path: prayers.categories
class TranslationsPrayersCategoriesEn {
	TranslationsPrayersCategoriesEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Family'
	String get family => 'Family';

	/// en: 'Health'
	String get health => 'Health';

	/// en: 'Finances'
	String get finances => 'Finances';

	/// en: 'Work/Career'
	String get work => 'Work/Career';

	/// en: 'Spiritual Growth'
	String get spiritual => 'Spiritual Growth';

	/// en: 'Friends'
	String get friends => 'Friends';

	/// en: 'Missions'
	String get missions => 'Missions';

	/// en: 'Other'
	String get other => 'Other';
}

// Path: prayers.share
class TranslationsPrayersShareEn {
	TranslationsPrayersShareEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Select All'
	String get selectAll => 'Select All';

	/// en: 'selected'
	String get selected => 'selected';

	/// en: '({count})'
	String selectedCount({required Object count}) => '(${count})';

	/// en: 'Export Format'
	String get exportFormat => 'Export Format';

	/// en: 'Copy'
	String get copy => 'Copy';

	/// en: 'Share'
	String get share => 'Share';

	/// en: 'Text'
	String get text => 'Text';

	/// en: 'JSON'
	String get json => 'JSON';

	/// en: 'CSV'
	String get csv => 'CSV';
}

// Path: journal.categories
class TranslationsJournalCategoriesEn {
	TranslationsJournalCategoriesEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Categories'
	String get title => 'Categories';

	/// en: 'Uncategorized'
	String get uncategorized => 'Uncategorized';

	/// en: 'New Category'
	String get addNew => 'New Category';

	/// en: 'Default Category'
	String get defaultCategory => 'Default Category';

	/// en: 'Answered Prayers'
	String get answeredPrayers => 'Answered Prayers';

	/// en: 'Daily Devotion'
	String get dailyDevotion => 'Daily Devotion';

	/// en: 'Health'
	String get health => 'Health';

	/// en: 'Missions'
	String get missions => 'Missions';

	/// en: 'Family'
	String get family => 'Family';

	/// en: 'Spiritual Growth'
	String get spiritualGrowth => 'Spiritual Growth';

	/// en: 'Other'
	String get other => 'Other';

	/// en: 'Work/Career'
	String get work => 'Work/Career';

	/// en: 'Organize Categories'
	String get organizeTitle => 'Organize Categories';

	/// en: 'Drag to reorder categories. Tap to edit or delete.'
	String get organizeSubtitle => 'Drag to reorder categories. Tap to edit or delete.';

	/// en: '{count} entries'
	String entriesCount({required Object count}) => '${count} entries';

	/// en: 'Category Name'
	String get categoryNameLabel => 'Category Name';

	/// en: 'Enter category name'
	String get categoryNameHint => 'Enter category name';

	/// en: 'Are you sure you want to delete "{name}"? Entries in this category will be moved to "{fallback}".'
	String deleteConfirm({required Object name, required Object fallback}) => 'Are you sure you want to delete "${name}"?\n\nEntries in this category will be moved to "${fallback}".';
}

// Path: journal.form
class TranslationsJournalFormEn {
	TranslationsJournalFormEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Title'
	String get title => 'Title';

	/// en: 'Give your entry a title...'
	String get titleHint => 'Give your entry a title...';

	/// en: 'Please enter a title'
	String get titleRequired => 'Please enter a title';

	/// en: 'Content'
	String get content => 'Content';

	/// en: 'Write about your prayer experience, thoughts, or answered prayers...'
	String get contentHint => 'Write about your prayer experience, thoughts, or answered prayers...';

	/// en: 'Please enter some content'
	String get contentRequired => 'Please enter some content';

	/// en: 'Related Prayer (Optional)'
	String get relatedPrayer => 'Related Prayer (Optional)';

	/// en: 'Select a prayer this entry relates to'
	String get relatedPrayerHint => 'Select a prayer this entry relates to';

	/// en: 'Category'
	String get category => 'Category';

	/// en: 'Date'
	String get date => 'Date';

	/// en: 'How are you feeling?'
	String get mood => 'How are you feeling?';

	/// en: 'Save Entry'
	String get save => 'Save Entry';

	/// en: 'Cancel'
	String get cancel => 'Cancel';
}

// Path: journal.actions
class TranslationsJournalActionsEn {
	TranslationsJournalActionsEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Move to Category'
	String get move => 'Move to Category';

	/// en: 'Delete'
	String get delete => 'Delete';

	/// en: 'Edit'
	String get edit => 'Edit';
}

// Path: reminders.weekdays.short
class TranslationsRemindersWeekdaysShortEn {
	TranslationsRemindersWeekdaysShortEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Mon'
	String get mon => 'Mon';

	/// en: 'Tue'
	String get tue => 'Tue';

	/// en: 'Wed'
	String get wed => 'Wed';

	/// en: 'Thu'
	String get thu => 'Thu';

	/// en: 'Fri'
	String get fri => 'Fri';

	/// en: 'Sat'
	String get sat => 'Sat';

	/// en: 'Sun'
	String get sun => 'Sun';
}

// Path: reminders.weekdays.full
class TranslationsRemindersWeekdaysFullEn {
	TranslationsRemindersWeekdaysFullEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Monday'
	String get monday => 'Monday';

	/// en: 'Tuesday'
	String get tuesday => 'Tuesday';

	/// en: 'Wednesday'
	String get wednesday => 'Wednesday';

	/// en: 'Thursday'
	String get thursday => 'Thursday';

	/// en: 'Friday'
	String get friday => 'Friday';

	/// en: 'Saturday'
	String get saturday => 'Saturday';

	/// en: 'Sunday'
	String get sunday => 'Sunday';
}

// Path: dashboard.edit.blockNames
class TranslationsDashboardEditBlockNamesEn {
	TranslationsDashboardEditBlockNamesEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Total Prayers'
	String get totalPrayers => 'Total Prayers';

	/// en: 'Answered Prayers'
	String get answeredPrayers => 'Answered Prayers';

	/// en: 'Unanswered'
	String get unanswered => 'Unanswered';

	/// en: 'Prayer Streak'
	String get prayerStreak => 'Prayer Streak';

	/// en: 'Weekly Activity'
	String get weeklyActivity => 'Weekly Activity';
}

// Path: dashboard.edit.blockTypes
class TranslationsDashboardEditBlockTypesEn {
	TranslationsDashboardEditBlockTypesEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Counter'
	String get counter => 'Counter';

	/// en: 'Streak'
	String get streak => 'Streak';

	/// en: 'Chart'
	String get chart => 'Chart';
}

// Path: dashboard.layout.blockNames
class TranslationsDashboardLayoutBlockNamesEn {
	TranslationsDashboardLayoutBlockNamesEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Total Prayers'
	String get totalPrayers => 'Total Prayers';

	/// en: 'Answered'
	String get answered => 'Answered';

	/// en: 'Unanswered'
	String get unanswered => 'Unanswered';

	/// en: 'Streak'
	String get streak => 'Streak';

	/// en: 'Weekly'
	String get weekly => 'Weekly';
}

/// The flat map containing all translations for locale <en>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on Translations {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'appTitle' => 'Prayer App',
			'bottomNav.home' => 'Home',
			'bottomNav.prayers' => 'Prayers',
			'bottomNav.journal' => 'Journal',
			'drawer.menu' => 'Menu',
			'drawer.categories.dashboard' => 'Dashboard',
			'drawer.categories.prayers' => 'Prayers',
			'drawer.categories.journal' => 'Journal',
			'drawer.categories.reminders' => 'Reminders',
			'drawer.actions.add' => 'Add',
			'drawer.actions.edit' => 'Edit',
			'drawer.actions.layout' => 'Layout',
			'drawer.actions.share' => 'Share',
			'drawer.actions.organize' => 'Organize',
			'pages.about' => 'About',
			'pages.settings' => 'Settings',
			'pages.support' => 'Support',
			'settings.language' => 'Language',
			'settings.english' => 'English',
			'settings.spanish' => 'Spanish',
			'settings.sections.appearance' => 'Appearance',
			'settings.sections.dashboard' => 'Dashboard',
			'settings.sections.prayers' => 'Prayers',
			'settings.sections.journal' => 'Journal',
			'settings.sections.data' => 'Data',
			'settings.options.theme' => 'Theme',
			'settings.options.themeSubtitle' => 'System default',
			'settings.options.themeLight' => 'Light',
			'settings.options.themeDark' => 'Dark',
			'settings.options.themeSystem' => 'System',
			'settings.options.dailyReminder' => 'Daily Reminder',
			'settings.options.dailyReminderSubtitle' => 'Remind me to pray daily',
			'settings.options.defaultView' => 'Default View',
			'settings.options.defaultViewSubtitle' => 'Show all statistics',
			'settings.options.autoArchive' => 'Auto-archive Answered',
			'settings.options.autoArchiveSubtitle' => 'Move answered prayers to archive after 7 days',
			'settings.options.defaultFilter' => 'Default Filter',
			'settings.options.defaultFilterSubtitle' => 'Show active prayers',
			'settings.options.privateMode' => 'Private Mode',
			'settings.options.privateModeSubtitle' => 'Require authentication to view journal',
			'settings.options.backupRestore' => 'Backup & Restore',
			'settings.options.backupRestoreSubtitle' => 'Export or import your data',
			'settings.options.clearData' => 'Clear All Data',
			'settings.options.clearDataConfirm' => 'This will permanently delete all your prayers and journal entries. This action cannot be undone.',
			'titles.home' => 'Home',
			'titles.dashboardAdd' => 'Add Dashboard Block',
			'titles.dashboardEdit' => 'Edit Dashboard Block',
			'titles.dashboardLayout' => 'Arrange Dashboard',
			'titles.prayersAdd' => 'Add Prayer',
			'titles.prayersEdit' => 'Edit Prayer',
			'titles.prayersShare' => 'Share Prayers',
			'titles.journalAdd' => 'Add Journal Entry',
			'titles.journalEdit' => 'Edit Journal Entry',
			'titles.journalOrganize' => 'Organize Journal',
			'content.dashboard' => 'Dashboard',
			'content.prayers' => 'Prayers',
			'content.journal' => 'Journal',
			'reminders.today' => 'Today',
			'reminders.refresh' => 'Refresh',
			'reminders.weekOf' => 'Week of',
			'reminders.views.month' => 'Month',
			'reminders.views.week' => 'Week',
			'reminders.views.schedule' => 'Schedule',
			'reminders.filters.both' => 'Both',
			'reminders.filters.prayersOnly' => 'Prayers Only',
			'reminders.filters.journalsOnly' => 'Journals Only',
			'reminders.weekdays.short.mon' => 'Mon',
			'reminders.weekdays.short.tue' => 'Tue',
			'reminders.weekdays.short.wed' => 'Wed',
			'reminders.weekdays.short.thu' => 'Thu',
			'reminders.weekdays.short.fri' => 'Fri',
			'reminders.weekdays.short.sat' => 'Sat',
			'reminders.weekdays.short.sun' => 'Sun',
			'reminders.weekdays.full.monday' => 'Monday',
			'reminders.weekdays.full.tuesday' => 'Tuesday',
			'reminders.weekdays.full.wednesday' => 'Wednesday',
			'reminders.weekdays.full.thursday' => 'Thursday',
			'reminders.weekdays.full.friday' => 'Friday',
			'reminders.weekdays.full.saturday' => 'Saturday',
			'reminders.weekdays.full.sunday' => 'Sunday',
			'reminders.months.january' => 'January',
			'reminders.months.february' => 'February',
			'reminders.months.march' => 'March',
			'reminders.months.april' => 'April',
			'reminders.months.may' => 'May',
			'reminders.months.june' => 'June',
			'reminders.months.july' => 'July',
			'reminders.months.august' => 'August',
			'reminders.months.september' => 'September',
			'reminders.months.october' => 'October',
			'reminders.months.november' => 'November',
			'reminders.months.december' => 'December',
			'reminders.items' => ({required Object count}) => '${count} items',
			'reminders.noReminders' => 'No reminders',
			'reminders.noRemindersForDay' => 'No reminders for this day',
			'about.title' => 'A Flutter Prayer Journal App',
			'about.by' => 'by Baptist Missions OS',
			'about.description' => 'A personal prayer journal to track your prayers, see answered prayers, and grow in your faith journey.',
			'about.version' => 'Version',
			'about.openSource' => 'Open Source',
			'about.copyright' => '© 2026 Baptist Missions OS',
			'support.title' => 'Need Help?',
			'support.description' => 'If you need assistance with Baptist Missions OS, please reach out through our support channels:',
			'support.channels.email' => 'Email',
			'support.channels.discord' => 'Discord',
			'support.channels.facebook' => 'Facebook',
			'support.channels.gab' => 'Gab',
			'support.channels.github' => 'GitHub',
			'support.channels.matrix' => 'Matrix',
			'support.channels.irc' => 'IRC Libera.Chat',
			'support.quickTips' => 'Quick Tips',
			'dashboard.stats.totalPrayers' => 'Total Prayers',
			'dashboard.stats.allTimePrayers' => 'All time prayers',
			'dashboard.stats.answered' => 'Answered',
			'dashboard.stats.prayersAnswered' => 'Prayers answered',
			'dashboard.stats.unanswered' => 'Unanswered',
			'dashboard.stats.stillPraying' => 'Still praying',
			'dashboard.stats.streak' => 'Day Streak',
			'dashboard.stats.dayPrayerStreak' => 'Day prayer streak',
			'dashboard.stats.thisWeek' => 'This Week',
			'dashboard.stats.thisMonth' => 'This Month',
			'dashboard.empty' => 'No statistics yet. Add blocks to see your prayer stats.',
			'dashboard.quickActions' => 'Quick Actions',
			'dashboard.iPrayedToday' => 'I Prayed Today',
			'dashboard.add.selectBlockType' => 'Select Block Type',
			'dashboard.add.selectBlockTypeSubtitle' => 'Choose a statistics block to add to your dashboard',
			'dashboard.add.tipRearrange' => 'You can rearrange blocks later using the Layout option in the menu.',
			'dashboard.edit.title' => 'Edit Dashboard Blocks',
			'dashboard.edit.subtitle' => 'Tap a block to edit its settings or remove it',
			'dashboard.edit.typeLabel' => 'Type',
			'dashboard.edit.blockNames.totalPrayers' => 'Total Prayers',
			'dashboard.edit.blockNames.answeredPrayers' => 'Answered Prayers',
			'dashboard.edit.blockNames.unanswered' => 'Unanswered',
			'dashboard.edit.blockNames.prayerStreak' => 'Prayer Streak',
			'dashboard.edit.blockNames.weeklyActivity' => 'Weekly Activity',
			'dashboard.edit.blockTypes.counter' => 'Counter',
			'dashboard.edit.blockTypes.streak' => 'Streak',
			'dashboard.edit.blockTypes.chart' => 'Chart',
			'dashboard.layout.title' => 'Arrange Blocks',
			'dashboard.layout.subtitle' => 'Drag and drop to reorder your dashboard blocks',
			'dashboard.layout.empty' => 'No blocks yet. Add your first block!',
			'dashboard.layout.orderSaved' => 'Order saved',
			'dashboard.layout.blockNames.totalPrayers' => 'Total Prayers',
			'dashboard.layout.blockNames.answered' => 'Answered',
			'dashboard.layout.blockNames.unanswered' => 'Unanswered',
			'dashboard.layout.blockNames.streak' => 'Streak',
			'dashboard.layout.blockNames.weekly' => 'Weekly',
			'dashboard.blockTypes.counter' => 'Counter Block',
			'dashboard.blockTypes.counterDesc' => 'Display a simple count of prayers',
			'dashboard.blockTypes.chart' => 'Chart Block',
			'dashboard.blockTypes.chartDesc' => 'Visual chart of prayer statistics',
			'dashboard.blockTypes.list' => 'Recent List',
			'dashboard.blockTypes.listDesc' => 'List of recent prayers',
			'dashboard.blockTypes.category' => 'Category Breakdown',
			'dashboard.blockTypes.categoryDesc' => 'Prayers grouped by category',
			'dashboard.blockTypes.rate' => 'Answered Rate',
			'dashboard.blockTypes.rateDesc' => 'Percentage of answered prayers',
			'dashboard.blockTypes.reminder' => 'Prayer Reminders',
			'dashboard.blockTypes.reminderDesc' => 'Active prayer reminders',
			'dashboard.blockTypes.goals' => 'Prayer Goals',
			'dashboard.blockTypes.goalsDesc' => 'Your prayer goals and targets',
			'prayers.tabs.unanswered' => 'Unanswered',
			'prayers.tabs.active' => 'Active',
			'prayers.tabs.answered' => 'Answered',
			'prayers.newPrayer' => 'New Prayer',
			'prayers.addToJournal' => 'Add to Journal',
			'prayers.markAnswered' => 'Mark Answered',
			'prayers.empty.unanswered' => 'No unanswered prayers',
			'prayers.empty.active' => 'No active prayers',
			'prayers.empty.answered' => 'No answered prayers yet',
			'prayers.empty.keepPraying' => 'Keep praying! God answers in His time.',
			'prayers.empty.tapToAdd' => 'Tap + to add a new prayer',
			'prayers.delete.title' => 'Delete Prayer?',
			'prayers.delete.confirm' => ({required Object title}) => 'Are you sure you want to delete "${title}"?',
			'prayers.form.title' => 'Title',
			'prayers.form.description' => 'Description',
			'prayers.form.category' => 'Category',
			'prayers.form.status' => 'Status',
			'prayers.form.date' => 'Date',
			'prayers.form.tags' => 'Tags',
			'prayers.form.save' => 'Save Prayer',
			'prayers.form.cancel' => 'Cancel',
			'prayers.form.titleRequired' => 'Please enter a title',
			'prayers.form.descriptionRequired' => 'Please enter a description',
			'prayers.edit.title' => 'Edit Prayer',
			'prayers.categories.family' => 'Family',
			'prayers.categories.health' => 'Health',
			'prayers.categories.finances' => 'Finances',
			'prayers.categories.work' => 'Work/Career',
			'prayers.categories.spiritual' => 'Spiritual Growth',
			'prayers.categories.friends' => 'Friends',
			'prayers.categories.missions' => 'Missions',
			'prayers.categories.other' => 'Other',
			'prayers.share.selectAll' => 'Select All',
			'prayers.share.selected' => 'selected',
			'prayers.share.selectedCount' => ({required Object count}) => '(${count})',
			'prayers.share.exportFormat' => 'Export Format',
			'prayers.share.copy' => 'Copy',
			'prayers.share.share' => 'Share',
			'prayers.share.text' => 'Text',
			'prayers.share.json' => 'JSON',
			'prayers.share.csv' => 'CSV',
			'journal.empty' => 'No journal entries yet. Start journaling your prayers!',
			'journal.newEntry' => 'New Entry',
			'journal.categories.title' => 'Categories',
			'journal.categories.uncategorized' => 'Uncategorized',
			'journal.categories.addNew' => 'New Category',
			'journal.categories.defaultCategory' => 'Default Category',
			'journal.categories.answeredPrayers' => 'Answered Prayers',
			'journal.categories.dailyDevotion' => 'Daily Devotion',
			'journal.categories.health' => 'Health',
			'journal.categories.missions' => 'Missions',
			'journal.categories.family' => 'Family',
			'journal.categories.spiritualGrowth' => 'Spiritual Growth',
			'journal.categories.other' => 'Other',
			'journal.categories.work' => 'Work/Career',
			'journal.categories.organizeTitle' => 'Organize Categories',
			'journal.categories.organizeSubtitle' => 'Drag to reorder categories. Tap to edit or delete.',
			'journal.categories.entriesCount' => ({required Object count}) => '${count} entries',
			'journal.categories.categoryNameLabel' => 'Category Name',
			'journal.categories.categoryNameHint' => 'Enter category name',
			'journal.categories.deleteConfirm' => ({required Object name, required Object fallback}) => 'Are you sure you want to delete "${name}"?\n\nEntries in this category will be moved to "${fallback}".',
			'journal.form.title' => 'Title',
			'journal.form.titleHint' => 'Give your entry a title...',
			'journal.form.titleRequired' => 'Please enter a title',
			'journal.form.content' => 'Content',
			'journal.form.contentHint' => 'Write about your prayer experience, thoughts, or answered prayers...',
			'journal.form.contentRequired' => 'Please enter some content',
			'journal.form.relatedPrayer' => 'Related Prayer (Optional)',
			'journal.form.relatedPrayerHint' => 'Select a prayer this entry relates to',
			'journal.form.category' => 'Category',
			'journal.form.date' => 'Date',
			'journal.form.mood' => 'How are you feeling?',
			'journal.form.save' => 'Save Entry',
			'journal.form.cancel' => 'Cancel',
			'journal.actions.move' => 'Move to Category',
			'journal.actions.delete' => 'Delete',
			'journal.actions.edit' => 'Edit',
			'common.save' => 'Save',
			'common.done' => 'Done',
			'common.cancel' => 'Cancel',
			'common.delete' => 'Delete',
			'common.edit' => 'Edit',
			'common.add' => 'Add',
			'common.remove' => 'Remove',
			'common.move' => 'Move',
			'common.search' => 'Search',
			'common.filter' => 'Filter',
			'common.sort' => 'Sort',
			'common.close' => 'Close',
			'common.confirm' => 'Confirm',
			'common.yes' => 'Yes',
			'common.no' => 'No',
			'common.tip' => 'Tip',
			'common.none' => 'None',
			'common.today' => 'Today',
			'common.yesterday' => 'Yesterday',
			'common.daysAgo' => ({required Object count}) => '${count} days ago',
			'common.weeksAgo' => ({required Object count}) => '${count} weeks ago',
			'common.monthsAgo' => ({required Object count}) => '${count} months ago',
			'common.yearsAgo' => ({required Object count}) => '${count} years ago',
			'common.deleteConfirmTitle' => 'Delete?',
			'common.clearConfirmTitle' => 'Clear All Data?',
			'common.dataCleared' => 'All data cleared',
			'hints.prayerTip' => 'You can change the status to "Answered" anytime to track how God moves!',
			'hints.journalTip' => 'Journaling helps you reflect on your spiritual journey and see how God is working in your life.',
			'hints.reorder' => 'Long press and drag the handle to reorder',
			'hints.reorderCategories' => 'Long press and drag the handle to reorder categories',
			'moods.grateful' => 'Grateful',
			'moods.peaceful' => 'Peaceful',
			'moods.hopeful' => 'Hopeful',
			'moods.excited' => 'Excited',
			'moods.anxious' => 'Anxious',
			'moods.sad' => 'Sad',
			'status.unanswered' => 'Unanswered',
			'status.active' => 'Active',
			'status.answered' => 'Answered',
			_ => null,
		};
	}
}
