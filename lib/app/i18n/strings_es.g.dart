///
/// Generated file. Do not edit.
///
// coverage:ignore-file
// ignore_for_file: type=lint, unused_import
// dart format off

import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:slang/generated.dart';
import 'strings.g.dart';

// Path: <root>
class TranslationsEs extends Translations with BaseTranslations<AppLocale, Translations> {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	TranslationsEs({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: AppLocale.es,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ),
		  super(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver) {
		super.$meta.setFlatMapFunction($meta.getTranslation); // copy base translations to super.$meta
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <es>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key) ?? super.$meta.getTranslation(key);

	late final TranslationsEs _root = this; // ignore: unused_field

	@override 
	TranslationsEs $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => TranslationsEs(meta: meta ?? this.$meta);

	// Translations
	@override String get appTitle => 'App de Oración';
	@override late final _TranslationsBottomNavEs bottomNav = _TranslationsBottomNavEs._(_root);
	@override late final _TranslationsDrawerEs drawer = _TranslationsDrawerEs._(_root);
	@override late final _TranslationsPagesEs pages = _TranslationsPagesEs._(_root);
	@override late final _TranslationsSettingsEs settings = _TranslationsSettingsEs._(_root);
	@override late final _TranslationsTitlesEs titles = _TranslationsTitlesEs._(_root);
	@override late final _TranslationsContentEs content = _TranslationsContentEs._(_root);
}

// Path: bottomNav
class _TranslationsBottomNavEs extends TranslationsBottomNavEn {
	_TranslationsBottomNavEs._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get home => 'Inicio';
	@override String get prayers => 'Oraciones';
	@override String get journal => 'Diario';
}

// Path: drawer
class _TranslationsDrawerEs extends TranslationsDrawerEn {
	_TranslationsDrawerEs._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get menu => 'Menú';
	@override late final _TranslationsDrawerCategoriesEs categories = _TranslationsDrawerCategoriesEs._(_root);
	@override late final _TranslationsDrawerActionsEs actions = _TranslationsDrawerActionsEs._(_root);
}

// Path: pages
class _TranslationsPagesEs extends TranslationsPagesEn {
	_TranslationsPagesEs._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get about => 'Acerca de';
	@override String get settings => 'Configuración';
	@override String get support => 'Soporte';
}

// Path: settings
class _TranslationsSettingsEs extends TranslationsSettingsEn {
	_TranslationsSettingsEs._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get language => 'Idioma';
	@override String get english => 'Inglés';
	@override String get spanish => 'Español';
}

// Path: titles
class _TranslationsTitlesEs extends TranslationsTitlesEn {
	_TranslationsTitlesEs._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get home => 'Inicio';
	@override String get dashboardAdd => 'Agregar al Panel';
	@override String get dashboardEdit => 'Editar Panel';
	@override String get dashboardLayout => 'Diseño del Panel';
	@override String get prayersAdd => 'Agregar Oración';
	@override String get prayersEdit => 'Editar Oración';
	@override String get prayersShare => 'Compartir Oración';
	@override String get journalAdd => 'Agregar al Diario';
	@override String get journalEdit => 'Editar Diario';
	@override String get journalOrganize => 'Organizar Diario';
}

// Path: content
class _TranslationsContentEs extends TranslationsContentEn {
	_TranslationsContentEs._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get dashboard => 'Panel';
	@override String get prayers => 'Oraciones';
	@override String get journal => 'Diario';
}

// Path: drawer.categories
class _TranslationsDrawerCategoriesEs extends TranslationsDrawerCategoriesEn {
	_TranslationsDrawerCategoriesEs._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get dashboard => 'Panel';
	@override String get prayers => 'Oraciones';
	@override String get journal => 'Diario';
}

// Path: drawer.actions
class _TranslationsDrawerActionsEs extends TranslationsDrawerActionsEn {
	_TranslationsDrawerActionsEs._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get add => 'Agregar';
	@override String get edit => 'Editar';
	@override String get layout => 'Diseño';
	@override String get share => 'Compartir';
	@override String get organize => 'Organizar';
}

/// The flat map containing all translations for locale <es>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on TranslationsEs {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'appTitle' => 'App de Oración',
			'bottomNav.home' => 'Inicio',
			'bottomNav.prayers' => 'Oraciones',
			'bottomNav.journal' => 'Diario',
			'drawer.menu' => 'Menú',
			'drawer.categories.dashboard' => 'Panel',
			'drawer.categories.prayers' => 'Oraciones',
			'drawer.categories.journal' => 'Diario',
			'drawer.actions.add' => 'Agregar',
			'drawer.actions.edit' => 'Editar',
			'drawer.actions.layout' => 'Diseño',
			'drawer.actions.share' => 'Compartir',
			'drawer.actions.organize' => 'Organizar',
			'pages.about' => 'Acerca de',
			'pages.settings' => 'Configuración',
			'pages.support' => 'Soporte',
			'settings.language' => 'Idioma',
			'settings.english' => 'Inglés',
			'settings.spanish' => 'Español',
			'titles.home' => 'Inicio',
			'titles.dashboardAdd' => 'Agregar al Panel',
			'titles.dashboardEdit' => 'Editar Panel',
			'titles.dashboardLayout' => 'Diseño del Panel',
			'titles.prayersAdd' => 'Agregar Oración',
			'titles.prayersEdit' => 'Editar Oración',
			'titles.prayersShare' => 'Compartir Oración',
			'titles.journalAdd' => 'Agregar al Diario',
			'titles.journalEdit' => 'Editar Diario',
			'titles.journalOrganize' => 'Organizar Diario',
			'content.dashboard' => 'Panel',
			'content.prayers' => 'Oraciones',
			'content.journal' => 'Diario',
			_ => null,
		};
	}
}
