import 'package:favorite_books/features/favorite/view/favorite_view.dart';
import 'package:flutter/material.dart';

import '../../../features/home/view/home_view.dart';
import 'navigation_constant.dart';

class NavigationRoute {
  static NavigationRoute? _instace;
  static NavigationRoute get instance {
    return _instace ??= NavigationRoute._init();
  }

  NavigationRoute._init();

  Route<dynamic> generateRoute(RouteSettings args) {
    switch (args.name) {
      case NavigationConstant.home:
        return normalNavigate(const HomeView());
      case NavigationConstant.favorite:
        return normalNavigate(const FavoriteView());

      default:
        return normalNavigate(const Center(child: Text("Page Not found")));
    }
  }

  MaterialPageRoute normalNavigate(Widget widget) {
    return MaterialPageRoute(builder: (context) => widget);
  }
}
