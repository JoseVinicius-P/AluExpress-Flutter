import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:responsive_builder/responsive_builder.dart';

import 'app/app_module.dart';
import 'app/app_widget.dart';

void main(){
  runApp(
    //Para facilitar implementação de responsividade
    ResponsiveApp(
      builder: (context) =>
        ModularApp(
          module: AppModule(),
          child: AppWidget()
        )
    )
  );
}