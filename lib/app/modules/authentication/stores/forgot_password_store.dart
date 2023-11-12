import 'package:flutter_triple/flutter_triple.dart';
import 'package:luguel/app/modules/authentication/interfaces/i_forgot_password_store.dart';

class ForgotPasswordStore extends Store<int> implements IForgotPasswordStore{

  ForgotPasswordStore() : super(0);

  @override
  int get emailMethod => 0;

  @override
  int get smsMethod => 1;

  @override
  void selectContactMethod(int contactMethod) {
    update(contactMethod);
  }



}