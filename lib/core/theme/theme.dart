import 'package:flutter/material.dart';

/// Spacing scale and layout constants from the Homestack design system.
abstract final class HsSpacing {
  static const double xs = 4;
  static const double sm = 8;
  static const double md = 12;
  static const double lg = 16;
  static const double screenPadding = 20;
  static const double xl = 24;
  static const double xxl = 32;
  static const double xxxl = 48;

  static const double minTouchTarget = 48;
  static const double syncBannerHeight = 32;
  static const double buttonHeightL = 56;
  static const double buttonHeightM = 48;
  static const double buttonHeightS = 36;
}

/// Corner radii used across Homestack components.
abstract final class HsRadii {
  static const double image = 12;
  static const double button = 14;
  static const double input = 14;
  static const double card = 20;
  static const double bottomNavTop = 24;
  static const double sheetTop = 28;
  static const double pill = 999;

  static const BorderRadius imageBorder = BorderRadius.all(Radius.circular(image));
  static const BorderRadius buttonBorder = BorderRadius.all(Radius.circular(button));
  static const BorderRadius inputBorder = BorderRadius.all(Radius.circular(input));
  static const BorderRadius cardBorder = BorderRadius.all(Radius.circular(card));
  static const BorderRadius pillBorder = BorderRadius.all(Radius.circular(pill));
  static const BorderRadius sheetTopBorder = BorderRadius.vertical(
    top: Radius.circular(sheetTop),
  );
  static const BorderRadius bottomNavTopBorder = BorderRadius.vertical(
    top: Radius.circular(bottomNavTop),
  );
}

/// Elevation shadows (Light mode only; Dark mode relies on surface tiers).
abstract final class HsElevation {
  static const List<BoxShadow> none = <BoxShadow>[];

  /// Subtle card shadow in Light mode (y=2, blur=8, 8% black).
  static const List<BoxShadow> e1Light = <BoxShadow>[
    BoxShadow(
      color: Color(0x14000000),
      offset: Offset(0, 2),
      blurRadius: 8,
    ),
  ];

  /// Floating sheet / FAB shadow in Light mode (y=8, blur=24, 12% black).
  static const List<BoxShadow> e2Light = <BoxShadow>[
    BoxShadow(
      color: Color(0x1F000000),
      offset: Offset(0, 8),
      blurRadius: 24,
    ),
  ];

  static List<BoxShadow> card(BuildContext context) =>
      Theme.of(context).brightness == Brightness.dark ? none : e1Light;

  static List<BoxShadow> floating(BuildContext context) =>
      Theme.of(context).brightness == Brightness.dark ? none : e2Light;
}

/// Motion durations that respect the system "Reduce Motion" setting.
abstract final class HsMotion {
  static const Duration checkBounce = Duration(milliseconds: 150);
  static const Duration pageTransition = Duration(milliseconds: 250);
  static const Duration rowTransition = Duration(milliseconds: 250);
  static const Duration bottomSheet = Duration(milliseconds: 300);
  static const Duration splashLogo = Duration(milliseconds: 600);

  static const Curve standardCurve = Curves.easeOut;

  /// Returns [Duration.zero] (or a short fade) when Reduce Motion is active.
  static Duration resolve(
    BuildContext context,
    Duration normal, {
    Duration reduced = const Duration(milliseconds: 120),
  }) {
    return MediaQuery.disableAnimationsOf(context) ? reduced : normal;
  }
}

/// Semantic item states used across Shopping List, Pantry, and Low Stock.
/// Labels are intentionally NOT hardcoded here so they come from `.arb` files.
enum HsItemVisualState {
  pending,
  checked,
  inStock,
  low,
  out,
  pendingSync,
}

/// Color tokens for Light and Dark modes exposed via [ThemeExtension].
@immutable
class HsColors extends ThemeExtension<HsColors> {
  const HsColors({
    required this.primary,
    required this.primaryPressed,
    required this.primaryContainer,
    required this.onPrimary,
    required this.accent,
    required this.accentContainer,
    required this.warning,
    required this.warningContainer,
    required this.error,
    required this.errorContainer,
    required this.success,
    required this.background,
    required this.surface,
    required this.surfaceVariant,
    required this.outline,
    required this.textPrimary,
    required this.textSecondary,
    required this.textDisabled,
    required this.imageOverlay,
    required this.bottomNavSurface,
  });

