import 'package:flutter_triple/flutter_triple.dart';

abstract class IForgotPasswordStore extends Store<int>{
  final int emailMethod = 0;
  final int smsMethod = 1;

  IForgotPasswordStore(super.initialState);

  void selectContactMethod(int contactMethod);
}