import 'package:flutter/material.dart';

extension ContextExtension on BuildContext {
  MediaQueryData get mediaQuery => MediaQuery.of(this);
}

extension MediaQueryExtension on BuildContext {
  double get height => mediaQuery.size.height;
  double get width => mediaQuery.size.width;

  double get lowValue => height * 0.01;
  double get lowValuePlus => height * 0.018;
  double get normalValue => height * 0.02;
  double get normalPlus => height * 0.03;
  double get mediumValue => height * 0.04;
  double get mediumValuePlus => height * 0.08;
  double get highValue => height * 0.1;
  double get highPlus => height * 0.2;

  double get loginLalue1 => width * 0.8;
}

extension MediaquerySize on BuildContext {
  double dymaicHeight(double value) => mediaQuery.size.height * (value / 100);
  double dymaicWidth(double value) => mediaQuery.size.width * (value / 100);

}

extension ThemeExtension on BuildContext {
  ThemeData get theme => Theme.of(this);
  TextTheme get textThem => theme.textTheme;
  ColorScheme get colors => theme.colorScheme;
}

//paddingler vermek için
extension PaddingExtensionAll on BuildContext {
  EdgeInsets get paddingLow => EdgeInsets.all(lowValue);
  EdgeInsets get paddingLowPlus => EdgeInsets.all(lowValuePlus);
  EdgeInsets get paddingNormal => EdgeInsets.all(normalValue);
  EdgeInsets get paddingNormalPlus => EdgeInsets.all(normalPlus);
  EdgeInsets get paddingMedium => EdgeInsets.all(mediumValue);
  EdgeInsets get paddingHigh => EdgeInsets.all(highValue);
  EdgeInsets get paddingHighPlus => EdgeInsets.all(highPlus);
}

extension PaddingExtensionSymetric on BuildContext {
  EdgeInsets get paddingLowVertical => EdgeInsets.symmetric(vertical: lowValue);
  EdgeInsets get paddingLowPlusVertical => EdgeInsets.symmetric(vertical: lowValuePlus);

  EdgeInsets get paddingNormalVertical => EdgeInsets.symmetric(vertical: normalValue);
  EdgeInsets get paddingNormalPlusVertical => EdgeInsets.symmetric(vertical: normalPlus);
  EdgeInsets get paddingMediumVertical => EdgeInsets.symmetric(vertical: mediumValue);
  EdgeInsets get paddingHighVertical => EdgeInsets.symmetric(vertical: highValue);

  EdgeInsets get paddingLowHorizontal => EdgeInsets.symmetric(horizontal: lowValue);
  EdgeInsets get paddingLowPlusHorizontal => EdgeInsets.symmetric(horizontal: lowValuePlus);
  EdgeInsets get paddingNormalHorizontal => EdgeInsets.symmetric(horizontal: normalValue);
  EdgeInsets get paddingMediumHorizontal => EdgeInsets.symmetric(horizontal: mediumValue);
  EdgeInsets get paddingHighHorizontal => EdgeInsets.symmetric(horizontal: highValue);
}
