import 'package:flutter/cupertino.dart';
import 'package:flutter_triple/flutter_triple.dart';

abstract class INewPasswordStore extends Store<List<String>>{
  late TextEditingController passwordController;
  late TextEditingController confirmPasswordController;

  INewPasswordStore(super.initialState);

  void setPassword(String password);
  void setConfirmationPassword(String confirmationPassword);
  bool arePasswordsSame(List<String> passwords);
}