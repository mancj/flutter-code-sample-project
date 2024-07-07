import 'package:flutter/material.dart';
import 'package:flutter_sample_app/presentation/getx/app_binding.dart';
import 'package:flutter_sample_app/presentation/getx/pages/main/main_page.dart';
import 'package:flutter_sample_app/presentation/getx/pages/search_recipes/search_recipes_page.dart';
import 'package:get/get.dart';

import '../shared/resources/_ui_resources.dart';
import 'pages/splash/splash_screen_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppBinding().asyncDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Recipes app',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: "Poppins",
        useMaterial3: true,
        scaffoldBackgroundColor: UIColors.pageBg,
        primaryColor: UIColors.primary,
        filledButtonTheme: FilledButtonThemeData(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(UIColors.primary),
          ),
        ),
      ),
      initialRoute: SplashScreenPage.routeName,
      initialBinding: AppBinding(),
      getPages: [
        GetPage(
          name: SplashScreenPage.routeName,
          page: () => const SplashScreenPage(),
          binding: SplashScreenBinding(),
        ),
        GetPage(
          name: MainPage.routeName,
          page: () => const MainPage(),
          binding: MainPageBinding(),
        ),
        GetPage(
          name: SearchRecipesPage.routeName,
          page: () => const SearchRecipesPage(),
          binding: SearchRecipesPageBinding(),
        ),
      ],
      // home: BpmMeasureTestPage(),
    );
  }
}
