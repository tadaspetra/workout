import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:test/core/ui/constants/border_radius.dart';
import 'package:test/core/ui/constants/breakpoints.dart';
import 'package:test/core/ui/constants/durations.dart';
import 'package:test/core/ui/constants/neutral_colors.dart';
import 'package:test/core/ui/constants/shadows.dart';
import 'package:test/core/ui/constants/spacing.dart';
import 'package:test/core/ui/constants/text_styles.dart';

/// AppTheme is a class that builds a theme for the app.
/// By default this will support light and dark mode.
///
/// you can access different theme extensions from the context
///
/// ```dart
/// context.textStyles.standard
/// context.neutralColors.neutral50
/// context.borderRadius.md
/// context.spacing.md
/// context.durations.duration200
/// context.shadows.sm
/// ```
///
/// Some are also just instances of the class, so you can access them directly without context:
///
/// ```dart
/// CustomSpacing.instance.md
/// CustomDurations.instance.duration200
/// ```
class AppTheme {
  static ThemeData buildTheme(Brightness brightness) {
    final isDark = brightness == Brightness.dark;
    final neutralColors = NeutralColors();
    final textStyles = CustomTextStyles();
    final borderRadius = CustomBorderRadius();
    final breakpoints = CustomBreakpoints();
    final shadows = CustomShadows();

    return ThemeData(
      brightness: brightness,
      colorScheme: ColorScheme(
        brightness: brightness,
        surface: isDark ? neutralColors.neutral900 : neutralColors.neutral100,
        primary: isDark ? neutralColors.neutral50 : neutralColors.neutral950,
        onPrimary: isDark ? neutralColors.neutral950 : neutralColors.neutral50,
        secondary: isDark ? neutralColors.neutral50 : neutralColors.neutral950,
        onSecondary:
            isDark ? neutralColors.neutral950 : neutralColors.neutral50,
        error: Colors.red.shade400,
        onError: neutralColors.neutral50,
        onSurface: isDark ? neutralColors.neutral50 : neutralColors.neutral950,
        surfaceTint:
            isDark ? neutralColors.neutral900 : neutralColors.neutral100,
      ),
      pageTransitionsTheme: const PageTransitionsTheme(
        builders: <TargetPlatform, PageTransitionsBuilder>{
          // Set the predictive back transitions for Android.
          TargetPlatform.android: PredictiveBackPageTransitionsBuilder(),
        },
      ),
      scaffoldBackgroundColor:
          isDark ? neutralColors.neutral900 : neutralColors.neutral100,
      appBarTheme: AppBarTheme(
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor:
            isDark ? neutralColors.neutral50 : neutralColors.neutral950,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          // For iOS: dark icons in light mode, light icons in dark mode
          statusBarBrightness: isDark ? Brightness.dark : Brightness.light,
          // For Android: dark icons in light mode, light icons in dark mode
          statusBarIconBrightness: isDark ? Brightness.light : Brightness.dark,
        ),
      ),
      dividerTheme: DividerThemeData(
        color: isDark ? neutralColors.neutral800 : neutralColors.neutral200,
      ),
      textTheme: TextTheme(
        bodyLarge: textStyles.lg.copyWith(
          color: isDark ? neutralColors.neutral50 : neutralColors.neutral950,
        ),
        bodyMedium: textStyles.standard.copyWith(
          color: isDark ? neutralColors.neutral50 : neutralColors.neutral950,
        ),
        titleMedium: textStyles.standard.copyWith(
          color: isDark ? neutralColors.neutral50 : neutralColors.neutral950,
        ),
        headlineLarge: textStyles.xxl.copyWith(
          color: neutralColors.neutral950,
          fontWeight: FontWeight.bold,
        ),
      ),
      iconTheme: IconThemeData(
        color: isDark ? neutralColors.neutral50 : neutralColors.neutral950,
      ),
      extensions: [
        neutralColors,
        textStyles,
        borderRadius,
        breakpoints,
        shadows,
      ],
      useMaterial3: true,
      splashFactory: NoSplash.splashFactory,
      highlightColor: Colors.white.withValues(alpha: .1),
      dropdownMenuTheme: DropdownMenuThemeData(
        textStyle: TextStyle(
          color: isDark ? neutralColors.neutral50 : neutralColors.neutral950,
        ),
        menuStyle: MenuStyle(
          backgroundColor: WidgetStatePropertyAll(
            isDark ? neutralColors.neutral900 : neutralColors.neutral100,
          ),
          surfaceTintColor: WidgetStatePropertyAll(Colors.transparent),
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor:
              isDark ? neutralColors.neutral900 : neutralColors.neutral100,
          border: OutlineInputBorder(
            borderSide: BorderSide(
              color:
                  isDark ? neutralColors.neutral800 : neutralColors.neutral200,
            ),
            borderRadius: borderRadius.md,
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color:
                  isDark ? neutralColors.neutral800 : neutralColors.neutral200,
            ),
            borderRadius: borderRadius.md,
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color:
                  isDark ? neutralColors.neutral800 : neutralColors.neutral200,
            ),
            borderRadius: borderRadius.md,
          ),
          contentPadding: EdgeInsets.symmetric(
            horizontal: CustomSpacing.instance.md,
            vertical: CustomSpacing.instance.sm,
          ),
        ),
      ),
      popupMenuTheme: PopupMenuThemeData(
        color: isDark ? neutralColors.neutral900 : neutralColors.neutral100,
        textStyle: TextStyle(
          color: isDark ? neutralColors.neutral50 : neutralColors.neutral950,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(borderRadius: borderRadius.md),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          shape: RoundedRectangleBorder(borderRadius: borderRadius.md),
          side: BorderSide(
            color: isDark ? neutralColors.neutral800 : neutralColors.neutral200,
          ),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          shape: RoundedRectangleBorder(borderRadius: borderRadius.md),
        ),
      ),
    );
  }
}

extension ThemeDataX on BuildContext {
  ThemeData get theme => Theme.of(this);

  CustomTextStyles get textStyles =>
      Theme.of(this).extension<CustomTextStyles>()!;

  NeutralColors get neutralColors => Theme.of(this).extension<NeutralColors>()!;

  CustomBorderRadius get borderRadius =>
      Theme.of(this).extension<CustomBorderRadius>()!;

  CustomBreakpoints get breakpoints =>
      Theme.of(this).extension<CustomBreakpoints>()!;

  CustomDurations get durations => CustomDurations.instance;

  CustomSpacing get spacing => CustomSpacing.instance;

  CustomShadows get shadows => Theme.of(this).extension<CustomShadows>()!;
}
