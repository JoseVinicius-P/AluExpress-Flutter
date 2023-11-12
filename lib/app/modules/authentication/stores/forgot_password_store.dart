import 'package:flutter_triple/flutter_triple.dart';
import 'package:luguel/app/modules/authentication/interfaces/i_forgot_password_store.dart';

class ForgotPasswordStore extends Store<int> implements IForgotPasswordStore{
  static const int emailMethod = 0;
  static const int smsMethod = 1;

  ForgotPasswordStore() : super(5);

  @override
  void selectContactMethod(int contactMethod) {
    update(contactMethod);
  }



}