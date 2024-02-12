// ignore_for_file: prefer_function_declarations_over_variables

import 'package:favorite_books/main.dart';
import 'package:flutter/cupertino.dart';

import 'INavigatorService.dart';

class NavigationService extends INavigationService {
  static NavigationService? _instace;
  static NavigationService get instance {
    _instace ??= NavigationService._init();
    return _instace!;
  }

  NavigationService._init();
  final removeAllRoutes = (Route<dynamic> route) => false;

  @override
  Future<void> navigatorToPage({String? path, Object? data}) async {
    await appKey.currentState!.pushNamed(path!, arguments: data);
  }

  @override
  Future<void> navigatorToPageClear({String? path, Object? data}) async {
    await appKey.currentState!.pushNamedAndRemoveUntil(path!, removeAllRoutes, arguments: data);
  }

  @override
  Future<void> navigatorToBackClear({String? path, Object? data}) async {
    await appKey.currentState!.pushReplacementNamed(path!, arguments: data);
  }
}
