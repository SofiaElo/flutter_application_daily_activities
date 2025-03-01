import 'package:flutter/material.dart';
import 'package:flutter_application_1/controllers/drinks_controller.dart';
import 'package:get/get.dart';

import 'pages/home_screen.dart';
import 'controllers/activities_controller.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';

class Breakpoints {
static const sm = 640;
}

Future<void> main() async {
  await Hive.initFlutter();
  await Hive.openBox("storage");

  final ColorScheme colorScheme = ColorScheme.fromSeed(
    seedColor: Colors.purple,
  );

  final ThemeData theme = ThemeData(
    colorScheme: colorScheme,
  );

  Get.lazyPut<ActivitiesController>(() => ActivitiesController());
  Get.lazyPut<DrinksController>(() => DrinksController());

  runApp(MyApp(theme: theme));
}

class MyApp extends StatelessWidget {
  final ThemeData theme;

  MyApp({required this.theme});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: theme,
      home: HomeScreen());
  }
}



