import 'package:flutter_triple/flutter_triple.dart';

abstract class IVerifyCodeStore extends Store<String>{
  IVerifyCodeStore(super.initialState);

  void setCode(String code);
}