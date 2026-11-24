// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Arabic (`ar`).
class AppLocalizationsAr extends AppLocalizations {
  AppLocalizationsAr([String locale = 'ar']) : super(locale);

  @override
  String get appName => 'Homestack';

  @override
  String get tagline => 'تسوّقوا معًا. نظّموا مخزونكم بذكاء.';

  @override
  String get navShopping => 'التسوق';

  @override
  String get navPantry => 'المخزن';

  @override
  String get navHousehold => 'العائلة';

  @override
  String get navProfile => 'حسابي';

  @override
  String get currencyDzd => 'دج';
}
