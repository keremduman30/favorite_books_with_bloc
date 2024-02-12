import 'package:flutter_dotenv/flutter_dotenv.dart';

extension StringExtension on String {
  String get env => dotenv.get(this);

  String get capital =>
      length > 0 ? this[0].toUpperCase() + substring(1).toLowerCase() : "";

  String? get validator {
    if (isEmpty) {
      return " Bu alan bos bırakılamaz";
    } else {
      return null;
    }
  }

}
