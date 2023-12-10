import 'package:luguel/app/modules/houses/details_house_page.dart';
import 'package:luguel/app/modules/houses/details_house_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HousesModule extends Module {
  @override
  final List<Bind> binds = [Bind.lazySingleton((i) => DetailsHouseStore()),];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => DetailsHousePage()),
  ];

}