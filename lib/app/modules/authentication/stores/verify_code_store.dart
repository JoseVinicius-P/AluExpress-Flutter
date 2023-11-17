import 'package:flutter_triple/flutter_triple.dart';
import 'package:luguel/app/modules/authentication/interfaces/i_verify_code_store.dart';

class VerifyCodeStore extends Store<String> implements IVerifyCodeStore {

  VerifyCodeStore() : super("");

  @override
  void setCode(String code) {
    update(code);
  }

}