  final Color primary;
  final Color primaryPressed;
  final Color primaryContainer;
  final Color onPrimary;
  final Color accent;
  final Color accentContainer;
  final Color warning;
  final Color warningContainer;
  final Color error;
  final Color errorContainer;
  final Color success;
  final Color background;
  final Color surface;
  final Color surfaceVariant;
  final Color outline;
  final Color textPrimary;
  final Color textSecondary;
  final Color textDisabled;
  final Color imageOverlay;
  final Color bottomNavSurface;

  /// Light mode palette.
  static const HsColors light = HsColors(
    primary: Color(0xFF2E7D5B),
    primaryPressed: Color(0xFF256A4C),
    primaryContainer: Color(0xFFE3F3EA),
    onPrimary: Color(0xFFFFFFFF),
    accent: Color(0xFFF59E0B),
    accentContainer: Color(0xFFFEF3C7),
    warning: Color(0xFFEA580C),
    warningContainer: Color(0xFFFFEDD5),
    error: Color(0xFFDC2626),
    errorContainer: Color(0xFFFEE2E2),
    success: Color(0xFF16A34A),
    background: Color(0xFFF7F5F0),
    surface: Color(0xFFFFFFFF),
    surfaceVariant: Color(0xFFEFECE5),
    outline: Color(0xFFE2DED5),
    textPrimary: Color(0xFF1F2937),
    textSecondary: Color(0xFF6B7280),
    textDisabled: Color(0xFFA8A29E),
    imageOverlay: Color(0x00000000),
    bottomNavSurface: Color(0xEBFFFFFF), // 92% white soft glass
  );

  /// Dark mode palette (surface tiers instead of inverted colors or shadows).
  static const HsColors dark = HsColors(
    primary: Color(0xFF4CC38A),
    primaryPressed: Color(0xFF3DAE78),
    primaryContainer: Color(0xFF17332A),
    onPrimary: Color(0xFF06251A),
    accent: Color(0xFFFBBF24),
    accentContainer: Color(0xFF3A2C0B),
    warning: Color(0xFFFB923C),
    warningContainer: Color(0xFF3B2210),
    error: Color(0xFFF87171),
    errorContainer: Color(0xFF3F1717),
    success: Color(0xFF4ADE80),
    background: Color(0xFF0F1412),
    surface: Color(0xFF171D1A),
    surfaceVariant: Color(0xFF1F2723),
    outline: Color(0xFF2C3731),
    textPrimary: Color(0xFFECF2EE),
    textSecondary: Color(0xFF9AA8A0),
    textDisabled: Color(0xFF5E6B64),
    imageOverlay: Color(0x14000000), // 8% subtle dark overlay for photos
    bottomNavSurface: Color(0xFF171D1A),
  );

  /// Household avatar color swatches used in Create Household.
  static const List<Color> householdSwatches = <Color>[
    Color(0xFF2E7D5B),
    Color(0xFF2563EB),
    Color(0xFFF59E0B),
    Color(0xFFEA580C),
    Color(0xFF7C3AED),
    Color(0xFF0D9488),
  ];

  /// Returns foreground color, background container color, and icon for a state.
  ({Color foreground, Color background, IconData icon}) styleForState(
    HsItemVisualState state,
  ) {
    return switch (state) {
      HsItemVisualState.pending => (
          foreground: accent,
          background: accentContainer,
          icon: Icons.schedule_rounded,
        ),
      HsItemVisualState.checked => (
          foreground: success,
          background: primaryContainer,
          icon: Icons.check_circle_rounded,
        ),
      HsItemVisualState.inStock => (
          foreground: primary,
          background: primaryContainer,
          icon: Icons.inventory_2_outlined,
        ),
      HsItemVisualState.low => (
          foreground: warning,
          background: warningContainer,
          icon: Icons.warning_amber_rounded,
        ),
      HsItemVisualState.out => (
          foreground: error,
          background: errorContainer,
          icon: Icons.cancel_outlined,
        ),
      HsItemVisualState.pendingSync => (
          foreground: textSecondary,
          background: surfaceVariant,
          icon: Icons.cloud_upload_outlined,
        ),
    };
  }

