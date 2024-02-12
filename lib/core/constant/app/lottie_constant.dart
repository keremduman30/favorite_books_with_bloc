import 'package:flutter/cupertino.dart';
import 'package:lottie/lottie.dart';

enum LottiePathEnum { splash, alarm, earthquake, listeningArea, warning, warning2, bag2, emptyBag ,noData}

extension LottiePathEnumExtension on LottiePathEnum {
  String? get rawValue {
    switch (this) {
      case LottiePathEnum.splash:
        return _pathValue("splash");
      default:
    }
    return null;
  }

  Widget get toWidgetLottie => Lottie.asset(rawValue!, filterQuality: FilterQuality.high, fit: BoxFit.fill, repeat: true);

  String _pathValue(String path) {
    return "assets/lottie/$path.json";
  }
}
