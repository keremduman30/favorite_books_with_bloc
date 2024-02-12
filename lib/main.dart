import 'package:favorite_books/core/constant/app/env_keys.dart';
import 'package:favorite_books/core/init/navigation/navigator_route.dart';
import 'package:favorite_books/core/init/theme/app_thema_dark.dart';
import 'package:favorite_books/features/home/view/home_view.dart';
import 'package:favorite_books/locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';

final GlobalKey<NavigatorState> appKey = GlobalKey<NavigatorState>();

void main() async {
  await _init();
  runApp(const MyApp());
}

Future<void> _init() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: "env/.env.development");
  await Hive.initFlutter();
  await Hive.openBox(EnvKeys.storage_key);
  setupLocator();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Favorite Books',
            onGenerateRoute: NavigationRoute.instance.generateRoute,
            theme: AppThemeDark.instance.theme,
            navigatorKey: appKey,
            home: const HomeView(),
          );
        });
  }
}
