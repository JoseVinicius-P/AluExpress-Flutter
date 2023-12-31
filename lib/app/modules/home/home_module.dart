import 'package:luguel/app/modules/home/home_page.dart';
import 'package:luguel/app/modules/home/home_store.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:luguel/app/modules/houses/houses_module.dart';

class HomeModule extends Module {
  @override
  final List<Bind> binds = [Bind.lazySingleton((i) => HomeStore()),];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => const HomePage()),
    ModuleRoute('/houses', module: HousesModule())
  ];

}