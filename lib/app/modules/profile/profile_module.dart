import 'package:luguel/app/modules/profile/pages/fill_profile_page.dart';
import 'package:luguel/app/modules/profile/profile_page.dart';
import 'package:luguel/app/modules/profile/profile_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ProfileModule extends Module {
  @override
  final List<Bind> binds = [Bind.lazySingleton((i) => ProfileStore()),];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => FillProfilePage()),
  ];

}