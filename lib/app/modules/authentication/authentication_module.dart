import 'package:luguel/app/modules/authentication/interfaces/i_resend_code_store.dart';
import 'package:luguel/app/modules/authentication/stores/resend_code_store.dart';
import 'package:luguel/app/modules/authentication/interfaces/i_forgot_password_store.dart';
import 'package:luguel/app/modules/authentication/pages/recovery_code_page.dart';
import 'package:luguel/app/modules/authentication/stores/forgot_password_store.dart';
import 'package:luguel/app/modules/authentication/pages/access_options_page.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:luguel/app/modules/authentication/pages/create_account_page.dart';
import 'package:luguel/app/modules/authentication/pages/forgot_password_page.dart';
import 'package:luguel/app/modules/authentication/pages/login_page.dart';

class AuthenticationModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton<IResendCodeStore>((i) => ResendCodeStore()),
    Bind.lazySingleton<IForgotPasswordStore>((i) => ForgotPasswordStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => const AccessOptionsPage()),
    ChildRoute('/create_account', child: (_, args) => const CreateAccountPage()),
    ChildRoute('/login', child: (_, args) => const LoginPage()),
    ChildRoute('/forgot_password', child: (_, args) => const ForgotPasswordPage()),
    ChildRoute('/recovery_code', child: (_, args) => const RecoveryCodePage()),
  ];

}