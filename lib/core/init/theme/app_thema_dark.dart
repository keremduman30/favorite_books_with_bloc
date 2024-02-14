import 'package:favorite_books/core/init/theme/dark/color_scheme_dark.dart';
import 'package:flutter/material.dart';

import 'app_theme.dart';
import 'dark/text_theme_dark.dart';
import 'dark/theme_dark_interface.dart';

class AppThemeDark extends AppTheme implements IDarkTheme {
  static AppThemeDark? _instace;
  static AppThemeDark get instance {
    _instace ??= AppThemeDark._init();
    return _instace!;
  }

  AppThemeDark._init();

  @override
  ThemeData get theme => ThemeData.dark().copyWith(
        appBarTheme: AppBarTheme(iconTheme: IconThemeData(color: colorScheme.onBackground), backgroundColor: colorScheme.primary),
        iconTheme: const IconThemeData(color: Colors.white),
        scaffoldBackgroundColor: colorScheme.primary,
        textTheme: textTheme(),
        colorScheme: colorScheme,
      );
  TextTheme textTheme() {
    return ThemeData.dark().textTheme.copyWith(
          displayLarge: textThemeDark.headline1,
          displayMedium: textThemeDark.headline2,
          displaySmall: textThemeDark.headline3,
          headlineMedium: textThemeDark.headline4,
          headlineSmall: textThemeDark.headline5,
          bodyMedium: textThemeDark.headline10,
          bodySmall: textThemeDark.headline8,
          titleLarge: textThemeDark.headline6,
          titleMedium: textThemeDark.headline7,
          titleSmall: textThemeDark.headline8,
          labelLarge: textThemeDark.headline9,
          labelMedium: textThemeDark.headline10,
          labelSmall: textThemeDark.headline11,
        );
  }

  ColorScheme get colorScheme => ColorScheme(
        primary: colorSchemeDark.primary,
        onPrimary: colorSchemeDark.onPrimary,
        secondary: colorSchemeDark.secondary,
        onSecondary: Colors.grey.shade600,
        onTertiary: Colors.orange,
        outline: Colors.green,
        tertiary: const Color.fromARGB(255, 251, 251, 251),
        onSecondaryContainer: const Color.fromRGBO(52, 53, 65, 1),
        // onPrimary: const Color.fromARGB(255, 72, 71, 71),
        onSurface: Colors.grey.shade600,
        background: const Color.fromARGB(255, 72, 71, 71),
        error: Colors.red,
        surface: const Color.fromARGB(255, 251, 251, 251),
        onBackground: const Color.fromARGB(255, 254, 254, 253),
        onError: const Color.fromARGB(255, 15, 15, 15),
        brightness: Brightness.light,
      );

  @override
  TextThemeDark get textThemeDark => TextThemeDark.instance;

  @override
  ColorSchemeDark get colorSchemeDark => ColorSchemeDark.instance;
}
