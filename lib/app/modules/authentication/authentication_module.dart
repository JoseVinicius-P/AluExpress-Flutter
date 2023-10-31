import 'package:luguel/app/modules/authentication/pages/access_options_page.dart';
import 'package:luguel/app/modules/authentication/authentication_store.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:luguel/app/modules/authentication/pages/create_account_page.dart';
import 'package:luguel/app/modules/authentication/pages/forgot_password_page.dart';
import 'package:luguel/app/modules/authentication/pages/login_page.dart';

class AuthenticationModule extends Module {
  @override
  final List<Bind> binds = [Bind.lazySingleton((i) => AuthenticationStore()),];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => const AccessOptionsPage()),
    ChildRoute('/create_account', child: (_, args) => const CreateAccountPage()),
    ChildRoute('/login', child: (_, args) => const LoginPage()),
    ChildRoute('/forgot_password', child: (_, args) => const ForgotPasswordPage()),
  ];

}