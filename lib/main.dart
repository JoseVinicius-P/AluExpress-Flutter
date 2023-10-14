import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:responsive_builder/responsive_builder.dart';

import 'app/app_module.dart';
import 'app/app_widget.dart';

void main(){
  runApp(
    //Para facilitar implementação de responsividade
    DevicePreview(
      enabled: !kReleaseMode,
        builder: (context) =>
          ResponsiveApp(
            builder: (context) =>
              ModularApp(
                  module: AppModule(),
                  child: AppWidget()
              )
        )
    )

  );
}