import 'package:favorite_books/core/init/theme/dark/color_scheme_dark.dart';

import 'text_theme_dark.dart';

abstract class IDarkTheme {
  TextThemeDark get textThemeDark => TextThemeDark.instance;
  ColorSchemeDark get colorSchemeDark => ColorSchemeDark.instance;
}
