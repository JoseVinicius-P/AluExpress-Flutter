import 'package:luguel/app/modules/authentication/pages/access_options_page.dart';
import 'package:luguel/app/modules/authentication/authentication_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AuthenticationModule extends Module {
  @override
  final List<Bind> binds = [Bind.lazySingleton((i) => AuthenticationStore()),];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => const AccessOptionsPage()),
  ];

}