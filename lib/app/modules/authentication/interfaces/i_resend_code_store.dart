import 'package:flutter_triple/flutter_triple.dart';

abstract class IResendCodeStore extends Store<int>{
  IResendCodeStore(super.initialState);

  void startCountdown();
}