import 'package:flutter/material.dart';

import 'core/theme/theme.dart';
import 'l10n/app_localizations.dart';

class HomeStackApp extends StatelessWidget {
  const HomeStackApp({
    super.key,
    this.locale = const Locale('en'),
    this.themeMode = ThemeMode.system,
  });

  final Locale locale;
  final ThemeMode themeMode;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Homestack',
      debugShowCheckedModeBanner: false,
      locale: locale,
      supportedLocales: AppLocalizations.supportedLocales,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      theme: HsTheme.light(locale: locale),
      darkTheme: HsTheme.dark(locale: locale),
      themeMode: themeMode,
      home: const Scaffold(
        body: Center(
          child: Text('Homestack scaffold ready'),
        ),
      ),
    );
  }
}
