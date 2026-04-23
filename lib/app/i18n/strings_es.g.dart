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
	@override late final _TranslationsAboutEs about = _TranslationsAboutEs._(_root);
	@override late final _TranslationsSupportEs support = _TranslationsSupportEs._(_root);
	@override late final _TranslationsDashboardEs dashboard = _TranslationsDashboardEs._(_root);
	@override late final _TranslationsPrayersEs prayers = _TranslationsPrayersEs._(_root);
	@override late final _TranslationsJournalEs journal = _TranslationsJournalEs._(_root);
	@override late final _TranslationsCommonEs common = _TranslationsCommonEs._(_root);
	@override late final _TranslationsHintsEs hints = _TranslationsHintsEs._(_root);
	@override late final _TranslationsMoodsEs moods = _TranslationsMoodsEs._(_root);
	@override late final _TranslationsStatusEs status = _TranslationsStatusEs._(_root);
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
	@override late final _TranslationsSettingsSectionsEs sections = _TranslationsSettingsSectionsEs._(_root);
	@override late final _TranslationsSettingsOptionsEs options = _TranslationsSettingsOptionsEs._(_root);
}

// Path: titles
class _TranslationsTitlesEs extends TranslationsTitlesEn {
	_TranslationsTitlesEs._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get home => 'Inicio';
	@override String get dashboardAdd => 'Agregar Bloque al Panel';
	@override String get dashboardEdit => 'Editar Bloque del Panel';
	@override String get dashboardLayout => 'Organizar Panel';
	@override String get prayersAdd => 'Agregar Oración';
	@override String get prayersEdit => 'Editar Oración';
	@override String get prayersShare => 'Compartir Oraciones';
	@override String get journalAdd => 'Agregar Entrada al Diario';
	@override String get journalEdit => 'Editar Entrada del Diario';
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

// Path: about
class _TranslationsAboutEs extends TranslationsAboutEn {
	_TranslationsAboutEs._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get title => 'Una App de Diario de Oración Flutter';
	@override String get by => 'por Baptist Missions OS';
	@override String get description => 'Un diario de oración personal para registrar tus oraciones, ver las respuestas y crecer en tu camino de fe.';
	@override String get version => 'Versión';
	@override String get openSource => 'Código Abierto';
	@override String get copyright => '© 2026 Baptist Missions OS';
}

// Path: support
class _TranslationsSupportEs extends TranslationsSupportEn {
	_TranslationsSupportEs._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get title => '¿Necesitas Ayuda?';
	@override String get description => 'Si necesitas ayuda con Baptist Missions OS, por favor contáctanos a través de nuestros canales de soporte:';
	@override late final _TranslationsSupportChannelsEs channels = _TranslationsSupportChannelsEs._(_root);
	@override String get quickTips => 'Consejos Rápidos';
}

// Path: dashboard
class _TranslationsDashboardEs extends TranslationsDashboardEn {
	_TranslationsDashboardEs._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override late final _TranslationsDashboardStatsEs stats = _TranslationsDashboardStatsEs._(_root);
	@override String get empty => 'Aún no hay estadísticas. Agrega bloques para ver tus estadísticas de oración.';
	@override String get quickActions => 'Acciones Rápidas';
	@override String get iPrayedToday => 'Oré Hoy';
	@override late final _TranslationsDashboardAddEs add = _TranslationsDashboardAddEs._(_root);
	@override late final _TranslationsDashboardEditEs edit = _TranslationsDashboardEditEs._(_root);
	@override late final _TranslationsDashboardLayoutEs layout = _TranslationsDashboardLayoutEs._(_root);
	@override late final _TranslationsDashboardBlockTypesEs blockTypes = _TranslationsDashboardBlockTypesEs._(_root);
}

// Path: prayers
class _TranslationsPrayersEs extends TranslationsPrayersEn {
	_TranslationsPrayersEs._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override late final _TranslationsPrayersTabsEs tabs = _TranslationsPrayersTabsEs._(_root);
	@override String get newPrayer => 'Nueva Oración';
	@override String get addToJournal => 'Agregar al Diario';
	@override String get markAnswered => 'Marcar Respondida';
	@override late final _TranslationsPrayersEmptyEs empty = _TranslationsPrayersEmptyEs._(_root);
	@override late final _TranslationsPrayersDeleteEs delete = _TranslationsPrayersDeleteEs._(_root);
	@override late final _TranslationsPrayersFormEs form = _TranslationsPrayersFormEs._(_root);
	@override late final _TranslationsPrayersEditEs edit = _TranslationsPrayersEditEs._(_root);
	@override late final _TranslationsPrayersCategoriesEs categories = _TranslationsPrayersCategoriesEs._(_root);
	@override late final _TranslationsPrayersShareEs share = _TranslationsPrayersShareEs._(_root);
}

// Path: journal
class _TranslationsJournalEs extends TranslationsJournalEn {
	_TranslationsJournalEs._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get empty => 'Aún no hay entradas en el diario. ¡Empieza a escribir tus oraciones!';
	@override String get newEntry => 'Nueva Entrada';
	@override late final _TranslationsJournalCategoriesEs categories = _TranslationsJournalCategoriesEs._(_root);
	@override late final _TranslationsJournalFormEs form = _TranslationsJournalFormEs._(_root);
	@override late final _TranslationsJournalActionsEs actions = _TranslationsJournalActionsEs._(_root);
}

// Path: common
class _TranslationsCommonEs extends TranslationsCommonEn {
	_TranslationsCommonEs._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get save => 'Guardar';
	@override String get done => 'Hecho';
	@override String get cancel => 'Cancelar';
	@override String get delete => 'Eliminar';
	@override String get edit => 'Editar';
	@override String get add => 'Agregar';
	@override String get remove => 'Eliminar';
	@override String get move => 'Mover';
	@override String get search => 'Buscar';
	@override String get filter => 'Filtrar';
	@override String get sort => 'Ordenar';
	@override String get close => 'Cerrar';
	@override String get confirm => 'Confirmar';
	@override String get yes => 'Sí';
	@override String get no => 'No';
	@override String get tip => 'Consejo';
	@override String get none => 'Ninguno';
	@override String get today => 'Hoy';
	@override String get yesterday => 'Ayer';
	@override String daysAgo({required Object count}) => 'Hace ${count} días';
	@override String weeksAgo({required Object count}) => 'Hace ${count} semanas';
	@override String monthsAgo({required Object count}) => 'Hace ${count} meses';
	@override String yearsAgo({required Object count}) => 'Hace ${count} años';
	@override String get deleteConfirmTitle => '¿Eliminar?';
	@override String get clearConfirmTitle => '¿Borrar Todos los Datos?';
	@override String get dataCleared => 'Todos los datos borrados';
}

// Path: hints
class _TranslationsHintsEs extends TranslationsHintsEn {
	_TranslationsHintsEs._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get prayerTip => '¡Puedes cambiar el estado a "Respondida" en cualquier momento para ver cómo Dios actúa!';
	@override String get journalTip => 'Escribir en el diario te ayuda a reflexionar sobre tu viaje espiritual y ver cómo Dios está trabajando en tu vida.';
	@override String get reorder => 'Mantén presionado y arrastra el control para reordenar';
	@override String get reorderCategories => 'Mantén presionado y arrastra el control para reordenar las categorías';
}

// Path: moods
class _TranslationsMoodsEs extends TranslationsMoodsEn {
	_TranslationsMoodsEs._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get grateful => 'Agradecido';
	@override String get peaceful => 'Pacífico';
	@override String get hopeful => 'Esperanzado';
	@override String get excited => 'Emocionado';
	@override String get anxious => 'Ansioso';
	@override String get sad => 'Triste';
}

// Path: status
class _TranslationsStatusEs extends TranslationsStatusEn {
	_TranslationsStatusEs._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get unanswered => 'Sin Responder';
	@override String get active => 'Activa';
	@override String get answered => 'Respondida';
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

// Path: settings.sections
class _TranslationsSettingsSectionsEs extends TranslationsSettingsSectionsEn {
	_TranslationsSettingsSectionsEs._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get appearance => 'Apariencia';
	@override String get dashboard => 'Panel';
	@override String get prayers => 'Oraciones';
	@override String get journal => 'Diario';
	@override String get data => 'Datos';
}

// Path: settings.options
class _TranslationsSettingsOptionsEs extends TranslationsSettingsOptionsEn {
	_TranslationsSettingsOptionsEs._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get theme => 'Tema';
	@override String get themeSubtitle => 'Predeterminado del sistema';
	@override String get dailyReminder => 'Recordatorio Diario';
	@override String get dailyReminderSubtitle => 'Recordarme orar diariamente';
	@override String get defaultView => 'Vista Predeterminada';
	@override String get defaultViewSubtitle => 'Mostrar todas las estadísticas';
	@override String get autoArchive => 'Auto-archivar Respondidas';
	@override String get autoArchiveSubtitle => 'Mover oraciones respondidas al archivo después de 7 días';
	@override String get defaultFilter => 'Filtro Predeterminado';
	@override String get defaultFilterSubtitle => 'Mostrar oraciones activas';
	@override String get privateMode => 'Modo Privado';
	@override String get privateModeSubtitle => 'Requerir autenticación para ver el diario';
	@override String get backupRestore => 'Copia de Seguridad y Restauración';
	@override String get backupRestoreSubtitle => 'Exportar o importar tus datos';
	@override String get clearData => 'Borrar Todos los Datos';
	@override String get clearDataConfirm => 'Esto eliminará permanentemente todas tus oraciones y entradas del diario. Esta acción no se puede deshacer.';
}

// Path: support.channels
class _TranslationsSupportChannelsEs extends TranslationsSupportChannelsEn {
	_TranslationsSupportChannelsEs._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get email => 'Correo';
	@override String get discord => 'Discord';
	@override String get facebook => 'Facebook';
	@override String get gab => 'Gab';
	@override String get github => 'GitHub';
	@override String get matrix => 'Matrix';
	@override String get irc => 'IRC Libera.Chat';
}

// Path: dashboard.stats
class _TranslationsDashboardStatsEs extends TranslationsDashboardStatsEn {
	_TranslationsDashboardStatsEs._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get totalPrayers => 'Oraciones Totales';
	@override String get allTimePrayers => 'Oraciones de todos los tiempos';
	@override String get answered => 'Respondidas';
	@override String get prayersAnswered => 'Oraciones respondidas';
	@override String get unanswered => 'Sin Responder';
	@override String get stillPraying => 'Sigue orando';
	@override String get streak => 'Racha de Días';
	@override String get dayPrayerStreak => 'Racha de oración por días';
	@override String get thisWeek => 'Esta Semana';
	@override String get thisMonth => 'Este Mes';
}

// Path: dashboard.add
class _TranslationsDashboardAddEs extends TranslationsDashboardAddEn {
	_TranslationsDashboardAddEs._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get selectBlockType => 'Seleccionar Tipo de Bloque';
	@override String get selectBlockTypeSubtitle => 'Elige un bloque de estadísticas para agregar a tu panel';
	@override String get tipRearrange => 'Puedes reorganizar los bloques más tarde usando la opción Diseño en el menú.';
}

// Path: dashboard.edit
class _TranslationsDashboardEditEs extends TranslationsDashboardEditEn {
	_TranslationsDashboardEditEs._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get title => 'Editar Bloques del Panel';
	@override String get subtitle => 'Toca un bloque para editar su configuración o eliminarlo';
	@override String get typeLabel => 'Tipo';
	@override late final _TranslationsDashboardEditBlockNamesEs blockNames = _TranslationsDashboardEditBlockNamesEs._(_root);
	@override late final _TranslationsDashboardEditBlockTypesEs blockTypes = _TranslationsDashboardEditBlockTypesEs._(_root);
	@override late final _TranslationsDashboardEditBlockValuesEs blockValues = _TranslationsDashboardEditBlockValuesEs._(_root);
}

// Path: dashboard.layout
class _TranslationsDashboardLayoutEs extends TranslationsDashboardLayoutEn {
	_TranslationsDashboardLayoutEs._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get title => 'Organizar Bloques';
	@override String get subtitle => 'Arrastra y suelta para reordenar los bloques del panel';
	@override late final _TranslationsDashboardLayoutBlockNamesEs blockNames = _TranslationsDashboardLayoutBlockNamesEs._(_root);
}

// Path: dashboard.blockTypes
class _TranslationsDashboardBlockTypesEs extends TranslationsDashboardBlockTypesEn {
	_TranslationsDashboardBlockTypesEs._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get counter => 'Bloque Contador';
	@override String get counterDesc => 'Muestra un conteo simple de oraciones';
	@override String get streak => 'Bloque Racha';
	@override String get streakDesc => 'Muestra tu racha de oración';
	@override String get chart => 'Bloque Gráfico';
	@override String get chartDesc => 'Gráfico visual de estadísticas de oración';
	@override String get list => 'Lista Reciente';
	@override String get listDesc => 'Lista de oraciones recientes';
	@override String get category => 'Desglose por Categoría';
	@override String get categoryDesc => 'Oraciones agrupadas por categoría';
	@override String get rate => 'Tasa de Respuestas';
	@override String get rateDesc => 'Porcentaje de oraciones respondidas';
}

// Path: prayers.tabs
class _TranslationsPrayersTabsEs extends TranslationsPrayersTabsEn {
	_TranslationsPrayersTabsEs._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get unanswered => 'Sin Responder';
	@override String get active => 'Activas';
	@override String get answered => 'Respondidas';
}

// Path: prayers.empty
class _TranslationsPrayersEmptyEs extends TranslationsPrayersEmptyEn {
	_TranslationsPrayersEmptyEs._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get unanswered => 'No hay oraciones sin responder';
	@override String get active => 'No hay oraciones activas';
	@override String get answered => 'Aún no hay oraciones respondidas';
	@override String get keepPraying => '¡Sigue orando! Dios responde en Su tiempo.';
	@override String get tapToAdd => 'Toca + para agregar una nueva oración';
}

// Path: prayers.delete
class _TranslationsPrayersDeleteEs extends TranslationsPrayersDeleteEn {
	_TranslationsPrayersDeleteEs._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get title => '¿Eliminar Oración?';
	@override String confirm({required Object title}) => '¿Estás seguro de que quieres eliminar "${title}"?';
}

// Path: prayers.form
class _TranslationsPrayersFormEs extends TranslationsPrayersFormEn {
	_TranslationsPrayersFormEs._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get title => 'Título';
	@override String get description => 'Descripción';
	@override String get category => 'Categoría';
	@override String get status => 'Estado';
	@override String get date => 'Fecha';
	@override String get tags => 'Etiquetas';
	@override String get save => 'Guardar Oración';
	@override String get cancel => 'Cancelar';
	@override String get titleRequired => 'Por favor ingresa un título';
	@override String get descriptionRequired => 'Por favor ingresa una descripción';
}

// Path: prayers.edit
class _TranslationsPrayersEditEs extends TranslationsPrayersEditEn {
	_TranslationsPrayersEditEs._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get title => 'Editar Oración';
}

// Path: prayers.categories
class _TranslationsPrayersCategoriesEs extends TranslationsPrayersCategoriesEn {
	_TranslationsPrayersCategoriesEs._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get family => 'Familia';
	@override String get health => 'Salud';
	@override String get finances => 'Finanzas';
	@override String get work => 'Trabajo/Carrera';
	@override String get spiritual => 'Crecimiento Espiritual';
	@override String get friends => 'Amigos';
	@override String get missions => 'Misiones';
	@override String get other => 'Otro';
}

// Path: prayers.share
class _TranslationsPrayersShareEs extends TranslationsPrayersShareEn {
	_TranslationsPrayersShareEs._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get selectAll => 'Seleccionar Todo';
	@override String get selected => 'seleccionado(s)';
	@override String selectedCount({required Object count}) => '(${count})';
	@override String get exportFormat => 'Formato de Exportación';
	@override String get copy => 'Copiar';
	@override String get share => 'Compartir';
	@override String get text => 'Texto';
	@override String get json => 'JSON';
	@override String get csv => 'CSV';
}

// Path: journal.categories
class _TranslationsJournalCategoriesEs extends TranslationsJournalCategoriesEn {
	_TranslationsJournalCategoriesEs._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get title => 'Categorías';
	@override String get uncategorized => 'Sin Categoría';
	@override String get addNew => 'Nueva Categoría';
	@override String get defaultCategory => 'Categoría Predeterminada';
	@override String get answeredPrayers => 'Oraciones Respondidas';
	@override String get dailyDevotion => 'Devoción Diaria';
	@override String get health => 'Salud';
	@override String get missions => 'Misiones';
	@override String get family => 'Familia';
	@override String get spiritualGrowth => 'Crecimiento Espiritual';
	@override String get other => 'Otro';
	@override String get work => 'Trabajo/Carrera';
	@override String get organizeTitle => 'Organizar Categorías';
	@override String get organizeSubtitle => 'Arrastra para reordenar categorías. Toca para editar o eliminar.';
	@override String entriesCount({required Object count}) => '${count} entradas';
	@override String get categoryNameLabel => 'Nombre de Categoría';
	@override String get categoryNameHint => 'Ingresa nombre de categoría';
	@override String deleteConfirm({required Object name, required Object fallback}) => '¿Estás seguro de que quieres eliminar "${name}"?\n\nLas entradas en esta categoría se moverán a "${fallback}".';
}

// Path: journal.form
class _TranslationsJournalFormEs extends TranslationsJournalFormEn {
	_TranslationsJournalFormEs._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get title => 'Título';
	@override String get titleHint => 'Dale un título a tu entrada...';
	@override String get titleRequired => 'Por favor ingresa un título';
	@override String get content => 'Contenido';
	@override String get contentHint => 'Escribe sobre tu experiencia de oración, pensamientos u oraciones respondidas...';
	@override String get contentRequired => 'Por favor ingresa algún contenido';
	@override String get relatedPrayer => 'Oración Relacionada (Opcional)';
	@override String get relatedPrayerHint => 'Selecciona una oración relacionada con esta entrada';
	@override String get category => 'Categoría';
	@override String get date => 'Fecha';
	@override String get mood => '¿Cómo te sientes?';
	@override String get save => 'Guardar Entrada';
	@override String get cancel => 'Cancelar';
}

// Path: journal.actions
class _TranslationsJournalActionsEs extends TranslationsJournalActionsEn {
	_TranslationsJournalActionsEs._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get move => 'Mover a Categoría';
	@override String get delete => 'Eliminar';
	@override String get edit => 'Editar';
}

// Path: dashboard.edit.blockNames
class _TranslationsDashboardEditBlockNamesEs extends TranslationsDashboardEditBlockNamesEn {
	_TranslationsDashboardEditBlockNamesEs._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get totalPrayers => 'Oraciones Totales';
	@override String get answeredPrayers => 'Oraciones Respondidas';
	@override String get unanswered => 'Sin Responder';
	@override String get prayerStreak => 'Racha de Oración';
	@override String get weeklyActivity => 'Actividad Semanal';
}

// Path: dashboard.edit.blockTypes
class _TranslationsDashboardEditBlockTypesEs extends TranslationsDashboardEditBlockTypesEn {
	_TranslationsDashboardEditBlockTypesEs._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get counter => 'Contador';
	@override String get streak => 'Racha';
	@override String get chart => 'Gráfico';
}

// Path: dashboard.edit.blockValues
class _TranslationsDashboardEditBlockValuesEs extends TranslationsDashboardEditBlockValuesEn {
	_TranslationsDashboardEditBlockValuesEs._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String days({required Object count}) => '${count} días';
	@override String get chartView => 'Vista de gráfico';
}

// Path: dashboard.layout.blockNames
class _TranslationsDashboardLayoutBlockNamesEs extends TranslationsDashboardLayoutBlockNamesEn {
	_TranslationsDashboardLayoutBlockNamesEs._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get totalPrayers => 'Oraciones Totales';
	@override String get answered => 'Respondidas';
	@override String get unanswered => 'Sin Responder';
	@override String get streak => 'Racha';
	@override String get weekly => 'Semanal';
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
			'settings.sections.appearance' => 'Apariencia',
			'settings.sections.dashboard' => 'Panel',
			'settings.sections.prayers' => 'Oraciones',
			'settings.sections.journal' => 'Diario',
			'settings.sections.data' => 'Datos',
			'settings.options.theme' => 'Tema',
			'settings.options.themeSubtitle' => 'Predeterminado del sistema',
			'settings.options.dailyReminder' => 'Recordatorio Diario',
			'settings.options.dailyReminderSubtitle' => 'Recordarme orar diariamente',
			'settings.options.defaultView' => 'Vista Predeterminada',
			'settings.options.defaultViewSubtitle' => 'Mostrar todas las estadísticas',
			'settings.options.autoArchive' => 'Auto-archivar Respondidas',
			'settings.options.autoArchiveSubtitle' => 'Mover oraciones respondidas al archivo después de 7 días',
			'settings.options.defaultFilter' => 'Filtro Predeterminado',
			'settings.options.defaultFilterSubtitle' => 'Mostrar oraciones activas',
			'settings.options.privateMode' => 'Modo Privado',
			'settings.options.privateModeSubtitle' => 'Requerir autenticación para ver el diario',
			'settings.options.backupRestore' => 'Copia de Seguridad y Restauración',
			'settings.options.backupRestoreSubtitle' => 'Exportar o importar tus datos',
			'settings.options.clearData' => 'Borrar Todos los Datos',
			'settings.options.clearDataConfirm' => 'Esto eliminará permanentemente todas tus oraciones y entradas del diario. Esta acción no se puede deshacer.',
			'titles.home' => 'Inicio',
			'titles.dashboardAdd' => 'Agregar Bloque al Panel',
			'titles.dashboardEdit' => 'Editar Bloque del Panel',
			'titles.dashboardLayout' => 'Organizar Panel',
			'titles.prayersAdd' => 'Agregar Oración',
			'titles.prayersEdit' => 'Editar Oración',
			'titles.prayersShare' => 'Compartir Oraciones',
			'titles.journalAdd' => 'Agregar Entrada al Diario',
			'titles.journalEdit' => 'Editar Entrada del Diario',
			'titles.journalOrganize' => 'Organizar Diario',
			'content.dashboard' => 'Panel',
			'content.prayers' => 'Oraciones',
			'content.journal' => 'Diario',
			'about.title' => 'Una App de Diario de Oración Flutter',
			'about.by' => 'por Baptist Missions OS',
			'about.description' => 'Un diario de oración personal para registrar tus oraciones, ver las respuestas y crecer en tu camino de fe.',
			'about.version' => 'Versión',
			'about.openSource' => 'Código Abierto',
			'about.copyright' => '© 2026 Baptist Missions OS',
			'support.title' => '¿Necesitas Ayuda?',
			'support.description' => 'Si necesitas ayuda con Baptist Missions OS, por favor contáctanos a través de nuestros canales de soporte:',
			'support.channels.email' => 'Correo',
			'support.channels.discord' => 'Discord',
			'support.channels.facebook' => 'Facebook',
			'support.channels.gab' => 'Gab',
			'support.channels.github' => 'GitHub',
			'support.channels.matrix' => 'Matrix',
			'support.channels.irc' => 'IRC Libera.Chat',
			'support.quickTips' => 'Consejos Rápidos',
			'dashboard.stats.totalPrayers' => 'Oraciones Totales',
			'dashboard.stats.allTimePrayers' => 'Oraciones de todos los tiempos',
			'dashboard.stats.answered' => 'Respondidas',
			'dashboard.stats.prayersAnswered' => 'Oraciones respondidas',
			'dashboard.stats.unanswered' => 'Sin Responder',
			'dashboard.stats.stillPraying' => 'Sigue orando',
			'dashboard.stats.streak' => 'Racha de Días',
			'dashboard.stats.dayPrayerStreak' => 'Racha de oración por días',
			'dashboard.stats.thisWeek' => 'Esta Semana',
			'dashboard.stats.thisMonth' => 'Este Mes',
			'dashboard.empty' => 'Aún no hay estadísticas. Agrega bloques para ver tus estadísticas de oración.',
			'dashboard.quickActions' => 'Acciones Rápidas',
			'dashboard.iPrayedToday' => 'Oré Hoy',
			'dashboard.add.selectBlockType' => 'Seleccionar Tipo de Bloque',
			'dashboard.add.selectBlockTypeSubtitle' => 'Elige un bloque de estadísticas para agregar a tu panel',
			'dashboard.add.tipRearrange' => 'Puedes reorganizar los bloques más tarde usando la opción Diseño en el menú.',
			'dashboard.edit.title' => 'Editar Bloques del Panel',
			'dashboard.edit.subtitle' => 'Toca un bloque para editar su configuración o eliminarlo',
			'dashboard.edit.typeLabel' => 'Tipo',
			'dashboard.edit.blockNames.totalPrayers' => 'Oraciones Totales',
			'dashboard.edit.blockNames.answeredPrayers' => 'Oraciones Respondidas',
			'dashboard.edit.blockNames.unanswered' => 'Sin Responder',
			'dashboard.edit.blockNames.prayerStreak' => 'Racha de Oración',
			'dashboard.edit.blockNames.weeklyActivity' => 'Actividad Semanal',
			'dashboard.edit.blockTypes.counter' => 'Contador',
			'dashboard.edit.blockTypes.streak' => 'Racha',
			'dashboard.edit.blockTypes.chart' => 'Gráfico',
			'dashboard.edit.blockValues.days' => ({required Object count}) => '${count} días',
			'dashboard.edit.blockValues.chartView' => 'Vista de gráfico',
			'dashboard.layout.title' => 'Organizar Bloques',
			'dashboard.layout.subtitle' => 'Arrastra y suelta para reordenar los bloques del panel',
			'dashboard.layout.blockNames.totalPrayers' => 'Oraciones Totales',
			'dashboard.layout.blockNames.answered' => 'Respondidas',
			'dashboard.layout.blockNames.unanswered' => 'Sin Responder',
			'dashboard.layout.blockNames.streak' => 'Racha',
			'dashboard.layout.blockNames.weekly' => 'Semanal',
			'dashboard.blockTypes.counter' => 'Bloque Contador',
			'dashboard.blockTypes.counterDesc' => 'Muestra un conteo simple de oraciones',
			'dashboard.blockTypes.streak' => 'Bloque Racha',
			'dashboard.blockTypes.streakDesc' => 'Muestra tu racha de oración',
			'dashboard.blockTypes.chart' => 'Bloque Gráfico',
			'dashboard.blockTypes.chartDesc' => 'Gráfico visual de estadísticas de oración',
			'dashboard.blockTypes.list' => 'Lista Reciente',
			'dashboard.blockTypes.listDesc' => 'Lista de oraciones recientes',
			'dashboard.blockTypes.category' => 'Desglose por Categoría',
			'dashboard.blockTypes.categoryDesc' => 'Oraciones agrupadas por categoría',
			'dashboard.blockTypes.rate' => 'Tasa de Respuestas',
			'dashboard.blockTypes.rateDesc' => 'Porcentaje de oraciones respondidas',
			'prayers.tabs.unanswered' => 'Sin Responder',
			'prayers.tabs.active' => 'Activas',
			'prayers.tabs.answered' => 'Respondidas',
			'prayers.newPrayer' => 'Nueva Oración',
			'prayers.addToJournal' => 'Agregar al Diario',
			'prayers.markAnswered' => 'Marcar Respondida',
			'prayers.empty.unanswered' => 'No hay oraciones sin responder',
			'prayers.empty.active' => 'No hay oraciones activas',
			'prayers.empty.answered' => 'Aún no hay oraciones respondidas',
			'prayers.empty.keepPraying' => '¡Sigue orando! Dios responde en Su tiempo.',
			'prayers.empty.tapToAdd' => 'Toca + para agregar una nueva oración',
			'prayers.delete.title' => '¿Eliminar Oración?',
			'prayers.delete.confirm' => ({required Object title}) => '¿Estás seguro de que quieres eliminar "${title}"?',
			'prayers.form.title' => 'Título',
			'prayers.form.description' => 'Descripción',
			'prayers.form.category' => 'Categoría',
			'prayers.form.status' => 'Estado',
			'prayers.form.date' => 'Fecha',
			'prayers.form.tags' => 'Etiquetas',
			'prayers.form.save' => 'Guardar Oración',
			'prayers.form.cancel' => 'Cancelar',
			'prayers.form.titleRequired' => 'Por favor ingresa un título',
			'prayers.form.descriptionRequired' => 'Por favor ingresa una descripción',
			'prayers.edit.title' => 'Editar Oración',
			'prayers.categories.family' => 'Familia',
			'prayers.categories.health' => 'Salud',
			'prayers.categories.finances' => 'Finanzas',
			'prayers.categories.work' => 'Trabajo/Carrera',
			'prayers.categories.spiritual' => 'Crecimiento Espiritual',
			'prayers.categories.friends' => 'Amigos',
			'prayers.categories.missions' => 'Misiones',
			'prayers.categories.other' => 'Otro',
			'prayers.share.selectAll' => 'Seleccionar Todo',
			'prayers.share.selected' => 'seleccionado(s)',
			'prayers.share.selectedCount' => ({required Object count}) => '(${count})',
			'prayers.share.exportFormat' => 'Formato de Exportación',
			'prayers.share.copy' => 'Copiar',
			'prayers.share.share' => 'Compartir',
			'prayers.share.text' => 'Texto',
			'prayers.share.json' => 'JSON',
			'prayers.share.csv' => 'CSV',
			'journal.empty' => 'Aún no hay entradas en el diario. ¡Empieza a escribir tus oraciones!',
			'journal.newEntry' => 'Nueva Entrada',
			'journal.categories.title' => 'Categorías',
			'journal.categories.uncategorized' => 'Sin Categoría',
			'journal.categories.addNew' => 'Nueva Categoría',
			'journal.categories.defaultCategory' => 'Categoría Predeterminada',
			'journal.categories.answeredPrayers' => 'Oraciones Respondidas',
			'journal.categories.dailyDevotion' => 'Devoción Diaria',
			'journal.categories.health' => 'Salud',
			'journal.categories.missions' => 'Misiones',
			'journal.categories.family' => 'Familia',
			'journal.categories.spiritualGrowth' => 'Crecimiento Espiritual',
			'journal.categories.other' => 'Otro',
			'journal.categories.work' => 'Trabajo/Carrera',
			'journal.categories.organizeTitle' => 'Organizar Categorías',
			'journal.categories.organizeSubtitle' => 'Arrastra para reordenar categorías. Toca para editar o eliminar.',
			'journal.categories.entriesCount' => ({required Object count}) => '${count} entradas',
			'journal.categories.categoryNameLabel' => 'Nombre de Categoría',
			'journal.categories.categoryNameHint' => 'Ingresa nombre de categoría',
			'journal.categories.deleteConfirm' => ({required Object name, required Object fallback}) => '¿Estás seguro de que quieres eliminar "${name}"?\n\nLas entradas en esta categoría se moverán a "${fallback}".',
			'journal.form.title' => 'Título',
			'journal.form.titleHint' => 'Dale un título a tu entrada...',
			'journal.form.titleRequired' => 'Por favor ingresa un título',
			'journal.form.content' => 'Contenido',
			'journal.form.contentHint' => 'Escribe sobre tu experiencia de oración, pensamientos u oraciones respondidas...',
			'journal.form.contentRequired' => 'Por favor ingresa algún contenido',
			'journal.form.relatedPrayer' => 'Oración Relacionada (Opcional)',
			'journal.form.relatedPrayerHint' => 'Selecciona una oración relacionada con esta entrada',
			'journal.form.category' => 'Categoría',
			'journal.form.date' => 'Fecha',
			'journal.form.mood' => '¿Cómo te sientes?',
			'journal.form.save' => 'Guardar Entrada',
			'journal.form.cancel' => 'Cancelar',
			'journal.actions.move' => 'Mover a Categoría',
			'journal.actions.delete' => 'Eliminar',
			'journal.actions.edit' => 'Editar',
			'common.save' => 'Guardar',
			'common.done' => 'Hecho',
			'common.cancel' => 'Cancelar',
			'common.delete' => 'Eliminar',
			'common.edit' => 'Editar',
			'common.add' => 'Agregar',
			'common.remove' => 'Eliminar',
			'common.move' => 'Mover',
			'common.search' => 'Buscar',
			'common.filter' => 'Filtrar',
			'common.sort' => 'Ordenar',
			'common.close' => 'Cerrar',
			'common.confirm' => 'Confirmar',
			'common.yes' => 'Sí',
			'common.no' => 'No',
			'common.tip' => 'Consejo',
			'common.none' => 'Ninguno',
			'common.today' => 'Hoy',
			'common.yesterday' => 'Ayer',
			'common.daysAgo' => ({required Object count}) => 'Hace ${count} días',
			'common.weeksAgo' => ({required Object count}) => 'Hace ${count} semanas',
			'common.monthsAgo' => ({required Object count}) => 'Hace ${count} meses',
			'common.yearsAgo' => ({required Object count}) => 'Hace ${count} años',
			'common.deleteConfirmTitle' => '¿Eliminar?',
			'common.clearConfirmTitle' => '¿Borrar Todos los Datos?',
			'common.dataCleared' => 'Todos los datos borrados',
			'hints.prayerTip' => '¡Puedes cambiar el estado a "Respondida" en cualquier momento para ver cómo Dios actúa!',
			'hints.journalTip' => 'Escribir en el diario te ayuda a reflexionar sobre tu viaje espiritual y ver cómo Dios está trabajando en tu vida.',
			'hints.reorder' => 'Mantén presionado y arrastra el control para reordenar',
			'hints.reorderCategories' => 'Mantén presionado y arrastra el control para reordenar las categorías',
			'moods.grateful' => 'Agradecido',
			'moods.peaceful' => 'Pacífico',
			'moods.hopeful' => 'Esperanzado',
			'moods.excited' => 'Emocionado',
			'moods.anxious' => 'Ansioso',
			'moods.sad' => 'Triste',
			'status.unanswered' => 'Sin Responder',
			'status.active' => 'Activa',
			'status.answered' => 'Respondida',
			_ => null,
		};
	}
}
