import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:luguel/app/shared/my_colors.dart';
import 'package:responsive_builder/responsive_builder.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Slidy',
      useInheritedMediaQuery: true,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      routerDelegate: Modular.routerDelegate,
      routeInformationParser: Modular.routeInformationParser,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
        textTheme: TextTheme(
          titleMedium: TextStyle(fontSize: 10.sw, color: Colors.white),
          titleLarge: TextStyle(fontSize: 18.sw, color: MyColors.primaryColor, fontWeight: FontWeight.bold),
          labelSmall: TextStyle(fontSize: 4.sw, color: Colors.white),
        ),
      ),
    );
  }
}