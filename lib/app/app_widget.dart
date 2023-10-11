import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Slidy',
      routerDelegate: Modular.routerDelegate,
      routeInformationParser: Modular.routeInformationParser,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
        textTheme: const TextTheme(
          titleMedium: TextStyle(fontSize: 40, color: Colors.white),
          titleLarge: TextStyle(fontSize: 70, color: Colors.green, fontWeight: FontWeight.bold),
          labelSmall: TextStyle(fontSize: 15, color: Colors.white),
        ),
      ),
    );
  }
}