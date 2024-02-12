import 'package:flutter/material.dart';

class ColorSchemeDark {
  static ColorSchemeDark? _instace;
  static ColorSchemeDark get instance {
    _instace ??= ColorSchemeDark._init();
    return _instace!;
  }

  ColorSchemeDark._init();
  final primary = const Color(0xff192328);
  final onPrimary = const Color(0xff1E91F0);
  final secondary = const Color.fromARGB(255, 255, 255, 255);
  final onSecondary = const Color(0xffACA5FA);
  final onSecondaryContainer = const Color(0xffFBA267);
  final surfe = const Color.fromARGB(255, 255, 255, 255);
  final linear = const [Color(0xff1C8226), Color(0xff89FF86)];
  final gray = Colors.grey;
  final scaffoldColor = const Color.fromRGBO(229, 229, 229, 1);
}