  @override
  HsColors copyWith({
    Color? primary,
    Color? primaryPressed,
    Color? primaryContainer,
    Color? onPrimary,
    Color? accent,
    Color? accentContainer,
    Color? warning,
    Color? warningContainer,
    Color? error,
    Color? errorContainer,
    Color? success,
    Color? background,
    Color? surface,
    Color? surfaceVariant,
    Color? outline,
    Color? textPrimary,
    Color? textSecondary,
    Color? textDisabled,
    Color? imageOverlay,
    Color? bottomNavSurface,
  }) {
    return HsColors(
      primary: primary ?? this.primary,
      primaryPressed: primaryPressed ?? this.primaryPressed,
      primaryContainer: primaryContainer ?? this.primaryContainer,
      onPrimary: onPrimary ?? this.onPrimary,
      accent: accent ?? this.accent,
      accentContainer: accentContainer ?? this.accentContainer,
      warning: warning ?? this.warning,
      warningContainer: warningContainer ?? this.warningContainer,
      error: error ?? this.error,
      errorContainer: errorContainer ?? this.errorContainer,
      success: success ?? this.success,
      background: background ?? this.background,
      surface: surface ?? this.surface,
      surfaceVariant: surfaceVariant ?? this.surfaceVariant,
      outline: outline ?? this.outline,
      textPrimary: textPrimary ?? this.textPrimary,
      textSecondary: textSecondary ?? this.textSecondary,
      textDisabled: textDisabled ?? this.textDisabled,
      imageOverlay: imageOverlay ?? this.imageOverlay,
      bottomNavSurface: bottomNavSurface ?? this.bottomNavSurface,
    );
  }

  @override
  HsColors lerp(ThemeExtension<HsColors>? other, double t) {
    if (other is! HsColors) return this;
    return HsColors(
      primary: Color.lerp(primary, other.primary, t)!,
      primaryPressed: Color.lerp(primaryPressed, other.primaryPressed, t)!,
      primaryContainer: Color.lerp(primaryContainer, other.primaryContainer, t)!,
      onPrimary: Color.lerp(onPrimary, other.onPrimary, t)!,
      accent: Color.lerp(accent, other.accent, t)!,
      accentContainer: Color.lerp(accentContainer, other.accentContainer, t)!,
      warning: Color.lerp(warning, other.warning, t)!,
      warningContainer: Color.lerp(warningContainer, other.warningContainer, t)!,
      error: Color.lerp(error, other.error, t)!,
      errorContainer: Color.lerp(errorContainer, other.errorContainer, t)!,
      success: Color.lerp(success, other.success, t)!,
      background: Color.lerp(background, other.background, t)!,
      surface: Color.lerp(surface, other.surface, t)!,
      surfaceVariant: Color.lerp(surfaceVariant, other.surfaceVariant, t)!,
      outline: Color.lerp(outline, other.outline, t)!,
      textPrimary: Color.lerp(textPrimary, other.textPrimary, t)!,
      textSecondary: Color.lerp(textSecondary, other.textSecondary, t)!,
      textDisabled: Color.lerp(textDisabled, other.textDisabled, t)!,
      imageOverlay: Color.lerp(imageOverlay, other.imageOverlay, t)!,
      bottomNavSurface: Color.lerp(bottomNavSurface, other.bottomNavSurface, t)!,
    );
  }
}

/// Typography tokens supporting Plus Jakarta Sans (EN/FR) and IBM Plex Sans Arabic (AR).
@immutable
class HsTypography extends ThemeExtension<HsTypography> {
  const HsTypography({
    required this.display,
    required this.titleL,
    required this.titleM,
    required this.titleS,
    required this.bodyL,
    required this.bodyM,
    required this.label,
    required this.price,
  });

  final TextStyle display;
  final TextStyle titleL;
  final TextStyle titleM;
  final TextStyle titleS;
  final TextStyle bodyL;
  final TextStyle bodyM;
  final TextStyle label;
  final TextStyle price;

  static const String latinFontFamily = 'Plus Jakarta Sans';
  static const String arabicFontFamily = 'IBM Plex Sans Arabic';
  static const List<String> fallbackFonts = <String>[
    'Inter',
    'Noto Sans Arabic',
  ];

