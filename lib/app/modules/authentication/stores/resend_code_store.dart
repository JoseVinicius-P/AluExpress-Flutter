import 'dart:async';

import 'package:flutter_triple/flutter_triple.dart';
import 'package:luguel/app/modules/authentication/interfaces/i_resend_code_store.dart';

class ResendCodeStore extends Store<int> implements IResendCodeStore{
  static const countdownSeconds = 60;

  Timer? _timer;

  ResendCodeStore() : super(countdownSeconds);

  @override
  void startCountdown() {
    update(countdownSeconds);
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