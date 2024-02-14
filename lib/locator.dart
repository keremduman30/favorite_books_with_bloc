import 'package:favorite_books/features/favorite/view_model/favorite_view_model.dart';
import 'package:favorite_books/features/home/service/home_service.dart';
import 'package:favorite_books/features/home/view_model/home_view_model.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => HomeViewModel());
  locator.registerLazySingleton(() => FavoriteViewModel());
  locator.registerLazySingleton(() => HomeService());
}
