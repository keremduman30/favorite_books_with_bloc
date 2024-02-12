import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LocalGetxSnackBar {
  static LocalGetxSnackBar? _instace;
  static LocalGetxSnackBar get instance {
    _instace ??= LocalGetxSnackBar._init();
    return _instace!;
  }

  LocalGetxSnackBar._init();
  SnackbarController localeGetSnackBar({String? message, bool? successful}) {
    return Get.snackbar(
      "Uyarı",
      message ?? "",
      icon: successful ?? false
          ? const Icon(Icons.check, color: Colors.white)
          : const Icon(Icons.cancel, color: Colors.white),     
      snackPosition: SnackPosition.TOP,
      backgroundColor: successful ?? false
          ? const Color.fromARGB(255, 8, 81, 93)
          : Colors.red,
      borderRadius: 10,
      margin: const EdgeInsets.all(10),
      colorText: Colors.white,
      duration: const Duration(milliseconds: 1200),
      isDismissible: true,
      forwardAnimationCurve: Curves.easeOutBack,
    );
  }
}
