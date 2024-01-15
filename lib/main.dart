import 'package:flu/data/network/mock_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:flu/data/network/Movie_services.dart';
import 'package:flu/domain/movies_repository.dart';
import 'package:flu/res/app_colors/app_colors.dart';

import 'res/routes/routes.dart';

GetIt getIt = GetIt.instance;
void main() {
  getIt.registerLazySingleton<MoviesRepository>(() => MovieServices());
  // getIt.registerLazySingleton<MoviesRepository>(() => MockServices());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.blue),
        useMaterial3: true,
      ),
      getPages: Routes.appRoutes(),
    );
  }
}
