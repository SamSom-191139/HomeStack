// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for French (`fr`).
class AppLocalizationsFr extends AppLocalizations {
  AppLocalizationsFr([String locale = 'fr']) : super(locale);

  @override
  String get appName => 'Homestack';

  @override
  String get tagline => 'Faites vos courses ensemble. Gérez mieux.';

  @override
  String get navShopping => 'Courses';

  @override
  String get navPantry => 'Garde-manger';

  @override
  String get navHousehold => 'Foyer';

  @override
  String get navProfile => 'Profil';

  @override
  String get currencyDzd => 'DZD';
}