  factory HsTypography.from({
    required HsColors colors,
    Locale? locale,
  }) {
    final bool isArabic = locale?.languageCode == 'ar';
    final String fontFamily = isArabic ? arabicFontFamily : latinFontFamily;

    TextStyle style({
      required double size,
      required double lineHeight,
      required FontWeight weight,
      Color? color,
      List<FontFeature>? fontFeatures,
    }) {
      return TextStyle(
        fontFamily: fontFamily,
        fontFamilyFallback: fallbackFonts,
        fontSize: size,
        height: lineHeight / size,
        fontWeight: weight,
        color: color ?? colors.textPrimary,
        fontFeatures: fontFeatures,
      );
    }

    return HsTypography(
      display: style(size: 32, lineHeight: 40, weight: FontWeight.w700),
      titleL: style(size: 24, lineHeight: 32, weight: FontWeight.w700),
      titleM: style(size: 20, lineHeight: 28, weight: FontWeight.w600),
      titleS: style(size: 16, lineHeight: 24, weight: FontWeight.w600),
      bodyL: style(size: 16, lineHeight: 24, weight: FontWeight.w400),
      bodyM: style(size: 14, lineHeight: 20, weight: FontWeight.w400),
      label: style(size: 12, lineHeight: 16, weight: FontWeight.w600),
      price: style(
        size: 16,
        lineHeight: 24,
        weight: FontWeight.w700,
        fontFeatures: const <FontFeature>[FontFeature.tabularFigures()],
      ),
    );
  }

  TextTheme toMaterialTextTheme() {
    return TextTheme(
      displaySmall: display,
      headlineMedium: titleL,
      titleLarge: titleM,
      titleMedium: titleS,
      bodyLarge: bodyL,
      bodyMedium: bodyM,
      labelMedium: label,
      labelLarge: label.copyWith(fontSize: 14, height: 20 / 14),
    );
  }

  @override
  HsTypography copyWith({
    TextStyle? display,
    TextStyle? titleL,
    TextStyle? titleM,
    TextStyle? titleS,
    TextStyle? bodyL,
    TextStyle? bodyM,
    TextStyle? label,
    TextStyle? price,
  }) {
    return HsTypography(
      display: display ?? this.display,
      titleL: titleL ?? this.titleL,
      titleM: titleM ?? this.titleM,
      titleS: titleS ?? this.titleS,
      bodyL: bodyL ?? this.bodyL,
      bodyM: bodyM ?? this.bodyM,
      label: label ?? this.label,
      price: price ?? this.price,
    );
  }

  @override
  HsTypography lerp(ThemeExtension<HsTypography>? other, double t) {
    if (other is! HsTypography) return this;
    return HsTypography(
      display: TextStyle.lerp(display, other.display, t)!,
      titleL: TextStyle.lerp(titleL, other.titleL, t)!,
      titleM: TextStyle.lerp(titleM, other.titleM, t)!,
      titleS: TextStyle.lerp(titleS, other.titleS, t)!,
      bodyL: TextStyle.lerp(bodyL, other.bodyL, t)!,
      bodyM: TextStyle.lerp(bodyM, other.bodyM, t)!,
      label: TextStyle.lerp(label, other.label, t)!,
      price: TextStyle.lerp(price, other.price, t)!,
    );
  }
}

/// Main Homestack theme builder for MaterialApp.
abstract final class HsTheme {
  static ThemeData light({Locale? locale}) =>
      _build(colors: HsColors.light, brightness: Brightness.light, locale: locale);

  static ThemeData dark({Locale? locale}) =>
      _build(colors: HsColors.dark, brightness: Brightness.dark, locale: locale);

