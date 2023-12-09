import 'package:luguel/app/modules/houses/houses_page.dart';
import 'package:luguel/app/modules/houses/houses_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HousesModule extends Module {
  @override
  final List<Bind> binds = [Bind.lazySingleton((i) => HousesStore()),];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => HousesPage()),
  ];

}