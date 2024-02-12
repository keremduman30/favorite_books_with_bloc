import 'package:favorite_books/core/constant/app/env_keys.dart';
import 'package:favorite_books/core/constant/enum/local_preferences_keys.dart';
import 'package:hive_flutter/adapters.dart';

class LocaleHiveManager {
  static final LocaleHiveManager _instance = LocaleHiveManager._init();
  static LocaleHiveManager get instance => _instance;
  final Box box = Hive.box(EnvKeys.storage_key);
  LocaleHiveManager._init();

  Future<void> clearAll() async {
    await box.clear();
  }

  Future<void> setStringValue(LocalPreferencesKeys key, String value) async {
    await box.put(key.toString(), value);
  }

  Future<void> setBoolValue(LocalPreferencesKeys key, bool value) async {
    await box.put(key.toString(), value);
  }

  String getStringValue(LocalPreferencesKeys key) =>
      box.get(key.toString(), defaultValue: "");

  bool getBoolValue(LocalPreferencesKeys key) =>
      box.get(key.toString(), defaultValue: false) ?? false;
  bool getBoolValueDefaultTrue(LocalPreferencesKeys key) =>
      box.get(key.toString(), defaultValue: true);

  Future disposeHive() async {
    await box.close();
    await Hive.close();
  }

  Future clear() async {
    await box.clear();
  }
}
