// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appName => 'Homestack';

  @override
  String get tagline => 'Shop together. Stock smarter.';

  @override
  String get navShopping => 'Shopping';

  @override
  String get navPantry => 'Pantry';

  @override
  String get navHousehold => 'Household';

  @override
  String get navProfile => 'Profile';

  @override
  String get currencyDzd => 'DZD';
}
