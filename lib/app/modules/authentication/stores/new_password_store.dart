import 'package:flutter/cupertino.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:luguel/app/modules/authentication/interfaces/i_new_password_store.dart';

class NewPasswordStore extends Store<List<String>> implements INewPasswordStore{
  static const int passwordIndex = 0;
  static const int confirmPasswordIndex = 1;

  @override
  late TextEditingController passwordController = TextEditingController();
  @override
  late TextEditingController confirmPasswordController = TextEditingController();

  NewPasswordStore() : super(["", ""]);

  @override
  void setPassword(String password) {
    List<String> newList = state;
    newList[passwordIndex] = password;
    update(List.from(newList));
    passwordController.text = password;
  }

  @override
  void setConfirmationPassword(String confirmationPassword) {
    List<String> newList = state;
    newList[confirmPasswordIndex] = confirmationPassword;
    update(List.from(newList));
    confirmPasswordController.text = confirmationPassword;
  }

  @override
  bool arePasswordsSame(List<String> passwords) {
    if(passwords.length == 2 && passwords[passwordIndex] != "" && passwords[confirmPasswordIndex] != ""){
      return passwords[passwordIndex] == passwords[confirmPasswordIndex];
    }else{
      return false;
    }
  }

}