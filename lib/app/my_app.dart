import 'package:clean_cinema/app/presentation/routes/app_routes.dart';
import 'package:clean_cinema/app/presentation/routes/routes.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: Routes.splash,
      routes: appRoutes,
    );
  }
}
