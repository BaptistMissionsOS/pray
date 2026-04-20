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
}

// Path: titles
class TranslationsTitlesEn {
	TranslationsTitlesEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Home'
	String get home => 'Home';

	/// en: 'Dashboard Add'
	String get dashboardAdd => 'Dashboard Add';

	/// en: 'Dashboard Edit'
	String get dashboardEdit => 'Dashboard Edit';

	/// en: 'Dashboard Layout'
	String get dashboardLayout => 'Dashboard Layout';

	/// en: 'Prayers Add'
	String get prayersAdd => 'Prayers Add';

	/// en: 'Prayers Edit'
	String get prayersEdit => 'Prayers Edit';

	/// en: 'Prayers Share'
	String get prayersShare => 'Prayers Share';

	/// en: 'Journal Add'
	String get journalAdd => 'Journal Add';

	/// en: 'Journal Edit'
	String get journalEdit => 'Journal Edit';

	/// en: 'Journal Organize'
	String get journalOrganize => 'Journal Organize';
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
			'titles.home' => 'Home',
			'titles.dashboardAdd' => 'Dashboard Add',
			'titles.dashboardEdit' => 'Dashboard Edit',
			'titles.dashboardLayout' => 'Dashboard Layout',
			'titles.prayersAdd' => 'Prayers Add',
			'titles.prayersEdit' => 'Prayers Edit',
			'titles.prayersShare' => 'Prayers Share',
			'titles.journalAdd' => 'Journal Add',
			'titles.journalEdit' => 'Journal Edit',
			'titles.journalOrganize' => 'Journal Organize',
			'content.dashboard' => 'Dashboard',
			'content.prayers' => 'Prayers',
			'content.journal' => 'Journal',
			_ => null,
		};
	}
}
