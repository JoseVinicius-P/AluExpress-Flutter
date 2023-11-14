import 'dart:async';

import 'package:flutter_triple/flutter_triple.dart';
import 'package:luguel/app/modules/authentication/interfaces/i_resend_code_store.dart';

class ResendCodeStore extends Store<int> implements IResendCodeStore{

  Timer? _timer;

  ResendCodeStore() : super(60);

  @override
  void startCountdown(int seconds) {
    update(seconds);
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
        if (state < 1) {
          timer.cancel();
        } else {
          update(state - 1);
        }
    });
  }

}