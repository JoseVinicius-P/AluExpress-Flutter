import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:luguel/app/shared/utilities/my_colors.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Luguel',
      routerDelegate: Modular.routerDelegate,
      routeInformationParser: Modular.routeInformationParser,
      theme: ThemeData(
        splashFactory: InkRipple.splashFactory,
        splashColor: Colors.black.withOpacity(0.1),
        colorScheme: ColorScheme.fromSeed(seedColor: MyColors.primaryColor),
        scaffoldBackgroundColor: Colors.white,
        useMaterial3: true,
        textTheme: const TextTheme(
          titleMedium: TextStyle(fontSize: 40, color: Colors.white),
          titleLarge: TextStyle(fontSize: 70, color: MyColors.primaryColor, fontWeight: FontWeight.bold),
          labelSmall: TextStyle(fontSize: 15, color: Colors.white),
        ),
      ),
    );
  }
}