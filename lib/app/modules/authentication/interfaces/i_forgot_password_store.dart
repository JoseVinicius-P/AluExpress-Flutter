import 'package:flutter_triple/flutter_triple.dart';

abstract class IForgotPasswordStore extends Store<int>{
  IForgotPasswordStore(super.initialState);

  void selectContactMethod(int contactMethod);
}