  static ThemeData _build({
    required HsColors colors,
    required Brightness brightness,
    Locale? locale,
  }) {
    final HsTypography typography = HsTypography.from(
      colors: colors,
      locale: locale,
    );
    final bool isDark = brightness == Brightness.dark;
    final String fontFamily = locale?.languageCode == 'ar'
        ? HsTypography.arabicFontFamily
        : HsTypography.latinFontFamily;

    final ColorScheme colorScheme = ColorScheme(
      brightness: brightness,
      primary: colors.primary,
      onPrimary: colors.onPrimary,
      primaryContainer: colors.primaryContainer,
      onPrimaryContainer: colors.primary,
      secondary: colors.accent,
      onSecondary: colors.onPrimary,
      secondaryContainer: colors.accentContainer,
      onSecondaryContainer: colors.accent,
      error: colors.error,
      onError: Colors.white,
      errorContainer: colors.errorContainer,
      onErrorContainer: colors.error,
      surface: colors.surface,
      onSurface: colors.textPrimary,
      surfaceContainerHighest: colors.surfaceVariant,
      onSurfaceVariant: colors.textSecondary,
      outline: colors.outline,
      outlineVariant: colors.outline,
    );

    return ThemeData(
      useMaterial3: true,
      brightness: brightness,
      fontFamily: fontFamily,
      colorScheme: colorScheme,
      scaffoldBackgroundColor: colors.background,
      textTheme: typography.toMaterialTextTheme(),
      dividerColor: colors.outline,
      materialTapTargetSize: MaterialTapTargetSize.padded,
      extensions: <ThemeExtension<dynamic>>[
        colors,
        typography,
      ],
      appBarTheme: AppBarTheme(
        backgroundColor: colors.background,
        foregroundColor: colors.textPrimary,
        elevation: 0,
        scrolledUnderElevation: 0,
        centerTitle: false,
        titleTextStyle: typography.titleL,
      ),
      cardTheme: CardThemeData(
        color: colors.surface,
        elevation: 0,
        margin: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: HsRadii.cardBorder,
          side: BorderSide(color: colors.outline, width: 1),
        ),
      ),
      dividerTheme: DividerThemeData(
        color: colors.outline,
        thickness: 1,
        space: 1,
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: colors.surfaceVariant,
        hintStyle: typography.bodyM.copyWith(color: colors.textSecondary),
        labelStyle: typography.bodyM.copyWith(color: colors.textSecondary),
        errorStyle: typography.label.copyWith(color: colors.error),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: HsSpacing.lg,
          vertical: HsSpacing.md + 2,
        ),
        border: OutlineInputBorder(
          borderRadius: HsRadii.inputBorder,
          borderSide: BorderSide(color: colors.outline),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: HsRadii.inputBorder,
          borderSide: BorderSide(color: colors.outline),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: HsRadii.inputBorder,
          borderSide: BorderSide(color: colors.primary, width: 1.5),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: HsRadii.inputBorder,
          borderSide: BorderSide(color: colors.error),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: HsRadii.inputBorder,
          borderSide: BorderSide(color: colors.error, width: 1.5),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: colors.primary,
          foregroundColor: colors.onPrimary,
          disabledBackgroundColor: colors.surfaceVariant,
          disabledForegroundColor: colors.textDisabled,
          elevation: 0,
          minimumSize: const Size(HsSpacing.minTouchTarget, HsSpacing.buttonHeightM),
          padding: const EdgeInsets.symmetric(horizontal: HsSpacing.screenPadding),
          shape: const RoundedRectangleBorder(borderRadius: HsRadii.buttonBorder),
          textStyle: typography.titleS,
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: colors.textPrimary,
          disabledForegroundColor: colors.textDisabled,
          minimumSize: const Size(HsSpacing.minTouchTarget, HsSpacing.buttonHeightM),
          padding: const EdgeInsets.symmetric(horizontal: HsSpacing.screenPadding),
          side: BorderSide(color: colors.outline),
          shape: const RoundedRectangleBorder(borderRadius: HsRadii.buttonBorder),
          textStyle: typography.titleS,
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: colors.primary,
          disabledForegroundColor: colors.textDisabled,
          minimumSize: const Size(HsSpacing.minTouchTarget, HsSpacing.buttonHeightM),
          shape: const RoundedRectangleBorder(borderRadius: HsRadii.buttonBorder),
          textStyle: typography.titleS,
        ),
      ),
      bottomSheetTheme: BottomSheetThemeData(
        backgroundColor: colors.surface,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        shape: const RoundedRectangleBorder(borderRadius: HsRadii.sheetTopBorder),
        showDragHandle: false,
      ),
      dialogTheme: DialogThemeData(
        backgroundColor: colors.surface,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: HsRadii.cardBorder,
          side: BorderSide(color: colors.outline),
        ),
        titleTextStyle: typography.titleM,
        contentTextStyle: typography.bodyM.copyWith(color: colors.textSecondary),
      ),
      snackBarTheme: SnackBarThemeData(
        backgroundColor: isDark ? colors.surfaceVariant : colors.textPrimary,
        contentTextStyle: typography.bodyM.copyWith(
          color: isDark ? colors.textPrimary : Colors.white,
        ),
        actionTextColor: colors.accent,
        behavior: SnackBarBehavior.floating,
        shape: const RoundedRectangleBorder(borderRadius: HsRadii.buttonBorder),
      ),
    );
  }
}

/// Convenient BuildContext getters for all shared widgets.
extension HsThemeContext on BuildContext {
  HsColors get hsColors =>
      Theme.of(this).extension<HsColors>() ?? HsColors.light;

  HsTypography get hsText =>
      Theme.of(this).extension<HsTypography>() ??
      HsTypography.from(colors: hsColors);

  bool get isDarkMode => Theme.of(this).brightness == Brightness.dark;
}